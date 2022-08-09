#!/bin/bash
apt update
apt install -y tmux
CURRENT_PATH=$(dirname "$0")                                    # relative path
CURRENT_PATH=$(cd "$CURRENT_PATH" && pwd)                       # absolutized and normalized path
chmod +x $CURRENT_PATH/count.sh                                 # make script runnable
tmux start-server                                               # start tmux server
tmux new-session -d -s mySession -n 1                           # create new session
tmux new-window -t mySession                                    # create a second windows inside session
tmux send-keys -t mySession:0 "sessions/count.sh 1000" ENTER    # run 'sessions/count.sh' inside window 0
tmux send-keys -t mySession:1 "top" ENTER                       # run 'top' inside window 1