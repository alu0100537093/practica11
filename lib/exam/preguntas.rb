#!/usr/bin/env ruby
# encoding: utf-8
class Pregunta
	include Comparable
	attr_reader :enunciado, :respuestas, :r_correcta, :dificultad
	def initialize(enunciado, respuestas, r_correcta , dificultad)
		@enunciado = enunciado
		@respuestas = respuestas
		@r_correcta = r_correcta
		@dificultad = dificultad
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

	def <=>(other)
		return nil unless other.is_a? Pregunta
                @dificultad <=> other.dificultad
	end
	
=begin
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
=end
end

