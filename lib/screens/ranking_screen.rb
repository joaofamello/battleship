require_relative 'base_screen'

class RankingScreen < BaseScreen
  def draw
    draw_header("HALL OF FAME")

    # fake data
    scores = [
      { name: "ADMIRAL NELSON", score: 5000 },
      { name: "PLAYER 1",       score: 3200 },
      { name: "DEEP BLUE BOT",  score: 1500 },
      { name: "ROOKIE",         score: 800 }
    ]

    y_start = 200
    scores.each_with_index do |entry, i|
      color = (i == 0) ? Theme::COLOR_ACCENT : Theme::COLOR_TEXT
      text = "#{i + 1}. #{entry[:name]} ................. #{entry[:score]}"

      draw_centered_text(text, y_start + (i * 50), color, @btn_font)
    end

    draw_footer_hint
  end
end