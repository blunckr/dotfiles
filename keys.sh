#!/bin/bash
# capsLock behave like Ctrl:                                                
setxkbmap -option ctrl:nocaps

# make short-pressed Ctrl behave like Escape:                                  
xcape -e 'Control_L=Escape'
