# Get password from a SecureString

The .NET framework has a `SecureString` object which helps keep credentials from being in plaintext as long as possible. However, this is meant to prevent other people from reading the password in other contexts outside of your user account. Lee Holmes, one of the developers of Powershell, said it better than me:

> [A] SecureString doesn’t protect you from yourself (or anybody using your account,) it protects the credential from people that don’t have access to your user account (but have access to a crash dump, page file, or the like.)

<http://www.leeholmes.com/blog/2007/01/25/powershell-credentials-and-getnetworkcredential/>

From a password stored as a secure string in a `secureString` field:

```powershell
> $secureString = ConvertTo-SecureString "myPassword" -AsPlainText -Force
```

this will print out the password:
```
> [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBTR($secureString))
myPassword
```
