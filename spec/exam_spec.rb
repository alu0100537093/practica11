require 'exam.rb'


describe Pregunta do
  
		
		before :each do
			@p1 = Pregunta.new("Pregunta", ['Respuesta a', 'Respuesta b', 'Respuesta c', 'Respuesta d'])
		end
  
		it "Debe existir una pregunta" do
			@p1.should eq(Pregunta.new("Pregunta", ['Respuesta a', 'Respuesta b', 'Respuesta c', 'Respuesta d']))
		end

		it "Existe un enunciado deseado" do
			@p1.get_enunciado != nil
			@p1.get_enunciado == "Pregunta"
		end

		it "Existen respuestas" do
			@p1.get_respuestas != nil
			@p1.get_respuestas.should eq (['Respuesta a', 'Respuesta b', 'Respuesta c', 'Respuesta d'])
		end
		

		it "Se devuelve la respuesta que se pasa como parametro" do
			@p1.get_respuesta(1).should eq('Respuesta b')
		end
		
		
		it "Las respuestas deben ser las adecuadas" do
			@p1.get_respuesta(0).should eq("Respuesta a")
			@p1.get_respuesta(1).should eq("Respuesta b")
			@p1.get_respuesta(2).should eq("Respuesta c")
			@p1.get_respuesta(3).should eq("Respuesta d")
		end

		it "Comprobando funcionamiento del metodo to_s" do
			@p1.to_s ==("Pregunta\nRespuesta a\nRespuesta b\nRespuesta c\nRespuesta d")
		end

end

describe Nodo do
	
		before :all do
			@ex1 = Pregunta.new("1+2 =",['2','3','7','1','Ninguna de las anteriores'])
			@nodo_prueba = Nodo.new(@ex1,nil)
			@nodo_prueba2 = Nodo.new(@ex1,@ex1)
			@nodo_prueba3 = Nodo.new(@ex1,@ex1)
		end
	
		it "Existe un valor" do
			@nodo_prueba.get_value.should eq(@ex1)
			@nodo_prueba2.get_value.should eq(@ex1)	
		end
	
		it "Existe un siguiente" do
			@nodo_prueba.get_next.should eq(nil)
			@nodo_prueba2.get_next.should eq(@ex1)	
		end
		
		it "Comprobamos el funcionamiento del operador =" do
			@nodo_prueba2.should eq(@nodo_prueba3)
		end



end



describe Lista do
	
	
		before :all do
			@ex1 = Pregunta.new("1+2 =",['2','3','7','1','Ninguna de las anteriores'])
			@ex2 = Pregunta.new("5+7 =",['43','21','12','6','11'])
			@ex3 = Pregunta.new("Pregunta", ['a','b','c','d'])
			@ex4 = Pregunta.new("Pregunta a", ['Verdadero', 'Falso'])
			@ex5 = Pregunta.new("Pregunta b", ['Verdadero', 'Falso'])
			@ex6 = Pregunta.new("Pregunta c", ['Verdadero', 'Falso'])
			@nodo_prueba2 = Lista.new([@ex4, @ex5, @ex6])
			@nodo_prueba = Lista.new([@ex1, @ex2, @ex3])
			@nodo_final = Nodo.new(@ex3,nil)
		end

		it "Debe existir un nodo de la lista con sus datos y su siguiente" do
			@nodo_prueba.get_cabeza.get_value.should eq(@ex1)
		end
		
		it "Se indica correctamente cual es el ultimo nodo de la lista" do
			@nodo_prueba.get_final.should eq(@nodo_final)
		end
		
		it "Se extrae el primer elemento de la lista" do
			@nodo_prueba.extraer_primero
			@nodo_prueba.should eq (Lista.new([@ex2, @ex3]))
		end
		
		it "Se puede insertar un elemento" do
			@nodo_prueba.add([@ex1])
			@nodo_prueba.should eq (Lista.new([@ex2, @ex3, @ex1]))
		end
	
		it "Se puede insertar varios elementos" do
			@nodo_prueba.add([@ex2, @ex2])
			@nodo_prueba.should eq (Lista.new([@ex2, @ex3, @ex1, @ex2, @ex2]))
		end

		it "Debe existir una Lista con su cabeza" do
			@nodo_prueba.get_cabeza.should eq(Nodo.new(@ex2, Nodo.new(@ex3,Nodo.new(@ex1, Nodo.new(@ex2, Nodo.new(@ex2,nil))))))
		end
		
		it "Comprobacion del metodo to_s" do
			@nodo_prueba2.to_s ==("1) Pregunta a\n1. Verdadero\n2. Falso\n\n2)Pregunta b\n1. Verdadero\n2. Falso\n\n3)Pregunta c\n1. Verdadero\n2. Falso\n")
		end
		

end


describe Lista do


		before :all do
			@ex1 = Pregunta.new("¿Cual es la salida del siguiente codigo Ruby?\n\n\tclass Xyz\n\t\tdef pots\n\t\t\t@nice\n\t\tend\n\tend\n\n\txyz = Xyz.new\n\tp xyz.pots", ['#<Xyz:0xa000208>','nil','0','Ninguna de las anteriores'])
			@ex2 = Pregunta.new("La siguiente definicion de un hash en Ruby es valida:\n\n\thash_raro = {\n\t\t[1,2,3] => Object.new(),\n\t\tHash.new => :toto\n\t}", ['Cierto', 'Falso'])
			@ex3 = Pregunta.new("¿Cual es la salida del siguiente codigo Ruby?\n\n\tclass Array\n\t\tdef say_hi\n\t\t\t\"HEY\"\n\t\tend\n\tend\n\n\n\tp [1,\"bob\"].say_hi", ['1', 'bob','HEY!','Ninguna de las anteriores'])
			@ex4 = Pregunta.new("¿Cual es el tipo de objeto en el siguiente codigo Ruby?\n\n\tclass Objeto\n\tend", ['Una instancia de la clase Class', 'Una constante', 'Un objeto', 'Ninguna de las anteriores'])
			@ex5 = Pregunta.new("Es apropiado que una clase Tablero herede de una clase Juego", ['Cierto','Falso'])
			@nodo_prueba = Lista.new([@ex1,@ex2,@ex3,@ex4,@ex5])
		end
		
		
		it "Se comprueba la estructura de la lista" do
			@nodo_prueba.get_cabeza.should eq(Nodo.new(@ex1, Nodo.new(@ex2,Nodo.new(@ex3, Nodo.new(@ex4, Nodo.new(@ex5,nil))))))
			puts @nodo_prueba
		end
		
			
		
	

	
end



