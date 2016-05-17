# Powershell Script for eyecare:
# 1. Notification to look away from computer (20 minute interval)
# 2. Notification to blink eyes (20 minute interval)
# 3. Popup every hour to take a break (reset timers after clicking "ok")

# Create notification object
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
$objNotify = New-Object System.Windows.Forms.NotifyIcon
$objNotify.Icon = $PSScriptRoot + "\eye_icon.ico"
$objNotify.BalloonTipIcon = "Info"
$objNotify.BalloonTipTitle = "Eye Care"

$objNotify.Visible = $True

# Create popup object
$objPopup = New-Object -comobject wscript.shell

while (1) {
	# 20 minute wait from start of script
	Start-Sleep -s 1200
	
	# Notifications (last 10 seconds) for 40 minutes (10 minute interval)
	for ($i = 0; $i -le 1; $i++) {
		$objNotify.BalloonTipText = "Look away from computer!"
		$objNotify.ShowBalloonTip(10000)
		
		# After 10 minutes
		Start-Sleep -s 600
		$objNotify.BalloonTipText = "Blink 10 times!"
		$objNotify.ShowBalloonTip(10000)
		
		# After 10 minutes
		Start-Sleep -s 600
	}
	
	$objPopup_Show = $objPopup.popup("Take a break!", 0, "Eye Care", 1)
}