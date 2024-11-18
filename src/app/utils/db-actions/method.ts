'use server'

import { Pool, QueryResult } from "pg";

export async function getMethods() {
    const client = new Pool();
    const res = await client.query(
      "SELECT id, name, cash, bank FROM public.method;"
    );
    await client.end();
  
    return res.rows.map((method) => ({
      id: parseInt(method.id),
      name: method.name,
      cash: Boolean(method.cash),
      bank: Boolean(method.bank),
    }));
}

export async function isCashMethod(id: number) {
  const client: Pool = new Pool();
  const res: QueryResult = await client.query(
    "SELECT id FROM public.method WHERE id = $1 AND cash = TRUE;",
    [id]
  );
  await client.end();
  return res.rows.length > 0;
}

export async function isBankMethod(id: number) {
  const client: Pool = new Pool();
  const res: QueryResult = await client.query(
    "SELECT id FROM public.method WHERE id = $1 AND bank = TRUE;",
    [id]
  );
  await client.end();
  return res.rows.length > 0;
}