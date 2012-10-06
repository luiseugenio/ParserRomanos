require_relative './D'

describe "Numeracao D" do
	before(:each) do
		@d = D.new
	end
	
	describe "Atributos" do
		it "repeticoes deve ser igual a 3" do
			expect(@d.repeticoes).to be 1
		end
		
		it "valor deve ser igual a 1" do
			expect(@d.valor).to be 500
		end
		
		it "letra deve ser igual a D" do
			expect(@d.letra).to eq "D"
		end
	end
end