alias watch-flutter="trigger-on-change -p .dart -d ./lib -c 'cat /tmp/running_flutter.pid | xargs kill -s USR1'"
