$packageName = 'p4'
$version = 'r25.1'
$baseurl = "https://filehost.perforce.com/perforce/$version"
$url64 = "$baseurl/bin.ntx64/helix-p4-x64.exe"

# Get latest value with ((Invoke-WebRequest "$baseurl/bin.ntx64/SHA256SUMS" -UseBasicParsing).RawContent.ToString().Split() | Select-String -Pattern 'helix-p4-x64.exe' -SimpleMatch -Context 1,0 ).ToString().Trim().Split()[0]
$checksum64 = '065f348772ee33aa508bf28cf6707e40cba17ef556de48e7dda30a1f4b486719'

$packageArgs = @{
  packageName    = $packageName
  installerType	 = 'EXE'
  url64Bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  silentArgs	 = '/s /v"/qn"'
}

Install-ChocolateyPackage @packageArgs
