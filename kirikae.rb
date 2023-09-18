require 'dxruby'

# 初期のゲームステートを設定
# ここでは:menuと:gameという2つのステートを使用する例です
current_state = :menu

text_window_bcolor = [0,0,255]

Window.width = 640
Window.height = 480

#フォントの設定
custom_font = Font.new(32, 'メイリオ') # カスタムフォントサイズ32、'メイリオ' フォントを使用

#テキストのリスト（改行を含むテキストを使用）
texts = [
  "テキスト1\n改行1",
  "テキスト2\n改行2",
  "テキスト3\n改行3",
  # さらに多くのテキストを追加
]

#テキストのインデックス
text_index = 0

#テキストウィンドウの位置とサイズ
text_window_x = 50
text_window_y = 50
text_window_width = 540
text_window_height = 380

# ゲームループ
Window.loop do
  case current_state
  when :menu
    # メニュー画面の処理
    # Pキーを押したらゲーム画面に切り替える
    if Input.key_push?(K_P)
      current_state = :game
    end
    Window.draw_font(100, 100, "メニュー画面", Font.default)
  when :game
    # ゲーム画面の処理
    # Pキーを押したらメニュー画面に切り替える
    Window.draw_box_fill(text_window_x, text_window_y, text_window_x + text_window_width, text_window_y + text_window_height, text_window_bcolor)
  
    # テキストを描画（カスタムフォントを使用）
    text = texts[text_index]
    lines = text.split("\n")
    lines.each_with_index do |line, i|
        Window.draw_font(text_window_x + 20, text_window_y + 20 + i * custom_font.size, line, custom_font)
    end

    #  Enterキーで次のテキストに進む
    if Input.key_push?(K_RETURN)
        text_index += 1
        # テキストが最後まで表示されたらゲーム終了
        if text_index >= texts.length
        exit
        end
    end
  end

  # ゲーム終了条件（Escキーで終了）
  break if Input.key_push?(K_ESCAPE)
end

# ゲーム終了
Window.close
