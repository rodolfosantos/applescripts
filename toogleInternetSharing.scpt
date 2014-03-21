# If its on, it will turn off
# If its off, it will turn on

# Open System Preferences application
tell application "System Preferences"
	activate
end tell

# Open the Sharing preference pane
tell application "System Preferences"
	reveal (pane id "com.apple.preferences.sharing")
end tell

# Select the Internet Sharing checkbox.
tell application "System Events"
	tell process "System Preferences"
		tell window "Sharing"
			# Internet Sharing is row 7 in Mavericks.
			set _checkbox to checkbox 1 of row 7 of table 1 of scroll area 1 of group 1
			
			tell _checkbox
				
				# Recheck the checkbox.
				click _checkbox
				delay 1
			end tell
			if (exists sheet 1) then
				if (exists button "Turn Wi-Fi On" of sheet 1) then
					click button "Turn Wi-Fi On" of sheet 1
					delay 1
				end if
				click button "Start" of sheet 1
			end if
		end tell
	end tell
end tell

# Close System Preferences application
tell application "System Preferences"
	quit
end tell
