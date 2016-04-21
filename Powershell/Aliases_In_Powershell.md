# Aliases in Powershell

Powershell supports adding both aliases and functions to your environment which can be loaded automatically. 

Aliases and functions are slightly different. Aliases can only be used to shorten a single command. For example, `iwr` is an alias for `Invoke-WebRequest`. You can create your own aliases, but that is all they can do.

Functions are more powerful and are necessary for what many would consider typical aliases (in Bash or something else). A function can take in zero or more arguments 