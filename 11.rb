require 'dxruby'

# BGMの読み込み
bgm = Sound.new("SE/bgm (mp3cut.net).wav")

# BGMをループ再生モードに設定
bgm.loop_count = -1

# キーボード入力の状態を保持する変数
key_state = {
  K_W: false,
}

# BGM再生フラグ
bgm_playing = false

# ゲームループ
Window.loop do
  # Wキーが長押し中の場合
  if Input.key_down?(K_W)
    # BGMが再生されていない場合、再生開始
    unless bgm_playing
      bgm.play
      bgm_playing = true
    end
  else
    # Wキーを離したらBGMを停止
    bgm.stop if bgm_playing
    bgm_playing = false
  end

  # ゲームウィンドウを更新
end
