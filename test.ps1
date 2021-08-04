function TestNuget($Version) {
    Write-Host "Testing nuget.exe $Version..." -Foreground Blue

    $NuGetExePath = [IO.Path]::Combine($PSScriptRoot, "tools", $Version, "nuget.exe")
    $NuSpecPath = [IO.Path]::Combine($PSScriptRoot, "example.nuspec")
    $OutputPath = [IO.Path]::Combine($PSScriptRoot, "output", $Version)
    & $NuGetExePath pack $NuSpecPath -OutputDirectory $OutputPath -Verbosity detailed
}

TestNuget "4.9.4"
TestNuget "5.9.1"
TestNuget "5.10.0"