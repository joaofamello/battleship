require_relative 'base_screen'

class OptionsScreen < BaseScreen
  def draw
    draw_header("OPÇÕES")

    btn_w = 300
    x = (@window.width - btn_w) / 2

    draw_btn("[ X ] VOLUME MASTER", x, 230, btn_w, 50)
    draw_btn("[ X ] TELA CHEIA",    x, 300, btn_w, 50)
    draw_btn("[   ] MODO DIFÍCIL",  x, 370, btn_w, 50)

    draw_footer_hint
  end
end