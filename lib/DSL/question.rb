
class Question
	INDICE = 0
	TIPO = 1

	attr_accessor :text, :answers

	def initialize(text, answers)
		@text = text
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

	def ask
		begin
			puts self
			print "Su respuesta: "
			answerno = gets.to_i - 1
		end while (answerno < 0 or answerno >= @answers.length)
		@answers[answerno].is_right?
		end
end