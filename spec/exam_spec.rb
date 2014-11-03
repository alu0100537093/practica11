#!/usr/bin/env ruby
# encoding: utf-8
require 'exam.rb'


describe Pregunta do
  
		
		before :each do
			@p1 = Pregunta.new("Pregunta", ['Respuesta a', 'Respuesta b', 'Respuesta c', 'Respuesta d'])
		end
  
		it "Debe existir una pregunta" do
			expect(@p1).to eq(Pregunta.new("Pregunta", ['Respuesta a', 'Respuesta b', 'Respuesta c', 'Respuesta d']))
		end

		it "Existe un enunciado deseado" do
			expect(@p1.get_enunciado).not_to eq (nil)
			expect(@p1.get_enunciado).to eq ("Pregunta")
		end

		it "Existen respuestas" do
			expect(@p1.get_respuestas).not_to eq (nil)
			expect(@p1.get_respuestas).to eq (['Respuesta a', 'Respuesta b', 'Respuesta c', 'Respuesta d'])
		end
		

		it "Se devuelve la respuesta que se pasa como parametro" do
			expect(@p1.get_respuesta(1)).to eq('Respuesta b')
		end
		
		
		it "Las respuestas deben ser las adecuadas" do
			expect(@p1.get_respuesta(0)).to eq("Respuesta a")
			expect(@p1.get_respuesta(1)).to eq("Respuesta b")
			expect(@p1.get_respuesta(2)).to eq("Respuesta c")
			expect(@p1.get_respuesta(3)).to eq("Respuesta d")
		end

		it "Comprobando funcionamiento del metodo to_s" do
			expect(@p1.to_s).to eq("Pregunta\n1. Respuesta a\n2. Respuesta b\n3. Respuesta c\n4. Respuesta d\n")
		end

end

describe Nodo do
	
		before :all do
			@ex1 = Pregunta.new("1+2 =",['2','3','7','1','Ninguna de las anteriores'])
			@ex2 = Pregunta.new("Pregunta ",['a','b','c','d'])
			@nodo_prueba = Nodo.new(@ex1,@ex2)
			@nodo_prueba2 = Nodo.new(@ex1,@ex1, @nodo_prueba)
			@nodo_prueba3 = Nodo.new(@ex1,@ex1, @nodo_prueba)
		end
	
		it "Existe un valor" do
			expect(@nodo_prueba.to_a[0]).to eq(@ex1)
			expect(@nodo_prueba2.to_a[0]).to eq(@ex1)	
		end
	
		it "Existe un siguiente" do
			expect(@nodo_prueba.to_a[1]).to eq(@ex2)
			expect(@nodo_prueba2.to_a[1]).to eq(@ex1)	
		end

		it "Existe un nodo anterior" do
			expect(@nodo_prueba2.to_a[2]).to eq(@nodo_prueba)
			expect(@nodo_prueba3.to_a[2]).to eq(@nodo_prueba)
		end
		
		it "Comprobamos el funcionamiento del operador =" do
			expect(@nodo_prueba2).to eq(@nodo_prueba3)
			expect(@nodo_prueba2).not_to eq(@nodo_prueba)
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
			expect(@nodo_prueba.get_cabeza.to_a[0]).to eq(@ex1)
		end
		
		it "Se indica correctamente cual es el ultimo nodo de la lista" do
			expect(@nodo_prueba.get_final).to eq(@nodo_final)
		end
		
		it "Se extrae el primer elemento de la lista" do
			@nodo_prueba.extraer_primero
			expect(@nodo_prueba).to eq (Lista.new([@ex2, @ex3]))
		end
		
		it "Se puede insertar un elemento" do
			@nodo_prueba.add([@ex1])
			expect(@nodo_prueba).to eq (Lista.new([@ex2, @ex3, @ex1]))
		end
	
		it "Se puede insertar varios elementos" do
			@nodo_prueba.add([@ex2, @ex2])
			expect(@nodo_prueba).to eq (Lista.new([@ex2, @ex3, @ex1, @ex2, @ex2]))
		end

		it "Debe existir una Lista con su cabeza" do
			expect(@nodo_prueba.get_cabeza).to eq(Nodo.new(@ex2, Nodo.new(@ex3,Nodo.new(@ex1, Nodo.new(@ex2, Nodo.new(@ex2,nil))))))
		end
		
		it "Comprobacion del metodo to_s" do
			@nodo_prueba2.to_s == ("1)Pregunta a\n1. Verdadero\n2. Falso\n\n2)Pregunta b\n1. Verdadero\n2. Falso\n\n3)Pregunta c\n1. Verdadero\n2. Falso\n")
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
			expect(@nodo_prueba.get_cabeza).to eq(Nodo.new(@ex1, Nodo.new(@ex2,Nodo.new(@ex3, Nodo.new(@ex4, Nodo.new(@ex5,nil))))))
			puts @nodo_prueba
		end
		
			
		
	

	
end



