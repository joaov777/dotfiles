#!/usr/bin/expect -f
	spawn trizen -S whatmask --noconfirm
	expect "joao: " { send "110213\r" }
	interact
