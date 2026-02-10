require_relative 'base_screen'

class CampaignScreen < BaseScreen
  def draw
    draw_header("CAMPAIGN MAP")

    draw_centered_text("Select a mission:", 180, Theme::COLOR_TEXT, @btn_font)

    btn_w = 300
    start_x = (@window.width - btn_w) / 2

    draw_btn("MISSION 1: Training day", start_x, 230, btn_w, 50)
    draw_btn("MISSION 2: The Atlantic", start_x, 300, btn_w, 50)
    draw_btn("MISSION 3: Final boss",   start_x, 370, btn_w, 50)

    draw_footer_hint
  end
end