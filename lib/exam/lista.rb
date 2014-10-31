class Lista

	def initialize(preguntas)
		contador = 0
		preguntas.each { |x|
			if(contador == 0)
				@cabeza = Nodo.new(x, nil)
				@final = @cabeza
				contador = contador + 1
			else
				aux = @final 
				aux[:next] = Nodo.new(x, nil)
				@final = aux[:next]
			end
		}
	end
end
