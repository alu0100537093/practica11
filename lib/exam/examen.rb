class Examen
	attr_reader :id, :lista, :plantilla, :respuestas_correctas, :respuestas_erroneas

	def initialize(id, lista)
		raise ArgumentError, 'El id especificado no es una cadena' unless id.is_a? String
		raise ArgumentError, 'No se le pasa como argumento un objeto de tipo Lista' unless lista.is_a? Lista
		@id = id
		@lista = lista
		@plantilla = []
		@lista.each{|x|
			@plantilla.push(x.r_correcta)
		}
		@respuestas_correctas = 0
		@respuestas_erroneas = 0
	end

	def comprobar_respuesta(indice_pregunta, respuesta_introducida)
		if(@plantilla[indice_pregunta] == respuesta_introducida)
			@respuestas_correctas += 1
			return true
		else
			@respuestas_erroneas += 1
			return false
		end
	end

	def reset
		@respuestas_correctas = 0
		@respuestas_erroneas = 0
	end
end
