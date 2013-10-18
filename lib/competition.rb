class Competition
	attr_accessor :questions

	class Closed < StandardError
	end

	def initialize(questions = [])
		@questions = questions
	end
	
	def start
		close
	end
	
end