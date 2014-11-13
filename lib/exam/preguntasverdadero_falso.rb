class Preguntasverdadero_falso < Pregunta
	
	def initialize(enunciado, dificultad)
		super(enunciado, ['Verdadero', 'Falso'], dificultad)
	end
end
