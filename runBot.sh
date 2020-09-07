#!/bin/bash
DUMMY=$(bundle check)
if [ $0 ]
then
	bundle exec ruby bot.rb
else
	bundle install --quiet
	bundle exec ruby bot.rb
fi
