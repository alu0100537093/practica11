require 'exam.rb'


describe Pregunta do
  
		
		before :each do
			@p1 = Pregunta.new("Pregunta", ['Respuesta a', 'Respuesta b', 'Respuesta c', 'Respuesta d'])
		end
  

		it "La pregunta tiene enunciado" do
			@p1.get_enunciado != nil
		end

		it "Existen respuestas" do
			@p1.get_respuestas != nil
		end
		
		it "El enunciado de la pregunta es el correcto" do
			@p1.get_enunciado.should eq("Pregunta")
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
