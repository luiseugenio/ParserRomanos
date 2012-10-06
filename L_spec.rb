require_relative './L'

describe "Numeracao L" do
	before(:each) do
		@l = L.new
	end
	
	describe "Atributos" do
		it "repeticoes deve ser igual a 3" do
			expect(@l.repeticoes).to be 1
		end
		
		it "valor deve ser igual a 1" do
			expect(@l.valor).to be 50
		end
		
		it "letra deve ser igual a L" do
			expect(@l.letra).to eq "L"
		end
	end
end