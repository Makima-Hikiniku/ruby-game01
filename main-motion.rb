require 'dxruby'

# 初期シーンを設定
current_scene = :play_screen

# キャラクターの初期位置と移動速度
character_x = 100
character_y = 100
movement_speed = 5

# キャラクター画像の読み込み
character_image = Image.load("SE/kaa.png")

# サウンドエフェクトの読み込み
sound_effect = Sound.new("SE/asioto.wav")

# サウンド再生フラグ
sound_playing = false

# ゲームループ
Window.loop do
  # ウィンドウをクリア
  Window.draw_box_fill(0, 0, Window.width, Window.height, [0, 0, 0])

  # キャラクターを描画
  Window.draw(character_x, character_y, character_image)

  # キー入力の検出
  key_state = {
    K_W: Input.key_down?(K_W),
    K_A: Input.key_down?(K_A),
    K_S: Input.key_down?(K_S),
    K_D: Input.key_down?(K_D)
  }

  # キャラクターの移動
  if key_state[:K_W]
    character_y -= movement_speed
  end
  if key_state[:K_A]
    character_x -= movement_speed
  end
  if key_state[:K_S]
    character_y += movement_speed
  end
  if key_state[:K_D]
    character_x += movement_speed
  end

  # キーが押されているかつサウンドが再生されていない場合、サウンドを再生
  if key_state.values.any? && !sound_playing
    sound_effect.play
    sound_playing = true
  end

  # キーが離された場合、サウンドを停止
  if !key_state.values.any?
    sound_effect.stop
    sound_playing = false
  end

  # キーボードのESCキーが押されたら終了
  break if Input.key_push?(K_ESCAPE)
end
