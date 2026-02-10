require_relative 'base_screen'
require_relative '../models/board'
require_relative '../models/player'
require_relative '../models/ai/medium_bot'

class GameScreen < BaseScreen
  def initialize(window)
    super(window)
  end

  def draw
    draw_header("BATTLE STATIONS")

    draw_centered_text("In progress...", 180, Theme::COLOR_TEXT, @btn_font)
  end
end