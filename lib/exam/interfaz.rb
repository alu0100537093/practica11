class Interfaz
	attr_reader :examenes
	def initialize(examenes)
		examenes.each{ |x|
			raise ArgumentError, 'El array debe ser de objetos de tipo Examen' unless x.is_a? Examen
		}
		
		@examenes = examenes
		@examen_seleccionado = 0 #Este atributo apuntará al indice del examen que se desea realizar
	end
end
