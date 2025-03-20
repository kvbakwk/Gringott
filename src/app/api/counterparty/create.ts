"use server";

import { validateTransactionCounterparty } from "@app/utils/validator";
import { Pool } from "pg";

export async function createCounterparty(name: string, userId: number) {
  const isValid: boolean = validateTransactionCounterparty(name);

  if (isValid) {
    const client: Pool = new Pool();
    await client.query(
      `INSERT INTO public.counterparty (name, user_id) VALUES ($1, $2);`,
      [name, userId]
    );
    await client.end();
  }

  return {
    createCounterparty: isValid,
    nameErr: !validateTransactionCounterparty(name),
  };
}
