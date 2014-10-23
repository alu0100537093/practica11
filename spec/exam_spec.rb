require 'exam.rb'


describe Pregunta do
  
		
		before :each do
			@p1 = Pregunta.new("Pregunta", "Respuesta a", "Respuesta b", "Respuesta c", "Respuesta d")
		end
  

		it "La pregunta tiene enunciado" do
			@p1.get_enunciado != nil
		end
		
		it "El enunciado de la pregunta es el correcto" do
			@p1.get_enunciado = "Pregunta"
		end
		
		it "Existen respuestas" do
			@p1.get_respuesta_a != nil
			@p1.get_respuesta_b != nil
			@p1.get_respuesta_c != nil
			@p1.get_respuesta_d != nil
		end
end
