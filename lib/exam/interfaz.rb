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

	def corregir_pregunta(examen, indice_pregunta, respuesta_usuario)
		if(examen.comprobar_respuesta(indice_pregunta, respuesta_usuario))
			return "\nRespuesta Correcta.\n"
		else
			return "\nRespuesta Incorrecta.\n"
		end
	end

	def reset
		@examenes.each { |exam|
			exam.reset
		}
	end

	def ejecucion_debug(examen)
		#el examen seleccionado por defecto será el de la posición 0. -> @examenes[0]
		elementos = @examenes[examen].lista.count
		
		elementos.times do |iterador|
			#puts mostrar_pregunta( @examenes[@examen_seleccionado], iterador) -> Mostraría la pregunta, pero es la máquina quien resuelvey no tiene sentido mostrar.
			opcion_aleatoria = rand(@examenes[examen].lista[iterador].respuestas.size)
			@examenes[examen].comprobar_respuesta(iterador, opcion_aleatoria)
		end

		if((@examenes[examen].respuestas_correctas + @examenes[examen].respuestas_erroneas == elementos))
			return true # Si el numero de respuestas correctas + el numero de respuestas erroneas = n_preguntas, entonces se
		else	            # han respondido a todas las preguntas
			return false
		end	
	end
end
