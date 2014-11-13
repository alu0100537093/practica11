class Lista

	include Enumerable
	attr_reader :cabeza, :final

	def initialize(preguntas)
		contador = 0
		preguntas.each { |x|
			if(contador == 0)
				@cabeza = Nodo.new(x, nil, nil)
				@final = @cabeza
				contador = contador + 1
			else
				aux = @final 
				aux[:next] = Nodo.new(x, nil, aux)
				@final = aux[:next]
			end
		}
	end



	def each
	     aux = @cabeza
	     while aux != nil do
	       yield aux[:value]
	       aux = aux[:next]
	     end
   	end
   
   
	def extraer_primero
		aux = @cabeza
		#puts aux[:value]
		@cabeza = @cabeza[:next]
		aux = nil
	end

	def ==(other)
		es_igual = true
		aux = @cabeza
		aux2 = other.cabeza

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

	def[](index)
		aux = @cabeza
		contador = 0

		if(index < 0)
			return nil
		end

		while(contador < index)do
			contador = contador + 1
			aux = aux[:next]
			if (aux == nil)
				return nil
			end
		end
			aux[:value]
	end

	def get_anterior(index)
		aux = @cabeza
		contador = 0

		if(index < 0)
			return nil
		end

		while(contador < index)do
			contador = contador + 1
			aux = aux[:next]
			if (aux == nil)
				return nil
			end
		end
		if(aux[:previous] == nil)
			return nil
		end
		aux = aux[:previous]
		aux[:value]	
	end

	def recorrido_inverso
		aux = @final
		lista_inversa = Lista.new([aux[:value]])
		while (aux[:previous] != nil) do
			aux = aux[:previous]
			lista_inversa.add([aux[:value]])
		end
		lista_inversa
	end

	def to_s
		aux = @cabeza
		cadena = ""
		contador = 0
		while(aux != nil)do
			contador = contador +1
			cadena += "#{contador}) #{aux[:value].to_s}\n"
			aux = aux[:next]
		end
		cadena
	end

	def show()
		puts to_s
	end

end
