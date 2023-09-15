require 'dxruby'

# キャラクターの初期位置
character_x = 100
character_y = 100

# ゲームウィンドウの設定
Window.width = 640
Window.height = 480

# キャラクター画像の読み込み
character_image = Image.load("SE/player.png")

# 床の画像の読み込み
floor_image = Image.load("SE/enemy.png")

# サウンドエフェクトの読み込み
sound_effect = Sound.new("SE/walking_on_floor1 (mp3cut.net).wav")

# キーボード入力に関連する変数
is_w_pressed = false
is_a_pressed = false
is_s_pressed = false
is_d_pressed = false

# サウンド再生フラグ
sound_playing = false

# ゲームループ
Window.loop do
  # 床を描画
  Window.draw(0, 0, floor_image)

  # キャラクターを描画
  Window.draw(character_x, character_y, character_image)

  # キーボード入力の取得
  is_w_pressed = Input.key_down?(K_W)
  is_a_pressed = Input.key_down?(K_A)
  is_s_pressed = Input.key_down?(K_S)
  is_d_pressed = Input.key_down?(K_D)

  # キャラクターの動きを制御
  if is_w_pressed
    character_y -= 5
  end
  if is_a_pressed
    character_x -= 5
  end
  if is_s_pressed
    character_y += 5
  end
  if is_d_pressed
    character_x += 5
  end

  # キー入力に応じたサウンドエフェクトの再生とループ
  if is_w_pressed || is_a_pressed || is_s_pressed || is_d_pressed
    unless sound_playing
      sound_effect.play
      sound_playing = true
    end
  else
    sound_playing = false  # キーが離れたらフラグをリセット
  end

  # ゲームウィンドウを更新
end
