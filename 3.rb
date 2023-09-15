require 'dxruby'

# キャラクターの初期位置
character_x = 100
character_y = 100

# キャラクターの移動速度
movement_speed = 5

# サウンドエフェクトの読み込み
sound_effect = Sound.new("SE/walking_on_floor1 (mp3cut.net).wav")

# BGMの読み込み
sound_effect2 = Sound.new("SE/bgm.mp3")

# ゲームウィンドウの設定
Window.width = 640
Window.height = 480

# キャラクター画像の読み込み
character_image = Image.load("SE/player.png")

# 床の画像の読み込み
floor_image = Image.load("SE/enemy.png")

# 最後にキーが処理された時間
last_key_time = Time.now

# キーボード入力の状態を保持する変数
key_state = {
  K_W: false,
  K_A: false,
  K_S: false,
  K_D: false,
  K_SPACE: false
}

# ゲームループ
Window.loop do
  # 床を描画
  Window.draw(0, 0, floor_image)

  # キャラクターを描画
  Window.draw(character_x, character_y, character_image)

  # 現在の時間を取得
  current_time = Time.now

  # 0.01秒ごとにキーボード入力の処理を行う
  if (current_time - last_key_time).to_f >= 0.01
    last_key_time = current_time

    # キーボード入力の取得
    key_state[K_W] = Input.key_down?(K_W)
    key_state[K_A] = Input.key_down?(K_A)
    key_state[K_S] = Input.key_down?(K_S)
    key_state[K_D] = Input.key_down?(K_D)
    key_state[K_SPACE] = Input.key_push?(K_SPACE)

    # キー入力に応じたサウンドエフェクトの再生
    if key_state.values.any? { |pressed| pressed }
      sound_effect.play
    end

    # スペースキーが押されたらBGMを再生
    if key_state[K_SPACE]
      sound_effect2.play
    end
  end

  # キャラクターの移動
  if key_state[K_W]
    character_y -= movement_speed
  end
  if key_state[K_A]
    character_x -= movement_speed
  end
  if key_state[K_S]
    character_y += movement_speed
  end
  if key_state[K_D]
    character_x += movement_speed
  end

  # ゲームウィンドウを更新
end
