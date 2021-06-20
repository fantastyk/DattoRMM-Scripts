$SystemFile = "dbutil_2_3.sys"
$UserProfileSearch = (Get-ChildItem -Path C:\Users -Filter $SystemFile -Recurse -ErrorAction SilentlyContinue)
$TempSearch = (Get-ChildItem -Path C:\Windows\Temp -Filter $SystemFile -Recurse -ErrorAction SilentlyContinue)
try {
	if ([boolean]$UserProfileSearch -eq $true -or [boolean]$TempSearch -eq $true) {
        Write-Host '<-Start Result->'
		Write-Output "STATUS=Dell dbutil_2_3.sys file has been detected"
        Write-Host '<-End Result->'
        exit 1
	} else {
        Write-Host '<-Start Result->'
		Write-Output "STATUS=Dell dbutil_2_3.sys file not present on system"; exit 0
        Write-Host '<-End Result->'
	}
} catch {
    Write-Host '<-End Result->'
	Write-Output "STATUS=Issues occured while attempting to detect $SystemFile : $($_.Exception.Message)"
    Write-Host '<-End Result->'
    exit 1
}