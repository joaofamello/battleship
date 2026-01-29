require_relative 'ship'

# Representa um Navio de Guerra, o segundo maior navio da frota.
# Ocupa 4 células no tabuleiro.
# @see Ship Para a lógica base de funcionamento.
# @author João Francisco
class Warship < Ship
  # Inicializa um novo navio de guerra com tamanho fixo de 4.
  def initialize
    super(4)
  end
end
