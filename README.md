Jenkins Punisher
================

Reprimands the culprit who breaks the builds in the jenkins CI.

![chuck norris](https://cdn.meme.am/instances/64556564.jpg)

## Installation

1. Clone this repo to your system `git clone https://github.com/gmuraleekrishna/jenkins_punisher.git`.
2. Install espeak (`brew install espeak`)
3. Done!

## Configuration

Get your user name and api key (or password) from jenkins user configuration
Add `JENKINS_URL`, `USER_NAME` and `API_KEY` to `config.yml` (see the sample config)
Set the polling delay in minutes in `DELAY`

Eg.

	JENKINS_URL = 'https://jenkins.mywebsite.com'
	USER_NAME = 'johndoe'
	API_KEY = '8490feacb4545b3b4bb7b5ba'


## Run punisher
	$ bundle install
	$ ruby run_punisher.rb

## Todo

- Remember the last punished build & culprits and announce that build only once
- Selective build punishing
- Use human voice instead of espeak robotic voice

