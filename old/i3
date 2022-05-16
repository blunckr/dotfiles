# Please see http://i3wm.org/docs/userguide.html for a complete reference!

set $mod Mod4
set $alt Mod1

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font pango: Hack Regular 12

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
# font pango:DejaVu Sans Mono 12

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec $HOME/bin/program-at-path.sh xfce4-terminal

# kill focused window
bindsym $mod+q kill

# start dmenu (a program launcher)
bindsym $mod+d exec rofi -show run -sidebar-mode
bindsym $mod+Shift+d exec xfce4-appfinder
bindsym $mod+Tab exec rofi -show window -show-icons -sidebar-mode
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

# bindsym $mod+Ctrl+Shift+Left move container to workspace prev
# bindsym $mod+Ctrl+Shift+h move container to workspace prev

# bindsym $mod+Ctrl+Shift+Right move container to workspace next
# bindsym $mod+Ctrl+Shift+l move container to workspace next

bindsym $mod+Ctrl+Shift+Left move workspace to output left
bindsym $mod+Ctrl+Shift+h move workspace to output left
bindsym $mod+Ctrl+Shift+Right move workspace to output right
bindsym $mod+Ctrl+Shift+l move workspace to output right
bindsym $mod+Ctrl+Shift+Up move workspace to output up
bindsym $mod+Ctrl+Shift+k move workspace to output up
bindsym $mod+Ctrl+Shift+Down move workspace to output down
bindsym $mod+Ctrl+Shift+j move workspace to output down

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
bindsym $mod+Shift+c exec "cat ~/.config/i3/colors ~/.config/i3/base > ~/.config/i3/config && i3-msg reload"
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart

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

for_window [class="Pavucontrol"] floating enable
for_window [class="Arandr"] floating enable
for_window [class="Xfce4-appfinder"] floating enable

set $mode_root [a]udio [c]olor [d]isplays [l]auncher [p]ower [s]ettings [v]pntoggle
bindsym $mod+semicolon mode "$mode_root"

mode "$mode_root" {
  bindsym s exec xfce4-settings-manager          ; mode "default"
  bindsym v exec toggle-vpn.sh aws ; mode "default"

  bindsym a mode "$mode_audio"
  bindsym c mode "$mode_color"
  bindsym d mode "$mode_displays"
  bindsym l mode "$mode_launcher"
  bindsym p mode "$mode_power"

  bindsym Escape mode "default"
  bindsym Return mode "default"
}

set $mode_displays [c]ustom [l]appy [h]ome [w]ork
mode "$mode_displays" {
  bindsym c exec arandr                          ; mode "default"
  bindsym h exec home.sh                         ; mode "default"
  bindsym l exec lappy.sh                        ; mode "default"
  bindsym w exec work.sh                         ; mode "default"

  bindsym Escape mode "default"
  bindsym Return mode "default"
}

set $mode_launcher [f]irefox [p]firefox [m]ail [t]hunar [s]lack [v]irt-manager sp[o]tify
mode "$mode_launcher" {
  bindsym t exec program-at-path.sh thunar
  bindsym o exec spotify
  bindsym f exec firefox
  bindsym p exec pfire
  bindsym m exec thunderbird
  bindsym s exec slack
  bindsym v exec virt-manager

  bindsym Escape mode "default"
  bindsym Return mode "default"
}

set $mode_audio [c]ustom [e]qualizer [h]dmi [l]appy
mode "$mode_audio" {
  bindsym c exec pavucontrol                     ; mode "default"
  bindsym e exec pulseaudio-equalizer-gtk        ; mode "default"
  bindsym l exec pactl set-card-profile 0 output:analog-stereo+input:analog-stereo; mode "default"
  bindsym h exec pactl set-card-profile 0 output:hdmi-stereo-extra1; mode "default"

  bindsym Escape mode "default"
  bindsym Return mode "default"
}

set $mode_color [x]off [j]down [k]up [u]reset
bindsym $mod+o mode "$mode_color"

mode "$mode_color" {
  bindsym x exec --no-startup-id temp.sh off
  bindsym j exec --no-startup-id temp.sh down
  bindsym k exec --no-startup-id temp.sh up
  bindsym u exec --no-startup-id temp.sh

  bindsym Escape mode "default"
  bindsym Return mode "default"
}

set $mode_power [q]logout [s]leep [l]ock [p]oweroff
mode "$mode_power" {
  bindsym l exec xflock4                         ; mode "default"
  bindsym p exec poweroff                        ; mode "default"
  bindsym q exec xfce4-session-logout            ; mode "default"
  bindsym s exec xfce4-session-logout -s         ; mode "default"

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

bindsym $mod+t mode "mouse"

bindsym XF86AudioPrev exec --no-startup-id music.sh prev
bindsym $mod+n exec --no-startup-id music.sh prev

bindsym XF86AudioPlay exec --no-startup-id music.sh play
bindsym $mod+m exec --no-startup-id music.sh play

bindsym XF86AudioNext exec --no-startup-id music.sh next
bindsym $mod+comma exec --no-startup-id music.sh next

bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5%
bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5%
bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle
bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle

bindsym XF86Display exec --no-startup-id arandr

exec --no-startup-id temp.sh
exec --no-startup-id alttab -d 1


# Basic bar configuration using the Base16 variables.
bar {
    status_command i3status
    tray_output primary
    position top

    colors {
        background $base00
        separator  $base01
        statusline $base04

        # State             Border  BG      Text
        focused_workspace   $base05 $base0D $base00
        active_workspace    $base05 $base03 $base00
        inactive_workspace  $base03 $base01 $base05
        urgent_workspace    $base08 $base08 $base00
        binding_mode        $base00 $base0A $base00
    }
}

# Basic color configuration using the Base16 variables for windows and borders.
# Property Name         Border  BG      Text    Indicator Child Border
client.focused          $base05 $base0D $base00 $base0D $base0C
client.focused_inactive $base01 $base01 $base05 $base03 $base01
client.unfocused        $base01 $base00 $base05 $base01 $base01
client.urgent           $base08 $base08 $base00 $base08 $base08
client.placeholder      $base00 $base00 $base05 $base00 $base00
client.background       $base07
