require_relative './I'

describe "Numeracao I" do
	before(:each) do
		@i = I.new
	end
	
	describe "Atributos" do
		it "repeticoes deve ser igual a 3" do
			expect(@i.repeticoes).to be 3
		end
		
		it "valor deve ser igual a 1" do
			expect(@i.valor).to be 1
		end
		
		it "letra deve ser igual a I" do
			expect(@i.letra).to eq "I"
		end
	end
end