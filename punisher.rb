require 'espeak'
class Punisher
	include ESpeak

	def self.punish_all(culprits)
		who_da_culprits = (culprits.empty?) ? 'Offenders unknown' : 'The culprits are '
		self.speak(who_da_culprits)

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




