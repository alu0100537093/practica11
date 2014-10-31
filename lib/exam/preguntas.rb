class Pregunta
	
	def initialize(enunciado, respuestas)
		@enunciado = enunciado
		@respuestas = respuestas
	end

	def to_s
            
		aux = "#{@enunciado}\n"
		contador = 0
		@respuestas.each { |r|
			contador = contador + 1
			aux += "#{contador}. #{r}\n"
		}
		aux
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

	def ==(other)
		if(other == nil)
			return false
		end
		if((@enunciado == other.get_enunciado) && (@respuestas == other.get_respuestas))
			return true
		else
			return false
		end
	end
end

