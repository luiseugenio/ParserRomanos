require_relative './V'

describe "Numeracao V" do
	before(:each) do
		@v = V.new
	end
	
	describe "Atributos" do
		it "valor deve ser igual a 5" do
			expect(@v.valor).to be 5
		end
		
		it "repeticoes deve ser igual a 1" do
			expect(@v.repeticoes).to be 1
		end
		
		it "letra deve ser igual a V" do
			expect(@v.letra).to eq "V"
		end
	end
	
end