class Interfaz
	attr_accessor :examenes, :examen_seleccionado, :seleccion_menu
	def initialize(examenes)
		examenes.each{ |x|
			raise ArgumentError, 'El array debe ser de objetos de tipo Examen' unless x.is_a? Examen
		}
		
		@examenes = examenes
		@examen_seleccionado = 0 #Este atributo apuntará al indice del examen que se desea realizar
		@seleccion_menu = 0 #Este atributo almacenará la opcion del menu elegida por el usuario
	end
	
	def showmenu()
		menu = ["Opcion 1. Cargar examen.\n\nOpcion 2. Resolver examen\n\nOpcion 3. Ver dificultad de examen\n\nOpcion 4. Salir"]
	end
	
	def opcion1
		contador = 1
		aux = "\n\nSeleccione el examen que desee cargar\n"
		@examenes.each{ |x|
			aux += "#{contador}. #{x.id}\n"
			contador = contador + 1
		}
		aux
	end

	def mostrar_pregunta(examen, pregunta)
		examen.lista[pregunta].to_s
	end
end
