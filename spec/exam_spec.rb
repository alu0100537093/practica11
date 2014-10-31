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
		
	end

	it "Existe un valor"
		@nodo_prueba2.get_value.should eq(@ex1)	
	end

	it "Existe un siguiente"
		@nodo_prueba2.get_next.should eq(@ex1)	
	end



end



