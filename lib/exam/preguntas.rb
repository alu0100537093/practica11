class Pregunta
	
	def initialize(enunciado, respuesta_1, respuesta_2, respuesta_3, respuesta_4)
		@enunciado = enunciado
		@res1 = respuesta_1
		@res2 = respuesta_2
		@res3 = respuesta_3
		@res4 = respuesta_4
	end
	
	def get_enunciado
		@enunciado
	end

	def get_respuesta_a
		@res1
	end

	def get_respuesta_b
		@res2
	end

	def get_respuesta_c
		@res3
	end

	def get_respuesta_d
		@res4
	end
end
