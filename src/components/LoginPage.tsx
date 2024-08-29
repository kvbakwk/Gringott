"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";

import login from "@app/api/login";
import { validateEmail, validatePassword } from "@app/utils/validator";

export default function LoginPage() {
  const router = useRouter();
  const [emailErr, setEmailErr] = useState<boolean>(false);
  const [passwordErr, setPasswordErr] = useState<boolean>(false);
  const [accountErr, setAccountErr] = useState<boolean>(false);

  const handleSubmit = async (formData: FormData): Promise<void> => {
    if (
      validateEmail(formData.get("email").toString()) &&
      validatePassword(formData.get("password").toString())
    ) {
      const response = await login(
        formData.get("email").toString(),
        formData.get("password").toString(),
        formData.get("remember") ? true : false
      );
      if (!response.login) {
        setEmailErr(response.emailErr);
        setPasswordErr(response.passwordErr);
        setAccountErr(response.accountErr);
      } else {
        router.push("/");
      }
    } else {
      setEmailErr(!validateEmail(formData.get("email").toString()));
      setPasswordErr(!validatePassword(formData.get("password").toString()));
    }
  };

  return (
    <div>
      <form action={handleSubmit}>
        <input type="text" name="email" id="email" /> <br />
        <input type="password" name="password" id="password" /> <br />
        <input type="checkbox" name="remember" id="remember" /> <label htmlFor="remember">zapamietaj mnie</label><br />
        <input type="submit" value="zaloguj się" /> <br />
        {(emailErr || passwordErr || accountErr) ? <span>niepoprawne dane</span> : <></>} 
      </form>
    </div>
  );
}
