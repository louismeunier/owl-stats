#!/bin/bash

ruby ./statistics/logic/benched.rb
ruby ./statistics/logic/timeHacked.rb
ruby ./statistics/logic/mostPlaytime.rb

today=$(date)
echo "#### last updated: ${today}" >> /home/travis/build/louismeunier/owl-stats/out/README.md