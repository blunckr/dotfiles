# Please see http://i3wm.org/docs/userguide.html for a complete reference!

set $mod Mod4
set $alt Mod1

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font pango: Ubuntu Regular 12

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
# font pango:DejaVu Sans Mono 12

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec $HOME/bin/program-at-path.sh xfce4-terminal
bindsym $mod+t exec chromium

# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher)
# bindsym $mod+d exec dmenu_run -l 10
bindsym $mod+d exec rofi -show run -sidebar-mode
bindsym $alt+Tab exec rofi -show window -show-icons -sidebar-mode
# bindsym $mod+d exec --no-startup-id i3-dmenu-desktop
bindsym $mod+c exec xfce4-popup-clipman

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+g split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# move the currently focused window to the scratchpad
bindsym $mod+Shift+minus move scratchpad

# Show the next scratchpad window or hide the focused scratchpad window.
# If there are multiple scratchpad windows, this command cycles through them.
bindsym $mod+minus scratchpad show

# focus the child container
#bindsym $mod+d focus child

# switch to workspace
bindsym $mod+1 workspace number 1
bindsym $mod+2 workspace number 2
bindsym $mod+3 workspace number 3
bindsym $mod+4 workspace number 4
bindsym $mod+5 workspace number 5
bindsym $mod+6 workspace number 6
bindsym $mod+7 workspace number 7
bindsym $mod+8 workspace number 8
bindsym $mod+9 workspace number 9
bindsym $mod+0 workspace number 10

bindsym $mod+Ctrl+Left workspace prev
bindsym $mod+Ctrl+h workspace prev

bindsym $mod+Ctrl+Right workspace next
bindsym $mod+Ctrl+l workspace next

bindsym $mod+Ctrl+Shift+Left move container to workspace prev
bindsym $mod+Ctrl+Shift+h move container to workspace prev

bindsym $mod+Ctrl+Shift+Right move container to workspace next
bindsym $mod+Ctrl+Shift+l move container to workspace next

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace number 1
bindsym $mod+Shift+2 move container to workspace number 2
bindsym $mod+Shift+3 move container to workspace number 3
bindsym $mod+Shift+4 move container to workspace number 4
bindsym $mod+Shift+5 move container to workspace number 5
bindsym $mod+Shift+6 move container to workspace number 6
bindsym $mod+Shift+7 move container to workspace number 7
bindsym $mod+Shift+8 move container to workspace number 8
bindsym $mod+Shift+9 move container to workspace number 9
bindsym $mod+Shift+0 move container to workspace number 10

bindsym $mod+p exec i3-input -F 'rename workspace to "%s"' -P 'New name: '

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
  # These bindings trigger as soon as you enter the resize mode

  # Pressing left will shrink the window’s width.
  # Pressing right will grow the window’s width.
  # Pressing up will shrink the window’s height.
  # Pressing down will grow the window’s height.
  bindsym h resize shrink width 10 px or 10 ppt
  bindsym j resize grow height 10 px or 10 ppt
  bindsym k resize shrink height 10 px or 10 ppt
  bindsym l resize grow width 10 px or 10 ppt

  # same bindings, but for the arrow keys
  bindsym Left resize shrink width 10 px or 10 ppt
  bindsym Down resize grow height 10 px or 10 ppt
  bindsym Up resize shrink height 10 px or 10 ppt
  bindsym Right resize grow width 10 px or 10 ppt

  # back to normal: Enter or Escape
  bindsym Return mode "default"
  bindsym Escape mode "default"
}

bindsym $mod+r mode "resize"

set $mode_launcher Launch: [c]hrome [i]ncognito g[v]im [t]hunar [d]beaver [g]itg [s]lack [m]spotify
bindsym $mod+semicolon mode "$mode_launcher"

mode "$mode_launcher" {
  bindsym c exec chromium                        ; mode "default"
  bindsym i exec chromium --incognito            ; mode "default"
  bindsym v exec program-at-path.sh gvim         ; mode "default"
  bindsym t exec program-at-path.sh thunar       ; mode "default"
  bindsym d exec dbeaver                         ; mode "default"
  bindsym s exec slack                           ; mode "default"
  bindsym m exec spotify                         ; mode "default"

  bindsym Escape mode "default"
  bindsym Return mode "default"
}

