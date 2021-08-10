This repo reproduces a change in handling of the `<files />` element betweeen NuGet 5.9.1 and 5.10.0.

Three versions of `nuget` are committed to this repo under `tools` to make reproducing the change easier.

Run `test.ps1` to reproduce the issue and examine the difference in the nesting of `a.dll`, `b.dll` and `c.dll` between versions.
