#!/bin/bash

# make a random chance of the test passing or failing to simulate developers

passorfail=$(( RANDOM % 2))

if $passorfail > 0 ; then
	echo "tests have failed"
	exit 1
else
	echo "tests have passed!!"
	exit 0