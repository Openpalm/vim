#!/bin/bash

roday=`date` && git add . --all && git status sleep 1 && git commit -a -m "pushing changes $today" && git push

