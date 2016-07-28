require 'espeak'
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




