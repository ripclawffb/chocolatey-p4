$packageName = 'p4'
$version = 'r24.2'
$baseurl = "https://filehost.perforce.com/perforce/$version"
$url64 = "$baseurl/bin.ntx64/helix-p4-x64.exe"

# Get latest value with ((Invoke-WebRequest "$baseurl/bin.ntx64/SHA256SUMS" -UseBasicParsing).RawContent.ToString().Split() | Select-String -Pattern 'helix-p4-x64.exe' -SimpleMatch -Context 1,0 ).ToString().Trim().Split()[0]
$checksum64 = 'edb6204f09e055bb8c93ea8cc7221645c6630e3ae96c1196d4803463556ce7f8'

$packageArgs = @{
  packageName    = $packageName
  installerType	 = 'EXE'
  url64Bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  silentArgs	 = '/s /v"/qn"'
}

Install-ChocolateyPackage @packageArgs
