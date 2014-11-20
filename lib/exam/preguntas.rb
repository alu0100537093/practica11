#!/usr/bin/env ruby
# encoding: utf-8
class Pregunta
	include Comparable
	attr_reader :enunciado, :respuestas, :r_correcta, :dificultad
	def initialize(enunciado, respuestas, r_correcta , dificultad)
		raise ArgumentError, 'El enunciado especificado no es una cadena' unless enunciado.is_a? String
		raise ArgumentError, 'Se debe introducir un array como respuestas a la pregunta' unless respuestas.is_a? Array
		respuestas.each{ |x|
			raise ArgumentError, 'El array de respuestas introducido debe ser solo de cadenas' unless x.is_a? String
		}
		
		raise ArgumentError, 'La solución propuesta no hace referencia a ningún índice del array de respuestas' unless r_correcta.between?(0, respuestas.size)

		raise ArgumentError, 'El valor de dificultad de la pregunta no está entre 1 y 10' unless dificultad.between?(1,11) 

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

