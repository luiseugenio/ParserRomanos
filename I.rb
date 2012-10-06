class Numero
	attr_reader :valor
	attr_reader :repeticoes
	
	@antecessores
	@predecessores
	
	def > (romano)
		@valor > romano.valor
	end
	
	def precedido_por (romano)
		@predecessores.include?(romano)
	end
end

class I < Numero
	
	
	
	def initialize
		@valor = 1
		@repeticoes = 3
		@predecessores = [I, V]
	end
end

class V < Numero
	
	def initialize
		@valor = 5
		@repeticoes = 1
		@predecessores = [I]
	end
end

describe "Numeracao I" do
	before(:each) do
		@i = I.new
	end
	
	describe "Repeticoes" do
		it "deve ser igual a 3" do
			expect(@i.repeticoes).to be 3
		end
	end
	
	describe "valor" do
		it "deve ser igual a 1" do
			expect(@i.valor).to be 1
		end
	end
	
	describe "Maior Que" do
		it "nao deve ser maior V" do
			v = V.new
			expect(@i. > v).to be_false
		end
	end
	
	describe "Predecessores" do
		it "pode ser precedido por I" do
			expect(@i.precedido_por(I)).to be_true
		end
		
		it "pode ser precedido por V" do
			expect(@i.precedido_por(V)).to be_true
		end
	end
	
end

describe "Numeracao V" do
	before(:each) do
		@v = V.new
	end
	
	describe "Repeticoes" do
		it "deve ser igual a 1" do
			expect(@v.repeticoes).to be 1
		end
	end
	
	describe "valor" do
		it "deve ser igual a 5" do
			expect(@v.valor).to be 5
		end
	end
	
	describe "Maior Que" do
		it "deve ser maior I" do
			i = I.new
			expect(@v. > i).to be_true
		end
	end
	
	describe "Predecessores" do
		it "pode ser precedido por I" do
			expect(@v.precedido_por(I)).to be_true
		end
		
		it "nao pode ser precedido por V" do
			expect(@v.precedido_por(V)).to be_false
		end
	end
	
end