require_relative './C'

describe "Numeracao C" do
	before(:each) do
		@c = C.new
	end
	
	describe "Atributos" do
		it "repeticoes deve ser igual a 3" do
			expect(@c.repeticoes).to be 3
		end
		
		it "valor deve ser igual a 1" do
			expect(@c.valor).to be 100
		end
		
		it "letra deve ser igual a C" do
			expect(@c.letra).to eq "C"
		end
	end
end