require 'espeak'
require 'jenkins_api_client'


class Punisher
	include ESpeak

	def self.punish_all(culprits)
		self.speak("The culprits are ")
		culprits.select do |culprit|
			self.speak(culprit['fullName'])
		end
	end

	def self.announce_build(build_name)
		self.speak("#{build_name} has failed")
	end

	def self.speak(string)
		Speech.new(string, pitch: 30, speed: 130).speak
	end
end


class Jenkins
	## http://www.rubydoc.info/gems/jenkins_api_client/JenkinsApi/Client/Job
	def initialize(url)
		jenkins_client = JenkinsApi::Client.new( server_url: url,
																						ssl: true,
																						username: 'mkrishna',
																						http_open_timeout: 15,
																						password: "6349d4ca4364ae076c163dd2a5fa3354" )
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


jenkins = Jenkins.new('https://svn.aconex.com/field-management-hudson')
jenkins.all_jobs.each do |job_name|
	last_build = jenkins.latest_build job_name
	status = last_build['result']
	puts "#{job_name} -> #{status}"
	if status == 'FAILURE' && !last_build['building']
		p last_build
		Punisher.announce_build(last_build['fullDisplayName'])
		Punisher.punish_all(last_build['culprits'])
	end
end


