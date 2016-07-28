require_relative 'jenkins'
require_relative 'punisher'

USER_NAME = ''
API_KEY = ''
JENKINS_URL = ''

jenkins = Jenkins.new(JENKINS_URL, USER_NAME, API_KEY)
jenkins.all_jobs.each do |job_name|
	last_build = jenkins.latest_build job_name
	status = last_build['result']
	puts "#{job_name} -> #{status}"
	if status == 'FAILURE' && !last_build['building']
		Punisher.announce_build(last_build['fullDisplayName'])
		Punisher.punish_all(last_build['culprits'])
	end
end
