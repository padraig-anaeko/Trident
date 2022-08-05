# Trident
Sample SaaS Application written in .NET

## Build Commands

This is a placeholder for the build / publish commands until they are moved into a GH action.

dotnet publish .\Octopus.Trident.Web.csproj --output C:\OctopusTrident.Web -c Release --runtime win-x64 --sc false

dotnet publish .\Octopus.Trident.Database.DbUp.csproj --output C:\OctopusTrident.Database -c Release --runtime win-x64 --sc true /p:PublishSingleFile=true /p:PublishTrimmed=true 