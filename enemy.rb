require 'dxruby'

# キャラクターのアニメーション画像を読み込む
animation_frames = Image.load_tiles('image/400.png', 4, 1)

# キャラクターの位置とアニメーション関連の変数
x = 100
y = 200
frame_index = 0
animation_speed = 4  # アニメーション速度を調整するための変数

# ゲームループ
Window.loop do
  # キー入力を監視

  # 画面をクリア
  Window.draw_box_fill(0, 0, Window.width, Window.height, [0, 0, 0])

  # キャラクターのアニメーションを描画
  animation_frames[frame_index].draw(x, y, 0)  # 0を追加して修正

  # アニメーション速度に応じてフレームを切り替え
  frame_index = (frame_index + 1) % animation_frames.size if Window.frame_count % animation_speed == 0

  # 終了条件（Escキーで終了）
  break if Input.key_push?(K_ESCAPE)
end

# ゲーム終了
Window.close