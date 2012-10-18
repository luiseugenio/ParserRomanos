# encoding: utf-8
require '../models/parser_romano_numeral'

describe ParserRomanoNumeral do

  before(:all) do
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

  before(:each) do
    @parser = ParserRomanoNumeral.new
  end

  it "deve retornar o valor do romano passado em um vetor ao chamar compoe_numero" do
    romano = 'IV'
    valor_romano = [1,5]
    expect(@parser.compoe_numero(romano)).to eql valor_romano
  end

  it "deve retornar a primeira posicao do vetor passado ao chamar exibe_valor_numeral" do
    numero_composto = [1,2,3]
    valor = 1
    expect(@parser.exibe_valor_numeral(numero_composto)).to eql valor
  end

  describe "Sequencia válida em Romanos deve efetuar o parser" do
    it "quando for passado 1 unico caracter e ele for um caracter aceitável" do
      @aceitaveis.reduce('') {|s, el|
        expect(@parser.parse_numeral(el.first)).to eql el.last
      }
    end

    it "quando for passado mais que 1 dos caracteres aceitáveis" do
      valor = 3999
      expect(@parser.parse_numeral("MMMCMXCIX")).to eql valor
    end

  end

  describe "Sequencia inválida em Romanos deve efetuar o parser" do
    it "quando for passado qualquer quantidade dos caracteres aceitáveis" do
      valor_iiii = 4
      expect(@parser.parse_numeral("IIII")).to eql valor_iiii
    end

    it "quando for passado algum caracter inválido dentro de um sequencia de caracteres válidos" do
      valor_iv = 4
      expect(@parser.parse_numeral("ZIV")).to eql valor_iv
      expect(@parser.parse_numeral("IZV")).to eql valor_iv
      expect(@parser.parse_numeral("IVZ")).to eql valor_iv
    end
  end

  describe "Deve disparar uma exception" do
    it "quando nao for passado nenhum caracter" do
      lambda {@parser.parse_numeral("")}.should raise_exception(Exception, 'Argumentos Invalidos')
    end

    it "quando for passado apenas 1 caracter e esse for inválido" do
      lambda {@parser.parse_numeral("Z")}.should raise_exception(Exception, 'Argumentos Invalidos')
    end

  end
end
