require 'dxruby'

# BGMの読み込み
bgm = Sound.new("SE/bgm (mp3cut.net).wav")

# BGMの再生
bgm.play

# ゲームウィンドウの設定
Window.width = 640
Window.height = 480

# ゲームループ
Window.loop do
  # ゲームの処理をここに記述
end
