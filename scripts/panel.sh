#!/bin/bash

        #Adding and removing panel on XFCE. If enabled, gets disabled and vice-versa.

        #[[ $(pgrep $1 | wc -l) -gt 0 ]] && echo "Panel Enabled" || echo "Panel Disabled"
        if [ $(pgrep xfce4-panel | wc -l) -gt 0 ]; then
            exec pkill xfce4-panel
        else 
            exec nohup xfce4-panel 2>/dev/null & 
            [[ -f $PWD/nohup.out ]] && rm $PWD/nohup.out 
        fi
   