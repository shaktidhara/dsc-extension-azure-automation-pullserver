Configuration FormatDisk
{
  param ($MachineName)

  Node $MachineName
  {
	Script ConfigureFormatDisk { 
		SetScript = { 
			$disks = Get-PhysicalDisk –CanPool $true
			Initialize-Disk -Confirm:$False -PassThru | New-Partition -DriveLetter G –UseMaximumSize | Format-Volume -FileSystem NTFS -NewFileSystemLabel "DATA" -Confirm:$false			
		} 

		TestScript = { 
			Test-Path G:\ 
		} 
		GetScript = { <# This must return a hash table #> }          }   
  }
} 
