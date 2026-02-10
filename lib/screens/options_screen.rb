require_relative 'base_screen'

class OptionsScreen < BaseScreen
  def draw
    draw_header("OPTIONS")

    btn_w = 300
    x = (@window.width - btn_w) / 2

    draw_btn("[ X ] MASTER VOLUME", x, 230, btn_w, 50)
    draw_btn("[ X ] FULL SCREEN",   x, 300, btn_w, 50)
    draw_btn("[   ] HARD MODE",     x, 370, btn_w, 50)

    draw_footer_hint
  end
end