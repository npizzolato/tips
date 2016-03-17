# Get password stored in a PSCredential object

Powershell has a `PSCredential` object to minimize the time a password is stored in plaintext. It can be created through the `Get-Credential` cmdlet, which will pop up a dialog to enter a username and password. It's usually a good idea to keep credentials in a `PSCredential` object for as long as possible, but at some point, you need to get to the underlying password. You can do this with the following command, assuming the credentials are stored in a variable `$cred`.

```powershell
$plaintextPassword = $cred.GetNetworkCredential().Password
```

If you think this should not be possible, Lee Holmes, one of the developers of Powershell, explained it like this:

> The reason we don’t make this more difficult is that you already have the credential. In security, something is either possible or impossible — “hard” is just another way of saying “possible.” We designed the GetNetworkCredential() method to give you the System.Net.NetworkCredential class required by many network classes in the .NET Framework, so we definitely want it to be possible.

He goes into more depth in his [blog post](<http://www.leeholmes.com/blog/2007/01/25/powershell-credentials-and-getnetworkcredential/>).

The password in a `PSCredential` object is stored as a `SecureString`. See "Get_Password_From_SecureString.md" for a way to get the password stored in a secure string. 