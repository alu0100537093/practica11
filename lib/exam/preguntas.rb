class Pregunta
	
	def initialize(enunciado, respuestas)
		@enunciado = enunciado
		@respuestas = respuestas
	end

	def to_s
            
		aux = "#{@enunciado}\n"
		@respuestas.each do |r|
		  aux += "#{r}\n"
		aux
	end

	end
	
	def get_enunciado
		@enunciado
	end
	
	def get_respuesta(index)
		@respuestas[index]
	end

	def get_respuestas
		@respuestas
	end

	def showQuestion
		puts to_s
	end
end

