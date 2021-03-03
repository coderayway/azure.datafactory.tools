
$patUser = 'Private-PSLibrary'
$patToken = 'nmkxmmvdbczasdmee5xplhnpsqfr4dmejaiwlecst3iysgoq4iqq'
$securePat = ConvertTo-SecureString -String $patToken -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential($patUser, $securePat)

#not tested nuget spec
#nuget spec azure.datafactory.tools
C:\Tools\nuget spec azure.datafactory.tools
#C:\Tools\nuget pack azure.datafactory.tools.nuspec
C:\Tools\nuget sources Add -Name "DataFactory.Tools" -Source "https://mangrovedata.pkgs.visualstudio.com/MangroveDataFactory/_packaging/adf-powershell-cdci/nuget/v3/index.json" -username $patUser -password $patToken
C:\Tools\nuget push -Source "DataFactory.Tools" -ApiKey AzureDevOpsServices ".\azure.datafactory.tools.1.0.0.nupkg"

Publish-Module -Path "azure.datafactory.tools" -Repository 'DataFactory.Tools' -Credential $credential -NuGetApiKey 'nmkxmmvdbczasdmee5xplhnpsqfr4dmejaiwlecst3iysgoq4iqq' -Verbose

<#
the v2 way to install
Register-PSRepository -Name "VSTSGallery" -SourceLocation "https://mangrovedata.pkgs.visualstudio.com/MangroveDataFactory/_packaging/adf-powershell-cdci/nuget/v2/" -PublishLocation "https://mangrovedata.pkgs.visualstudio.com/MangroveDataFactory/_packaging/adf-powershell-cdci/nuget/v2/" -InstallationPolicy Trusted -credential $credential

C:\Tools\nuget.exe sources add -name 'DBAGalleryFeed' -Source 'https://mangrovedata.pkgs.visualstudio.com/MangroveDataFactory/_packaging/adf-powershell-cdci/nuget/v2' -UserName $patUser -Password $patToken


Publish-Module -Path "azure.datafactory.tools" -Repository 'VSTSGallery' -Credential $credential -NuGetApiKey 'nmkxmmvdbczasdmee5xplhnpsqfr4dmejaiwlecst3iysgoq4iqq' -Verbose

#>
