# detect if active window has been changed
# if so, then log its name

# create a file "/.logs/windowhistory" if it doesnt exist
if [ ! -f ~/.logs/windowhistory ]; then
    touch ~/.logs/windowhistory
fi

activewindow = $(xdotool getactivewindow getwindowname)

# run this script every 25 seconds
while true; do
    sleep 25
    newactivewindow = $(xdotool getactivewindow getwindowname)
    if [ "$activewindow" != "$newactivewindow" ]; then
        echo "$newactivewindow" >> ~/.logs/window_history
        date >> ~/.logs/window_history
        echo "_" >> ~/.logs/window_history

        activewindow = "$newactivewindow"
    fi
done
