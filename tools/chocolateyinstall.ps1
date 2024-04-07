$packageName = 'p4'
$version = 'r23.2'
$baseurl = "https://cdist2.perforce.com/perforce/$version"
$url64 = "$baseurl/bin.ntx64/helix-p4-x64.exe"

# Get latest value with ((Invoke-WebRequest "$baseurl/bin.ntx64/SHA256SUMS" -UseBasicParsing).RawContent.ToString().Split() | Select-String -Pattern 'helix-p4-x64.exe' -SimpleMatch -Context 1,0 ).ToString().Trim().Split()[0]
$checksum64 = '6a72b4059e422de61b8a53783067314e67bc498b8b86d2bce2c5036c6b638659'

$packageArgs = @{
  packageName    = $packageName
  installerType	 = 'EXE'
  url64Bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  silentArgs	 = '/s /v"/qn"'
}

Install-ChocolateyPackage @packageArgs
