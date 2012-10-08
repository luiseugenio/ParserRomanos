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

  describe "Sequencia válida em Romanos deve efetuar o parser" do
    it "quando for passado 1 dos caracteres aceitáveis" do
      @aceitaveis.reduce('') {|s, el|
        expect(@parser.parse_numeral(el.first)).to eql el.last
      }
    end

    it "quando for passado 2 dos caracteres aceitáveis" do
      valor = 4
      expect(@parser.parse_numeral("IV")).to eql valor
    end

    it "quando for passado 3 dos caracteres aceitáveis" do
      valor = 14
      expect(@parser.parse_numeral("XIV")).to eql valor
    end

    it "quando for passado mais que 3 dos caracteres aceitáveis" do
      valor = 3999
      expect(@parser.parse_numeral("MMMCMXCIX")).to eql valor
    end

  end

  describe "Sequencia inválida em Romanos deve efetuar o parser" do
    it "quando for passado qualquer quantidade dos caracteres aceitáveis" do
      valor_iiii = 4
      expect(@parser.parse_numeral("IIII")).to eql valor_iiii
    end

    it "quando for passado 1 caracter inválido" do
      expect(@parser.parse_numeral("Z")).to eql nil
    end

    it "quando for passado algum caracter inválido dentro de um sequencia de caracteres válidos" do
      valor_iv = 4
      expect(@parser.parse_numeral("ZIV")).to eql valor_iv
      expect(@parser.parse_numeral("IZV")).to eql valor_iv
      expect(@parser.parse_numeral("IVZ")).to eql valor_iv
    end
  end
end
