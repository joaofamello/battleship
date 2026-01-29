require_relative 'ship'

# Representa um Encouraçado, o segundo menor navio da frota.
# Ocupa 3 células no tabuleiro.
class Battleship < Ship
  # Inicializa um novo encouraçado com tamanho fixo de 3.
  def initialize
    super(3)
  end
end
