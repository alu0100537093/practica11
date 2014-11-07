class Pregunta
	attr_reader :enunciado, :respuestas
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
	
	def get_respuesta(index)
		@respuestas[index]
	end

	def showQuestion
		puts to_s
	end

	def ==(other)
		if(other == nil)
			return false
		end
		if((@enunciado == other.enunciado) && (@respuestas == other.respuestas))
			return true
		else
			return false
		end
	end
end

