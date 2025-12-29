const { sql } = require('@vercel/postgres');
const fs = require('fs');
const path = require('path');

// This is a one-time script to update resort data
module.exports = async function handler(req, res) {
  try {
    // Security: Only allow in development or with special key
    const authKey = req.query.key;
    if (authKey !== 'update-resorts-2024') {
      return res.status(403).json({ 
        success: false, 
        error: 'Unauthorized' 
      });
    }

    if (req.method !== 'POST') {
      return res.status(405).json({ 
        success: false, 
        error: 'Method not allowed' 
      });
    }

    console.log('Starting resort data update...');

    // Read the SQL file (UPSERT version - INSERT or UPDATE)
    const sqlFilePath = path.join(process.cwd(), 'resort_upsert.sql');
    let sqlContent;
    
    try {
      sqlContent = fs.readFileSync(sqlFilePath, 'utf8');
    } catch (error) {
      return res.status(500).json({
        success: false,
        error: 'SQL file not found',
        details: error.message
      });
    }

    // Split SQL statements (each INSERT is separated by empty lines)
    const insertStatements = sqlContent
      .split(/INSERT INTO resorts/)
      .filter(stmt => stmt.trim().length > 0)
      .map(stmt => 'INSERT INTO resorts' + stmt.trim())
      .filter(stmt => !stmt.startsWith('INSERT INTO resorts--')); // Skip comments

    console.log(`Found ${insertStatements.length} INSERT statements`);

    const results = {
      total: insertStatements.length,
      success: 0,
      failed: 0,
      errors: []
    };

    // Execute each INSERT statement
    for (let i = 0; i < insertStatements.length; i++) {
      const statement = insertStatements[i];
      
      try {
        // Extract resort ID for logging
        const idMatch = statement.match(/'(resort-\d+)'/);
        const resortId = idMatch ? idMatch[1] : `statement-${i}`;
        
        console.log(`Executing ${i + 1}/${insertStatements.length}: ${resortId}`);
        
        // Execute the SQL statement
        await sql.query(statement);
        
        results.success++;
        console.log(`✓ Success: ${resortId}`);
        
      } catch (error) {
        results.failed++;
        const errorInfo = {
          index: i + 1,
          error: error.message,
          statement: statement.substring(0, 100) + '...'
        };
        results.errors.push(errorInfo);
        console.error(`✗ Failed: ${errorInfo.error}`);
      }
    }

    console.log('Resort data update completed');
    console.log(`Success: ${results.success}, Failed: ${results.failed}`);

    return res.status(200).json({
      success: true,
      message: 'Resort data update completed',
      results: results
    });

  } catch (error) {
    console.error('Update resorts error:', error);
    return res.status(500).json({
      success: false,
      error: 'Internal server error',
      details: error.message,
      stack: process.env.NODE_ENV === 'development' ? error.stack : undefined
    });
  }
};
