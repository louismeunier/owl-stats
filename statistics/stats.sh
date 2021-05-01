#!/bin/bash

ruby ./statistics/logic/benched.rb
ruby ./statistics/logic/timeHacked.rb

today=$(date)
echo "### last updated: ${today}\n\n" >> /home/travis/build/louismeunier/owl-stats/out/README.md