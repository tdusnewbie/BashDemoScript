#!/bin/bash

character="$(zenity --entry --text="Please enter the Character")"

code="$(printf "This is your ASCII code : %d" "'$character")"

zenity --info --no-wrap --text="$code"
