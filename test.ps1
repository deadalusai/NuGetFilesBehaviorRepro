[void] [Reflection.Assembly]::LoadWithPartialName('System.IO.Compression.FileSystem')

function TestNuget($Version) {
    Write-Host "Testing nuget.exe $Version..." -Foreground Blue

    $NuGetExePath = [IO.Path]::Combine($PSScriptRoot, "tools", $Version, "nuget.exe")
    $NuSpecPath = [IO.Path]::Combine($PSScriptRoot, "example.nuspec")
    $OutputPath = [IO.Path]::Combine($PSScriptRoot, "output", $Version)
    & $NuGetExePath pack $NuSpecPath -OutputDirectory $OutputPath

    $NuPkgPath = [IO.Path]::Combine($OutputPath, "Example.0.0.0.nupkg")
    Write-Host "Enumerating files in $NuPkgPath"
    try {
        $ZipFile = [IO.Compression.ZipFile]::OpenRead($NuPkgPath)
        foreach ($Entry in $ZipFile.Entries) {
            Write-Host $Entry.FullName -Foreground Green
        }
    }
    finally {
        if ($ZipFile) {
            $ZipFile.Dispose()
        }
    }
}

TestNuget "4.9.4"
TestNuget "5.9.1"
TestNuget "5.10.0"