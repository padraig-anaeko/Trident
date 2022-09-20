$locationOfProject = "/Users/bob/Git/Trident/src/Octopus.Trident.Web/Octopus.Trident.Web.csproj"
$projectContents = Get-Content $locationOfProject
$projectAsXML = [xml]$projectContents
$versionPrefix = $projectAsXML.Project.PropertyGroup.VersionPrefix

Write-Host "The version prefix is $versionPrefix"

$branchName = (((${env:GITHUB_REF} -replace "refs/heads/", "") -replace "feature/", "") -replace "bugfix/", "") -replace " ", ""
Write-Host "$branchName"

$channelName = "Release"
$environmentName = "Staging - Blue"
$versionNumber = $versionPrefix.${env:GITHUB_RUN_NUMBER}

if ($branchName -ne "main")
{
    $channelName = "Default"
    $environmentName = "Development"
    $versionNumber = $versionNumber-$branchName
}

Write-Host "Setting the Output Variable OctopusChannelName to $channelName"
echo "::set-output name=OctopusChannelName::$channelName"

Write-Host "Setting the Output Variable OctopusVersionNumber to $versionNumber"
echo "::set-output name=OctopusVersionNumber::$versionNumber"

Write-Host "Setting the Output Variable OctopusEnvironmentName to $environmentName"
echo "::set-output name=OctopusEnvironmentName::$environmentName"

Write-Host "Setting the Output Variable OctopusTenantName to $tenantName"
echo "::set-output name=OctopusTenantName::$tenantName"
