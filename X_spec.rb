require_relative './X'

describe "Numeracao V" do
	before(:each) do
		@x = X.new
	end
	
	describe "Atributos" do
		it "valor deve ser igual a 10" do
			expect(@x.valor).to be 10
		end
		
		it "repeticoes deve ser igual a 3" do
			expect(@x.repeticoes).to be 3
		end
		
		it "letra deve ser igual a X" do
			expect(@x.letra).to eq "X"
		end
	end
	
end