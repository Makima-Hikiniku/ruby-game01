require 'dxruby'

# キャラクターの初期位置
character_x = 100
character_y = 100

# キャラクターの移動速度
movement_speed = 5

# サウンドエフェクトの読み込み
sound_effect = Sound.new("SE/walking_on_floor1 (mp3cut.net).wav")

# BGMの読み込み
bgm = Sound.new("SE/bgm (mp3cut.net).wav")  # BGMファイルのパスを指定してください

# BGMをループ再生モードに設定
bgm.loop_count = -1  # -1を設定すると無限ループになります

# ゲームウィンドウの設定
Window.width = 640
Window.height = 480

# キャラクター画像の読み込み
character_image = Image.load("SE/kaa.png")

# 床の画像の読み込み
floor_image = Image.load("SE/iki.png")

# 床の画像を繰り返し描画する関数
def draw_floor(floor_image)
  window_width = Window.width
  window_height = Window.height
  floor_width = floor_image.width
  floor_height = floor_image.height

  x = 0
  y = 0

  while y < window_height
    while x < window_width
      Window.draw(x, y, floor_image)
      x += floor_width
    end
    x = 0
    y += floor_height
  end
end

# 最後にキーが処理された時間
last_key_time = Time.now

# キーボード入力の状態を保持する変数
key_state = {
  K_W: false,
  K_A: false,
  K_S: false,
  K_D: false,
  K_P: false
}

# ゲームループ
Window.loop do
  # 床を描画
  draw_floor(floor_image)

  # キャラクターを描画
  Window.draw(character_x, character_y, character_image)

  # 現在の時間を取得
  current_time = Time.now

  key_state[K_P] = Input.key_push?(K_P)

  # スペースキーが押されたらBGMを再生
  if key_state[K_P]
    bgm.play
  end

  # 0.01秒ごとにキーボード入力の処理を行う
  if (current_time - last_key_time).to_f >= 0.2
    last_key_time = current_time

    # キーボード入力の取得
    key_state[K_W] = Input.key_down?(K_W)
    key_state[K_A] = Input.key_down?(K_A)
    key_state[K_S] = Input.key_down?(K_S)
    key_state[K_D] = Input.key_down?(K_D)
    
    # キー入力に応じたサウンドエフェクトの再生
    if key_state.values.any? { |pressed| pressed }
      sound_effect.play
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
