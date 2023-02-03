#!/usr/bin/osascript

on run {keyTitle, keyValue}
  tell application "Safari"
    activate
    make new document with properties {URL:"https://github.com/settings/ssh/new"}
    repeat until (do JavaScript "document.readyState === 'complete'")
    delay .1
    end repeat
    delay 1
    display dialog "Set title to " & keyTitle & " and key to " & keyValue
    set jsResult to do JavaScript "document.getElementsByName('ssh_key[title]')[0].value = '" & keyTitle & "';"
    if jsResult is missing value then
      display dialog "Error filling out title field"
    end if
    set jsResult to do JavaScript "document.getElementsByName('ssh_key[key]')[0].value = '" & keyValue & "';"
    if jsResult is missing value then
      display dialog "Error filling out key field"
    end if
  end tell
end run
