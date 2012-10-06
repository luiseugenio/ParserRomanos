require_relative './I'
require_relative './V'
require_relative './X'

class Parser
	def initialize
		@charsAceitos = ['I', 'V', 'X']
	end
	
	def parse (romano)
		array = string_para_romanos(romano)

		final = 0;
		i = array.length
		while i > 0
			i = i-1
			atual = array[i]
			proximo = pega_proximo(array, i)
			anterior = pega_anterior(array, i)
			
			#Se tiver anterior, verifica se ele é menor que o atual, subtrai e pula. se não, soma
			if(anterior)
				if atual.deve_subtrair?(anterior)
					final = (atual.valor - anterior.valor)
					i = i-1
				else
					final = final + atual.valor
				end
			else
				final = final + atual.valor
			end
			
			
		end
		
		
		final
	end

	def pega_proximo (array, i)
		if i < (array.length - 1)
			array[i + 1]
		end
	end
	
	def pega_anterior (array, i)
		if i > 0
			anterior = array[i - 1]
		end
	end
	
	def string_para_romanos(romanos)
		novo_array = Array.new
		
		romanos.split('').each do |romano|
			case romano
				when 'I' then novo_array << I.new
				when 'V' then novo_array << V.new
				when 'X' then novo_array << X.new
				
				when 'L' then novo_array << L.new
				when 'C' then novo_array << C.new
				when 'D' then novo_array << D.new
				when 'M' then novo_array << M.new
				else raise ArgumentError, "Numero romano nao encontrado: #{romano}"
			end
		end
		
		
		
		novo_array
	end
	
end

