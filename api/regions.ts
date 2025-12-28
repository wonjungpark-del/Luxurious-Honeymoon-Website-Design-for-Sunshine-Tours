import type { VercelRequest, VercelResponse } from '@vercel/node';
import { getRegions, getRegionById, createRegion, updateRegion, deleteRegion } from './_db';

export default async function handler(req: VercelRequest, res: VercelResponse) {
  try {
    const { method, query } = req;
    const id = query.id as string | undefined;

    // GET /api/regions - List all regions
    if (method === 'GET' && !id) {
      const filters: any = {};
      if (query.country) filters.country = query.country as string;
      if (query.is_active !== undefined) filters.is_active = query.is_active === 'true';

      const regions = await getRegions(filters);
      return res.status(200).json({ success: true, data: regions });
    }

    // GET /api/regions?id=xxx - Get region by ID
    if (method === 'GET' && id) {
      const region = await getRegionById(id);
      if (!region) {
        return res.status(404).json({ success: false, error: 'Region not found' });
      }
      return res.status(200).json({ success: true, data: region });
    }

    // POST /api/regions - Create new region
    if (method === 'POST') {
      const data = req.body;
      const region = await createRegion(data);
      return res.status(201).json({ success: true, data: region });
    }

    // PUT /api/regions?id=xxx - Update region
    if (method === 'PUT' && id) {
      const data = req.body;
      const region = await updateRegion(id, data);
      return res.status(200).json({ success: true, data: region });
    }

    // DELETE /api/regions?id=xxx - Delete region
    if (method === 'DELETE' && id) {
      await deleteRegion(id);
      return res.status(200).json({ success: true, message: 'Region deleted' });
    }

    return res.status(405).json({ success: false, error: 'Method not allowed' });
  } catch (error) {
    console.error('Regions API error:', error);
    return res.status(500).json({ success: false, error: 'Internal server error' });
  }
}
