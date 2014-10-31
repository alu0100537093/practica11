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

	def get_cabeza
		@cabeza
	end

	def get_final	
		@final
	end

	def extraer_primero
		aux = @cabeza
		puts aux[:value]
		@cabeza = @cabeza[:next]
		aux = nil
	end

	def ==(other)
		es_igual = true
		aux = @cabeza
		aux2 = other.get_cabeza

		while((aux != nil) && (es_igual == true) && (aux2 != nil)) do
			if(aux[:value] != aux2[:value])
				es_igual = false
			else
				aux = aux[:next]
				aux2 =aux2[:next]
			end
		end
		return es_igual
	end

	def add(preguntas)
		aux = @cabeza
		while (aux[:next] != nil) do
			aux = aux[:next]
		end
		preguntas.each{|x|
			aux[:next] = Nodo.new(x, nil)
			aux = aux[:next]
			@final = aux
		}
	end

	def to_s
		aux = @cabeza
		cadena = ""
		contador = 0
		while(aux != nil)do
			cadena += "#{contador}) #{aux[:value].to_s}\n"
			aux = aux[:next]
		end
		cadena
	end

	def show()
		puts to_s
	end

end
