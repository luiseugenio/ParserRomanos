# encoding: utf-8

class ParserRomanoNumeral

  def initialize
    @aceitaveis = {
	      "I" => 1,
	      "V" => 5,
	      "X" => 10,
	      "L" => 50,
	      "C" => 100,
	      "D" => 500,
	      "M" => 1000
	      }
  end

  def parse_numeral(romano)
    numero_composto = compoe_numero(romano)
    raise Exception, 'Argumentos Invalidos' if numero_composto.empty?

    if numero_composto.length > 1
      aplica_regra_romano(numero_composto, romano)
    end
     exibe_valor_numeral(numero_composto)
  end

  def compoe_numero(romano)
    composicao = []
    romano.each_char do |caracter|
      composicao << @aceitaveis[caracter] if @aceitaveis.include?(caracter)
    end
    composicao
  end

  def exibe_valor_numeral(numero_composto)
    numero_composto[0]
  end

private

  def aplica_regra_romano(numero_composto, romano)
    ultima_posicao = -1
    penultima_posicao = -2
    verifica_repeticoes(numero_composto, romano)
    while numero_composto.length > 1
      if numero_composto[ultima_posicao] > numero_composto[penultima_posicao]
        numero_composto[penultima_posicao] = numero_composto [ultima_posicao] - numero_composto[penultima_posicao]
        numero_composto.delete_at(ultima_posicao)
      else
        numero_composto[penultima_posicao] += numero_composto[ultima_posicao]
        numero_composto.delete_at(ultima_posicao)
      end
    end
  end

  def verifica_repeticoes(numero_composto, romano)
    # Combinando todos os romanos vizinhos semelhantes usando expressão regular
    @aceitaveis.each do |numero|
      # retorna o offset da primeira aparicao da repeticao do numero
      # em XII retorna 1 (caso o numero seja I)
      # em XX retorna 0 (caso o numero seja X)
      offset_primeira_posicao = /#{numero}{2,}/ =~ romano
      unless offset_primeira_posicao.nil?
        # retorna o que foi encontrado de igual
        # em XII retorna II (caso o numero seja I)
        # em XX retorna XX (caso o numero seja X)
        numero_repetido = romano.match(/#{numero}{2,}/)
        # retorna quantas vezes existe repetição do numero
        # em XII retorna 2 (caso o numero seja I)
        # em XX retorna 2 (caso o numero seja X)
        quantidade_repeticoes = numero_repetido[0].length
        numero_composto[offset_primeira_posicao] = numero_composto[offset_primeira_posicao] * quantidade_repeticoes
        # removendo do array os romanos repetidos, deixando apenas a 1a ocorrencia
        numero_composto.slice!(offset_primeira_posicao+1, quantidade_repeticoes-1)
      end
    end
  end
end
