﻿$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$bin = Join-Path $content 'codecity.exe'

. $tools\bins.ps1
. $tools\shortcut.ps1

Install-ChocolateyZipPackage `
    -PackageName 'codecity' `
    -Url 'http://wettel.github.io/download/codecity-win.zip' `
    -Checksum '98CB19CE685B5271E7167F424B4FBE6E786256E5844674054A2925B8FA018992' `
    -ChecksumType 'SHA256' `
    -File $content

Install-IgnoreBin `
    -Path $bin

Install-Shortcut `
    -Link 'CodeCity' `
    -Target $bin `
    -SpecialFolder 'CommonPrograms'
