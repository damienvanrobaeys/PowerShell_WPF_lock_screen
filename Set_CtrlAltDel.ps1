Param(
	[switch]$DisableLockWorkstation,
	[switch]$EnableLockWorkstation,
	[switch]$DisableTaskMgr,
	[switch]$EnableTaskMgr,		
	[switch]$DisableLogOff,
	[switch]$EnableLogOff,
	[switch]$DisableChangePWD,
	[switch]$EnableChangePWD,	
	[switch]$DisableSwitchUser,
	[switch]$EnableSwitchUser,
	[switch]$DisableAll,				
	[switch]$EnableAll		
)

$Path_System = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System'
$Path_Explorer = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer'

# Manage DisableLockWorkstation registry option
If ($DisableLockWorkstation -and $EnableLockWorkstation)
{
	Write-Warning 'Please specify DisableLockWorkstation OR EnableLockWorkstation !!!'
	return
}
ElseIf ($DisableLockWorkstation -or $EnableLockWorkstation)
	{
		If (!(Test-Path -Path $Path_System))
		{
			New-Item -Path $Path_System | Out-Null
		}	

		If($DisableLockWorkstation)
		{
			$DisableLockWorkstation_Value = 1
		}

		If ($EnableLockWorkstation)
		{
			$DisableLockWorkstation_Value = 0			
		}	

		New-ItemProperty -Path $Path_System -Name DisableLockWorkstation -Value $DisableLockWorkstation_Value -Force -ErrorAction SilentlyContinue | Out-Null					
	}


# Manage DisableTaskMgr registry option
If ($DisableTaskMgr -and $EnableTaskMgr)
{
	Write-Warning 'Please specify DisableTaskMgr OR EnableTaskMgr but not both !!!'		
	return
}
ElseIf ($DisableTaskMgr -or $EnableTaskMgr)
	{
		If (!(Test-Path -Path $Path_System))
		{
			New-Item -Path $Path_System | Out-Null
		}

		If($DisableTaskMgr)
		{
			$DisableTaskMgr_Value = 1
		}

		If ($EnableTaskMgr)
		{
			$DisableTaskMgr_Value = 0			
		}	
		
		New-ItemProperty -Path $Path_System -Name DisableTaskMgr -Value $DisableTaskMgr_Value -Force -ErrorAction SilentlyContinue | Out-Null					
	}


# Manage NoLogoff registry option	
If ($DisableLogOff -and $EnableLogOff)
{
	Write-Warning 'Please specify DisableLogOff OR EnableLogOff but not both !!!'			
	return
}		
ElseIf ($DisableLogOff -or $EnableLogOff)
	{
		If (!(Test-Path -Path $Path_Explorer))
		{
			New-Item -Path $Path_Explorer | Out-Null
		}
		
		If($DisableLogOff)
		{
			$DisableLogOff_Value = 1
		}

		If ($EnableLogOff)
		{
			$DisableLogOff_Value = 0			
		}	

		New-ItemProperty -Path $Path_Explorer -Name NoLogoff -Value $DisableLogOff_Value -Force -ErrorAction SilentlyContinue | Out-Null									
	}	


# Manage DisableChangePassword registry option	
If ($DisableChangePWD -and $EnableChangePWD)
{
	Write-Warning 'Please specify DisableChangePWD OR EnableChangePWD but not both !!!'					
	return
}	
ElseIf ($DisableChangePWD -or $EnableChangePWD)
	{
		If (!(Test-Path -Path $Path_System))
		{
			New-Item -Path $Path_System | Out-Null
		}
					
		If($DisableChangePWD)
		{
			$DisableChangePWD_Value = 1
		}

		If ($EnableChangePWD)
		{
			$DisableChangePWD_Value = 0			
		}	
		
		New-ItemProperty -Path $Path_System -Name DisableChangePassword -Value $DisableChangePWD_Value -Force -ErrorAction SilentlyContinue | Out-Null										
	}	


# Manage HideFastUserSwitching registry option		
If ($DisableSwitchUser -and $EnableSwitchUser)
{
	Write-Warning 'Please specify DisableSwitchUser OR EnableSwitchUser but not both !!!'							
	return
}		
ElseIf ($DisableSwitchUser -or $EnableSwitchUser)
	{
		If (!(Test-Path -Path $Path_System))
		{
			New-Item -Path $Path_System | Out-Null
		}
					
		If($DisableSwitchUser)
		{
			$DisableSwitchUser_Value = 1
		}

		If ($EnableChangePWD)
		{
			$DisableSwitchUser_Value = 0			
		}	
		
		New-ItemProperty -Path $Path_System -Name HideFastUserSwitching -Value $DisableSwitchUser_Value -Force -ErrorAction SilentlyContinue | Out-Null											
	}		


If ($DisableAll -and $EnableAll)
{
	Write-Warning 'Please specify DisableAll OR EnableAll but not both !!!'							
	return
}		

If ($EnableAll)
{
	If (!(Test-Path -Path $Path_System))
	{
		New-Item -Path $Path_System | Out-Null
	}
	New-ItemProperty -Path $Path_System -Name DisableLockWorkstation -Value 0 -Force -ErrorAction SilentlyContinue | Out-Null
	New-ItemProperty -Path $Path_System -Name HideFastUserSwitching -Value 0 -Force -ErrorAction SilentlyContinue | Out-Null
	New-ItemProperty -Path $Path_System -Name DisableChangePassword -Value 0 -Force -ErrorAction SilentlyContinue | Out-Null
	New-ItemProperty -Path $Path_System -Name DisableTaskMgr -Value 0 -Force -ErrorAction SilentlyContinue | Out-Null
			
	If (!(Test-Path -Path $Path_Explorer))
	{
		New-Item -Path $Path_Explorer | Out-Null
	}
	New-ItemProperty -Path $Path_Explorer -Name NoLogoff -Value 0 -Force -ErrorAction SilentlyContinue | Out-Null				
}	

If ($DisableAll)
{
	If (!(Test-Path -Path $Path_System))
	{
		New-Item -Path $Path_System | Out-Null
	}
	New-ItemProperty -Path $Path_System -Name DisableLockWorkstation -Value 1 -Force -ErrorAction SilentlyContinue | Out-Null
	New-ItemProperty -Path $Path_System -Name HideFastUserSwitching -Value 1 -Force -ErrorAction SilentlyContinue | Out-Null
	New-ItemProperty -Path $Path_System -Name DisableChangePassword -Value 1 -Force -ErrorAction SilentlyContinue | Out-Null
	New-ItemProperty -Path $Path_System -Name DisableTaskMgr -Value 1 -Force -ErrorAction SilentlyContinue | Out-Null
			
	If (!(Test-Path -Path $Path_Explorer))
	{
		New-Item -Path $Path_Explorer | Out-Null
	}
	New-ItemProperty -Path $Path_Explorer -Name NoLogoff -Value 1 -Force -ErrorAction SilentlyContinue | Out-Null				
}	




# .\Set_CtrlAltDel.ps1 -DisableLogOff -DisableChangePWD
# .\Set_CtrlAltDel.ps1 -EnableLogOff -EnableChangePWD
# .\Set_CtrlAltDel.ps1 -DisableLockWorkstation -DisableTaskMgr -DisableLogOff -DisableChangePWD
# .\Set_CtrlAltDel.ps1 -EnableLockWorkstation -EnableTaskMgr -EnableLogOff -EnableChangePWD
