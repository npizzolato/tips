# Aliases in Powershell

Powershell supports adding both aliases and functions to your environment which can be loaded automatically. 

Aliases and functions are slightly different. Aliases can only be used to shorten a single command. For example, `iwr` is an alias for `Invoke-WebRequest`. You can create your own aliases, but that is all they can do.

Functions are more powerful and are necessary for what many would consider typical aliases (in Bash or something else). A function can take in zero or more arguments and executes any command. For example, you can define a function `go-home` which will execute `set-location $(gi env:userprofile)`.

## Creating Aliases and Functions

Aliases can be created using the `New-Alias` cmdlet. Simply call `New-Alias` with the alias you want to create and the command you want to create the alias for.

```powershell
PS > New-Alias e echo
```

and then call it like a normal command

```powershell
PS > e hi
hi
```

Functions can be created using the function keyword, followed by the function name and its definition. You can create a new function with no arguments like:

```powershell
PS > function test {echo hi}
PS > test
hi
```

You can add any number of parameters after the function name to specify parameters to the function.

```powershell
PS > function te($a) {echo $a}
PS > te "as"
as
```

These aliases and functions will be local to the current powershell window. To have them persist between sessions, you need to add them to your profile. 

## Adding Aliases and Functions to Your Profile

Powershell contains a file which will be loaded by each session when it starts up. This file can be found by examining the profile variable built into powershell and looking up its value.

```powershell
PS > (Get-Variable profile).Value
```

The above command will output a filename. Any commands in that file will be executed when powershell starts up a new session. To add aliases and functions to all sessions you start up, create that file, and add any aliases and functions (as shown above) to that file.
