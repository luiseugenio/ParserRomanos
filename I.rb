class I
	attr_reader :valor
	@repeticoes
	@antecessores
	@predecessores
	
	def initialize
		@valor = 1
		@repeticoes = 3
	end
	
	def > (romano)
		@valor > romano.valor
	end
end

class V
	attr_reader :valor
	@repeticoes
	@antecessores
	@predecessores
	
	def initialize
		@valor = 5
		@repeticoes = 1
	end
	
	def > (romano)
		@valor > romano.valor
	end
end

describe "Numeracao I" do
	before(:each) do
		@i = I.new
	end
	
	describe "#valor" do
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
	
end

describe "Numeracao V" do
	before(:each) do
		@v = V.new
	end
	
	describe "#valor" do
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
	
end