require 'dxruby'

#テキストウィンドウの背景指定
text_window_bcolor = [128,128,128]

Window.width = 640
Window.height = 480

#フォントの設定
custom_font3 = Font.new(350, 'メイリオ') # カスタムフォントサイズ32、'メイリオ' フォントを使用

#テキストのリスト（改行を含むテキストを使用）
texts = [
  "20の青年三人組は",
  "ある日\n閉鎖された山の上にある廃校を見つける",
  "度胸試しに柵を乗り越え中を徘徊する少年たち",
  "いくつかの棟があり自分たちの通う学校よりもはるかに大きい",
  "だが\n中の部屋にあるのは古びた机やイス、\nよくある学校の備品",
  "奥へ奥へと進んでいくが\n暗いだけで特に面白いものはない",
  "最後の棟である五番目の棟に入った",
  "階段を上がり一番上の階についた\nその時異変が起きた",
  "その時異変が起きた",
  "人間の足音ではないと直感で気付いた\n明かりは自分たちの持つ懐中電灯だけ",
  "Cはもう帰ろうと提案するが\n二人は構わず先に進んだ",
  "異臭がする",
  "恐る恐る物音のする部屋の扉を開けるとそこには...",
  "見たこともない怪物がいた\n本能的に死を悟った三人",
  # さらに多くのテキストを追加
]

#テキストのインデックス
text_index = 0

#テキストウィンドウの位置とサイズ
text_window_x = 50
text_window_y = 50
text_window_width = 540
text_window_height = 380

#ゲームループ
Window.loop do
  # テキストウィンドウを描画
  Window.draw_box_fill(text_window_x, text_window_y, text_window_x + text_window_width, text_window_y + text_window_height, text_window_bcolor)
  
  # テキストを描画（カスタムフォントを使用）
  text = texts[text_index]
  lines = text.split("\n")
  lines.each_with_index do |line, i|
    Window.draw_font(text_window_x + 20, text_window_y + 20 + i * custom_font3.size, line, custom_font3)
  end

  # Enterキーで次のテキストに進む
  if Input.key_push?(K_RETURN)
    text_index += 1
    # テキストが最後まで表示されたらゲーム終了
    if text_index >= texts.length
      exit
    end
  end
end