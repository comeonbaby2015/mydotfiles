# This shell script is run before Openbox launches.
# Environment variables set here are passed to the Openbox session.

# Set a background color
BG=""
if which hsetroot >/dev/null; then
    BG=hsetroot
else
    if which esetroot >/dev/null; then
	BG=esetroot
    else
	if which xsetroot >/dev/null; then
	    BG=xsetroot
	fi
    fi
fi
test -z $BG || $BG -solid "#303030"

# D-bus
if which dbus-launch >/dev/null && test -z "$DBUS_SESSION_BUS_ADDRESS"; then
       eval `dbus-launch --sh-syntax --exit-with-session`
fi

# Make GTK apps look and behave how they were set up in the gnome config tools
if which gnome-settings-daemon >/dev/null; then
  gnome-settings-daemon &
fi

# Preload stuff for KDE apps
if which start_kdeinit >/dev/null; then
  LD_BIND_NOW=true start_kdeinit --new-startup +kcminit_startup &
fi
eval `cat $HOME/.fehbg` &
export GTK_IM_MODULE=xim
rm ~/kpdb.kdb.lock &
rm ~/.mpd/mpdstate

gsynaptics-init &
#xcompmgr -cCfF -t-5 -l-5 -r4.2 -o.55 -D3 &
#xcompmgr &
pcmanfm -d &
#thunar --daemon &
#pypanel &
#lxpanel &
docker &
tilda &
volwheel &
glipper-old &
ck-launch-session blueman-applet &
batterymon &
notify-send 'welcome' 'Hello, Nixer =)' &


