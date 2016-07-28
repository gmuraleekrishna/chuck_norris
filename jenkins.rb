require 'jenkins_api_client'

class Jenkins
	## http://www.rubydoc.info/gems/jenkins_api_client/JenkinsApi/Client/Job
	def initialize(url, user_name, api_key)
		jenkins_client = JenkinsApi::Client.new( server_url: url,	ssl: true, username: user_name, http_open_timeout: 15, password: api_key)
		@jobs = JenkinsApi::Client::Job.new(jenkins_client)
	end

	def latest_build(job_name)
		build_number = @jobs.get_current_build_number(job_name)
		@jobs.get_build_details(job_name, build_number)
	end

	def all_jobs
		@jobs.list_all
	end
end


