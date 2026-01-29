require_relative 'ship'

# Representa um Porta-aviões, o maior navio da frota.
# Ocupa 6 células no tabuleiro.
class Flattop < Ship
  # Inicializa um novo Porta-aviões com tamanho fixo de 6.
  def initialize
    super(6)
  end
end
