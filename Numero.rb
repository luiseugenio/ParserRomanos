class Numero
	attr_reader :valor
	attr_reader :repeticoes
	attr_reader :letra
	
	def > (romano)
		@valor > romano.valor
	end
	
	def < (romano)
		@valor < romano.valor
	end
	
	def deve_subtrair?(romano)
		self > romano
	end
end