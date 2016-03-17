# Get password stored in a PSCredential object

Powershell has a `PSCredential` object to minimize the time a password is stored in plaintext. It can be created through the `Get-Credential` cmdlet, which will pop up a dialog to enter a username and password. It's usually a good idea to keep credentials in a `PSCredential` object for as long as possible, but at some point, you need to get to the underlying password. You can do this with the following command, assuming the credentials are stored in a variable `$cred`.

```powershell
$plaintextPassword = $cred.GetNetworkCredential().Password
```