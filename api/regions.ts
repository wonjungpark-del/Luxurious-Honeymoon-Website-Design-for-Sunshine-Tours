import type { VercelRequest, VercelResponse } from '@vercel/node';
import { getRegions, getRegionById, createRegion, updateRegion, deleteRegion } from './db';

export default async function handler(req: VercelRequest, res: VercelResponse) {
  // CORS headers
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    return res.status(200).end();
  }

  try {
    const { id } = req.query;

    switch (req.method) {
      case 'GET':
        if (id && typeof id === 'string') {
          const region = await getRegionById(id);
          if (!region) {
            return res.status(404).json({ success: false, error: 'Region not found' });
          }
          return res.status(200).json({ success: true, data: region });
        } else {
          const { country, is_active } = req.query;
          const filters: any = {};
          if (country) filters.country = country;
          if (is_active) filters.is_active = is_active === 'true';

          const regions = await getRegions(filters);
          return res.status(200).json({ success: true, data: regions });
        }

      case 'POST':
        const newRegion = await createRegion(req.body);
        return res.status(201).json({ success: true, data: newRegion });

      case 'PUT':
        if (!id || typeof id !== 'string') {
          return res.status(400).json({ success: false, error: 'Region ID required' });
        }
        const updatedRegion = await updateRegion(id, req.body);
        return res.status(200).json({ success: true, data: updatedRegion });

      case 'DELETE':
        if (!id || typeof id !== 'string') {
          return res.status(400).json({ success: false, error: 'Region ID required' });
        }
        await deleteRegion(id);
        return res.status(200).json({ success: true });

      default:
        return res.status(405).json({ success: false, error: 'Method not allowed' });
    }
  } catch (error: any) {
    console.error('Error in regions API:', error);
    return res.status(500).json({ success: false, error: error.message });
  }
}
