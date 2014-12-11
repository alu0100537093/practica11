
class Question
	INDICE = 0
	TIPO = 1

	attr_accessor :text, :answers

	def initialize(text, answers)
		@text = text
		# "answers" is a hash.
		# The keys "k" are pairs like [3, :right] or [6, :wrong]
		# The first member of the pair ("6") is the answer position,
		# the second member (":wrong"), the kind of answer.
		# The value "v" is the answer, for instance "1942" or "1492"
		@answers = answers.map { |k, v| Answer.new(k[INDICE], k[TIPO], v) }.sort
	end

	def to_s
		
		out = ""
		out += "#{@text}\n"
		@answers.each do |answer|
			out += " #{answer}\n"
		end
			out
	end
	# ask the question and returns true if the answer is right
	# false otherwise

	def ask
		begin
			puts self
			print "Su respuesta: "
			answerno = gets.to_i - 1
		end while (answerno < 0 or answerno >= @answers.length)
		@answers[answerno].is_right?
		end
end