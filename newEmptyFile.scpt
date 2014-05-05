(*
Adds a new, empty named file at the current open window in the Finder & selects it.
If no windows are open, simply adds the file to the Desktop instead.
*)

property defaultFileName : "newFile.txt" -- change to your preferred file name...

tell me to activate -- makes display dialog frontmost momentarily.
set theFileName to text returned of (display dialog "Enter a file name:" default answer defaultFileName)

tell application "Finder"
	activate
	
	if the (count of windows) is not 0 then
		set theFolder to (folder of the front window) as text
		set theFolder to POSIX path of theFolder
	else
		set theFolder to POSIX path of (get path to desktop)
	end if
	
	set addedFile to (theFolder & theFileName)
	do shell script "touch '" & addedFile & "'"
	
	if the (count of windows) is not 0 then
		set addedFile to (POSIX file addedFile) as alias
		select addedFile
	end if
end tell
