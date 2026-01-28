
class Ship
  attr_accessor :ship_size, :positions, :hits, :status

  INTACT    = :Intact
  DAMAGED   = :Damaged
  DESTROYED = :Destroyed

  def initialize(ship_size)
    @ship_size = ship_size
    @positions = []
    @hits = 0
    @status = INTACT
  end

  def receive_hit
    @hits += 1
    if @hits < @ship_size
      @status = DAMAGED
    elsif @hits == @ship_size
      @status = DESTROYED
    end
  end

end
