require 'exam.rb'


describe Pregunta do
  
		
		before :each do
			@p1 = Pregunta.new("Pregunta", "Respuesta a", "Respuesta b", "Respuesta c", "Respuesta d")
		end
  

		it "La pregunta tiene enunciado" do
			@p1.get_enunciado != nil
		end
  
end
