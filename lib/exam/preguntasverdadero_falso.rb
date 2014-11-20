class Preguntasverdadero_falso < Pregunta
	
	def initialize(enunciado, r_correcta, dificultad)
		super(enunciado, ['Verdadero', 'Falso'], r_correcta, dificultad)
	end
end
