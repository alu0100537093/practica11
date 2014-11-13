Nodo = Struct.new(:value, :next, :previous) do
	include Comparable
	
	def <=>(other)
		return nil unless other.instance_of? Nodo
                 self.to_a[0] <=> other.to_a[0]
	end
=begin
	def ==(other)
		if((self.to_a[0] == other.to_a[0])&& (self.to_a[1] == other.to_a[1]) &&(self.to_a[2] == other.to_a[2]))
			return true
		else
			return false
		end
	end
=end
end
