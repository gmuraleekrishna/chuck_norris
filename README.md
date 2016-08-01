Jenkins Punisher
================

Reprimands the culprit who breaks the builds in the jenkins CI.

## Installation

1. Clone this repo to your system `git clone https://github.com/gmuraleekrishna/jenkins_punisher.git`.
2. Done!

## Configuration

Get your user name and api key from jenkins user configuration
Add `JENKINS_URL`, `USER_NAME` and `API_KEY` to `run_punisher.rb`

Eg. 
	
	JENKINS_URL = 'https://jenkins.mywebsite.com'
	USER_NAME = 'johndoe'
	API_KEY = '8490feacb4545b3b4bb7b5ba'


## Run punisher
	$ bundle install
	$ ruby run_punisher.rb

## Todo

- Separate configuration and code
- Remember the last punished build & culprits and announce that build only once
- Selective build punishing
- Use human voice instead of espeak robotic voice 

