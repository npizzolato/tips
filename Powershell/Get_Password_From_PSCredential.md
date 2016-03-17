# Get password stored in a PSCredential object

Powershell has a `PSCredential` object to minimize the time a password is stored in plaintext. It can be created through the `Get-Credential` cmdlet, which will pop up a dialog to enter a username and password. It's usually a good idea to keep credentials in a `PSCredential` object for as long as possible, but at some point, you need to get to the underlying password. You can do this with the following command, assuming the credentials are stored in a variable `$cred`.

```powershell
$plaintextPassword = $cred.GetNetworkCredential().Password
```

If you think this should not be possible, Lee Holmes, one of the developers of Powershell, explained it like this:

> The reason we don’t make this more difficult is that you already have the credential. In security, something is either possible or impossible — “hard” is just another way of saying “possible.” We designed the GetNetworkCredential() method to give you the System.Net.NetworkCredential class required by many network classes in the .NET Framework, so we definitely want it to be possible.
>
> In addition, the Get-Credential cmdlet lets you pass credentials to many other things than just .NET APIs. It can be used for SQL connections, Live IDs (in a hosted Exchange scenario,) as well as anything else that needs a username and password. The Get-Credential cmdlet helps make this as secure of an operation as possible.
>
> You might point out that the password in a credential is a SecureString, so why is it so easy to get access to? To be clear, a SecureString doesn’t protect you from yourself (or anybody using your account,) it protects the credential from people that don’t have access to your user account (but have access to a crash dump, page file, or the like.)

<http://www.leeholmes.com/blog/2007/01/25/powershell-credentials-and-getnetworkcredential/>

See "Get_Password_From_SecureString.md" for a way to get the password stored in a secure string. 