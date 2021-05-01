#!/bin/bash
echo "# OWL Statistics \n\n" >> /home/travis/build/louismeunier/owl-stats/out/README.md
ruby ./statistics/logic/benched.rb
ruby ./statistics/logic/timeHacked.rb