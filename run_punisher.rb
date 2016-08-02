require_relative 'jenkins'
require_relative 'punisher'
require 'yaml'

config = YAML.load_file('config.yml')

USER_NAME = config['user_name'] || ''
API_KEY = config['password'] || ''
JENKINS_URL = config['jenkins_url'] || ''
DELAY = config['delay'] || 10

jenkins = Jenkins.new(JENKINS_URL, USER_NAME, API_KEY)

until false do
	begin
		jenkins.all_jobs.each do |job_name|
			last_build = jenkins.latest_build job_name
			status = last_build['result']
			puts "#{job_name} -> #{status}"
			if status == 'FAILURE' && !last_build['building']
				Punisher.announce_build(last_build['fullDisplayName'])
				Punisher.punish_all(last_build['culprits'])
			end
		end
		sleep(DELAY.minutes)
	rescue
		retry
	end
end

