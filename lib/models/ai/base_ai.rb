require_relative '../board'
require_relative '../ships/submarine'
require_relative '../ships/warship'
require_relative '../ships/flattop'
require_relative '../ships/battleship'
class BaseAI

  attr_reader :board, :fleet
  def initialize
    @board = Board.new
    @fleet = [
      Flattop.new,
      Flattop.new,
      Warship.new,
      Warship.new,
      Battleship.new,
      Submarine.new
    ]
  end

  def setup_ships
    @fleet.each do |ship| # Vai percorrer o @fleet para posicionar cada navio
      loop do # Vai fazer as tentativas para posicionar o navio
        x = rand(10)
        y = rand(10)
        orientation = [:horizontal, :vertical].sample

        if @board.place_ship(ship, x, y, orientation)
          break
        end

      end
    end
    puts "A IA posicionou a frota"
  end

  def shoot(target)
    raise "Erro: O método shoot deve ser implementado pela classe filha!"
  end
end