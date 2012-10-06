require_relative './Parser'


describe "Parser" do
	before(:each) do
		@p = Parser.new
	end
	
	
	
	describe "validacoes" do
		it "nao deve aceitar Z como parametro" do
			expect{ @p.parse("Z") }.to raise_error(ArgumentError, "Numero romano nao encontrado: Z")
		end
	end
	
	describe "Parse" do
		it "XXIV deve retornar 24" do
			expect(@p.parse("XXIV")).to eq 24
		end
	end
	
	describe "Valicacoes" do
		it "nao deve receber mais de 3 I como parametro "
		it "nao deve receber mais de 1 V como parametro "
		it "nao deve receber mais de 3 X como parametro "
		it "nao deve receber mais de 1 L como parametro "
		it "nao deve receber mais de 3 C como parametro "
		it "nao deve receber mais de 1 D como parametro "
		it "nao deve receber mais de 3 M como parametro "
		
	end
	
	
end