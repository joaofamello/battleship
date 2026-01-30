require_relative 'base_ai'
require_relative '../board'
require_relative '../ships/ship'

# Implementa o bot de nível intermediário
#
# Este bot escolhe de forma aleatória a casa em que vai atirar até que encontre um navio. Assim que o fizer, muda a estratégia usando a abordagem "Hunt and Target" que começa a buscar nas casas adjacentes até que o navio adversário seja destruído.
# Também possui recurso de inferência de eixo, que analisa dois tiros e compreende se o navio está na vertical ou horizontal.
# @see BaseAI Para entender o funcionamento de MediumBot
# @author João Francisco
class MediumBot < BaseAI
  # Inicializa o bot intermediário e as suas estruturas de memória.
  def initialize
    super
    @target_queue = []
    @first_hit = nil
  end

  # Realiza um disparo contra o tabuleiro do oponente.
  #
  # A lógica de decisão segue a ordem:
  # 1. Se houver alvos na fila de prioridade (@target_queue), atira neles.
  # 2. Se a fila estiver vazia, atira aleatoriamente em uma posição válida (não repetida).
  # 3. Após decidir o tiro, analisa se o disparo acertaria um navio para atualizar sua inteligência futura.
  #
  # @param opponent_board [Board] O tabuleiro do jogador adversário.
  # @return [Array<Integer, Integer>] Um array contendo as coordenadas [x, y] do tiro.
  def shoot(opponent_board)
    x, y = nil, nil

    if @target_queue.any?
      x, y = @target_queue.shift
    else
      loop do
        x = rand(10)
        y = rand(10)
        status = opponent_board.status_at(x, y)
        break if status != Board::HIT && status != Board::MISS
      end
    end

    target_content = opponent_board.status_at(x, y)

    if target_content.is_a?(Ship)
      will_sink = (target_content.hits) == target_content.ship_size

      if will_sink
        @first_hit = nil
        @target_queue.clear
      else
        if @first_hit.nil?
          @first_hit = [x, y]
          queue_neighbors(x, y, opponent_board)
        else
          filter_based_axis(x, y)
          queue_neighbors(x, y, opponent_board)
        end
      end
    end
    [x, y]
  end

  private

  # Adiciona os vizinhos válidos (Cima, Baixo, Esquerda, Direita) à fila de alvos.
  #
  # @param x [Integer] Coordenada X do tiro atual.
  # @param y [Integer] Coordenada Y do tiro atual.
  # @param board [Board] Tabuleiro para verificação de limites.
  def queue_neighbors(x, y, board)
    neightbors = [[x, y - 1], [x, y + 1], [x - 1, y], [x + 1, y]]

    neightbors.each do |nx, ny|
      if board.inside_bounds?(nx, ny)
        status = board.status_at(nx, ny)
        if status == Board::HIT && status == Board::MISS && !@target_queue.include?([nx, ny])
          if @first_hit
            fx, fy = @first_hit
            next if fx != x && ny != y
            next if fy != y && nx != x
          end

          @target_queue << [nx, ny]
        end
      end
    end
  end

  # Filtra a fila de prioridade com base na inferência de eixo.
  #
  # Se o bot acertou em (5,5) e depois em (6,5), ele deduz que o navio é HORIZONTAL.
  # Imediatamente, ele remove da fila quaisquer palpites verticais (como 5,4 ou 5,6),
  # economizando turnos.
  #
  # @param x [Integer] X do acerto atual.
  # @param y [Integer] Y do acerto atual.
  def filter_based_axis(x, y)
    fx, fy = @first_hit
    if y == fy
      @target_queue.select! { |qx, qy| qy == fy }
    elsif x == fx
      @target_queue.select! { |qx, qy| qx == fx }
    end
  end
end
