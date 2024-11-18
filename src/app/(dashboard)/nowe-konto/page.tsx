import NewWalletForm from "@components/NewWalletForm";

import { getUser } from "@app/api/user/get";

export default async function NewWalletPage() {
  const user = await getUser();
  
  return (
    <div>
      <NewWalletForm user_id={user.id} />
    </div>
  );
}
