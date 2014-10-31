Nodo = Struct.new(:value, :next) do
	attr_reader :value, :next

	def get_value
		self.to_a[0]
	end
	
	def get_next
		self.to_a[1]
	end
end
