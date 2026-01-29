require_relative 'ship'

# Representa um Submarino, o menor navio da frota.
# Ocupa apenas 1 célula no tabuleiro.
#
# @see Ship Para a lógica base de funcionamento.
# @author João Francisco
class Submarine < Ship
  # Inicializa um novo submarino com tamanho fixo de 1.
  def initialize
    super(1)
  end
end
