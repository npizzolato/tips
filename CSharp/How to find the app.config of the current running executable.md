# How to find the app.config of the current running executable

C# executables load configuration files dynamically based on a hierarchy of file names. This can make it difficult to determine why configuration changes are not taking effect. You can view the configuration file used by the currently running executable by examining the following property:

```cs
string filename = AppDomain.CurrentDomain.SetupInformation.ConfigurationFile;
```  