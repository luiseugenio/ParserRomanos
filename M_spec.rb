require_relative './M'

describe "Numeracao M" do
	before(:each) do
		@m = M.new
	end
	
	describe "Atributos" do
		it "repeticoes deve ser igual a 3" do
			expect(@m.repeticoes).to be 3
		end
		
		it "valor deve ser igual a 1" do
			expect(@m.valor).to be 1000
		end
		
		it "letra deve ser igual a M" do
			expect(@m.letra).to eq "M"
		end
	end
end