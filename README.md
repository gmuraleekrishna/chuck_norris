Chuck Norris
==============

Breaks the bones of the guy who breaks the jenkins builds.

![chuck norris](https://cdn.meme.am/instances/64556564.jpg)

## Installation

1. Clone this repo to your system `git clone https://github.com/gmuraleekrishna/chuck_norris.git`.
2. Install [espeak](http://espeak.sourceforge.net/) (`brew install espeak`)
3. Done!

## Configuration

1. Get your user name and api key (or password) from jenkins user configuration
1. Copy the sample config to new file `config.yml`
	$ mv sample.config.yml config.yml

1. Set `jenkins_url`, `user_name` and `password` in `config.yml` (see the sample config)
1. Set the polling delay in minutes in `DELAY` (default: 10mins)

Eg.

	# config.yml
	jenkins_url: 'https://jenkins.mywebsite.com'
	user_name: 'johndoe'
	password: 'api_key_or_password'
	delay: 10


## Run punisher
	$ bundle install
	$ ruby run_punisher.rb

## Todo

- Remember the last punished build & culprits and announce that build only once
- Selective build punishing
- Slack notification using jenkins user to slack user mapping
- Use human voice instead of espeak robotic voice