mode "mouse" {

  # set your three speeds here

  set $slow 5
  set $quick 50
  set $fast 200

  # Mouse movement (quick/fine-tuned) -- vim keybindings

  bindsym h exec xdotool mousemove_relative -- -$quick 0
  bindsym j exec xdotool mousemove_relative 0 $quick
  bindsym k exec xdotool mousemove_relative -- 0 -$quick
  bindsym l exec xdotool mousemove_relative $quick 0

  # Mouse movement (quick/fine-tuned) -- arrow keys

  bindsym Left exec xdotool mousemove_relative -- -$quick 0
  bindsym Down exec xdotool mousemove_relative 0 $quick
  bindsym Up exec xdotool mousemove_relative -- 0 -$quick
  bindsym Right exec xdotool mousemove_relative $quick 0

  # Mouse movement (fast) -- vim keybindings

  bindsym Shift+h exec xdotool mousemove_relative -- -$fast 0
  bindsym Shift+j exec xdotool mousemove_relative 0 $fast
  bindsym Shift+k exec xdotool mousemove_relative -- 0 -$fast
  bindsym Shift+l exec xdotool mousemove_relative $fast 0

  # Mouse movement (fast) -- arrow keys

  bindsym Shift+Left exec xdotool mousemove_relative -- -$fast 0
  bindsym Shift+Down exec xdotool mousemove_relative 0 $fast
  bindsym Shift+Up exec xdotool mousemove_relative -- 0 -$fast
  bindsym Shift+Right exec xdotool mousemove_relative $fast 0

  # Mouse movement (slow) -- vim keybindings

  bindsym Ctrl+h exec xdotool mousemove_relative -- -$slow 0
  bindsym Ctrl+j exec xdotool mousemove_relative 0 $slow
  bindsym Ctrl+k exec xdotool mousemove_relative -- 0 -$slow
  bindsym Ctrl+l exec xdotool mousemove_relative $slow 0

  # Mouse movement (slow) -- arrow keys

  bindsym Ctrl+Left exec xdotool mousemove_relative -- -$slow 0
  bindsym Ctrl+Down exec xdotool mousemove_relative 0 $slow
  bindsym Ctrl+Up exec xdotool mousemove_relative -- 0 -$slow
  bindsym Ctrl+Right exec xdotool mousemove_relative $slow 0

  # Left Click
  bindsym f exec xdotool click 1

  # Middle Click
  bindsym d exec xdotool click 2

  # Right Click
  bindsym s exec xdotool click 3

  # Left Click-and-drag
  bindsym Shift+f exec xdotool mousedown 1

  # Middle Click-and-drag
  bindsym Shift+d exec xdotool mousedown 2

  # Right Click-and-drag
  bindsym Shift+s exec xdotool mousedown 3

  # Left Drag release
  bindsym Ctrl+f exec xdotool mouseup 1

  # Middle Drag release
  bindsym Ctrl+d exec xdotool mouseup 2

  # Right Drag release
  bindsym Ctrl+s exec xdotool mouseup 3


  # return to normal keybindings -- IMPORTANT!!

  bindsym Escape mode "default"
  bindsym Return mode "default"
  bindsym q mode "default"
}

bindsym $mod+Shift+t mode "mouse"

bindsym XF86AudioPrev exec --no-startup-id music.sh prev
bindsym $mod+n exec --no-startup-id music.sh prev

bindsym XF86AudioPlay exec --no-startup-id music.sh play
bindsym $mod+m exec --no-startup-id music.sh play

bindsym XF86AudioNext exec --no-startup-id music.sh next
bindsym $mod+comma exec --no-startup-id music.sh next

bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo +5%
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo -5%
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute alsa_output.pci-0000_00_1f.3.analog-stereo toggle

bindsym XF86Display exec --no-startup-id arandr
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute 1 toggle

# maybe do this one at launch instead
exec --no-startup-id xfce4-power-manager
exec --no-startup-id xfce4-clipman
# exec --no-startup-id dropbox start
exec --no-startup-id xset r rate 300 25
exec --no-startup-id xmodmap ~/dotfiles/xmodmap
exec --no-startup-id sct 5500
exec --no-startup-id feh --randomize --bg-fill ~/wallpapers/*
# exec --no-startup-id compton -b --no-fading-openclose

# exec --no-startup-id feh --bg-scale wallpaper/animal-collective.jpg

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
  status_command ~/dotfiles/i3-bar-wrapper.sh
  # status_command i3status
  tray_output primary
  position top

  colors {
    background #000000
    statusline #ffffff
    separator #666666

    focused_workspace  #4c7899 #6272a4 #ffffff
    active_workspace   #333333 #5f676a #ffffff
    inactive_workspace #333333 #222222 #888888
    urgent_workspace   #2f343a #ff5555 #ffffff
    binding_mode       #2f343a #900000 #ffffff
  }
}

# class                 border  backgr. text    indicator child_border
client.focused          #4c7899 #6272a4 #ffffff #8be9fd   #285577
client.focused_inactive #333333 #5f676a #ffffff #484e50   #5f676a
client.unfocused        #999999 #222222 #888888 #292d2e   #222222
client.urgent           #2f343a #ff5555 #ffffff #900000   #900000
client.placeholder      #000000 #0c0c0c #ffffff #000000   #0c0c0c

client.background       #ffffff

# GAPS
# for_window [class="^.*"] border pixel 2
# gaps inner 10
# gaps outer 0
# smart_borders on

set $mode_gaps Gaps: (o) outer, (i) inner
set $mode_gaps_outer Outer Gaps: +|-|0 (local), Shift + +|-|0 (global)
set $mode_gaps_inner Inner Gaps: +|-|0 (local), Shift + +|-|0 (global)
bindsym $mod+Shift+g mode "$mode_gaps"

mode "$mode_gaps" {
  bindsym o      mode "$mode_gaps_outer"
  bindsym i      mode "$mode_gaps_inner"
  bindsym Return mode "default"
  bindsym Escape mode "default"
}

mode "$mode_gaps_inner" {
  bindsym plus  gaps inner current plus 5
  bindsym minus gaps inner current minus 5
  bindsym 0     gaps inner current set 0

  bindsym Shift+plus  gaps inner all plus 5
  bindsym Shift+minus gaps inner all minus 5
  bindsym Shift+0     gaps inner all set 0

  bindsym Return mode "default"
  bindsym Escape mode "default"
}
mode "$mode_gaps_outer" {
  bindsym plus  gaps outer current plus 5
  bindsym minus gaps outer current minus 5
  bindsym 0     gaps outer current set 0

  bindsym Shift+plus  gaps outer all plus 5
  bindsym Shift+minus gaps outer all minus 5
  bindsym Shift+0     gaps outer all set 0

  bindsym Return mode "default"
  bindsym Escape mode "default"
}
