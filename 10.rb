require 'dxruby'

# ゲームウィンドウの幅と高さを設定
Window.width = 640
Window.height = 480

# フォントの読み込み
custom_font1 = Font.new(350, "chiller")
custom_font2 = Font.new(50, "OpenSans-Regular.ttf")

# 初期シーンを設定
current_scene = :start_screen

# サウンドエフェクトの読み込み
sound_effect = Sound.new("SE/walking_on_floor1 (mp3cut.net).wav")

# BGMの読み込み
bgm = Sound.new("SE/bgm (mp3cut.net).wav")
bgm.loop_count = -1

# キャラクターの初期位置と移動速度
character_x = 100
character_y = 100
movement_speed = 5

# キャラクター画像の読み込み
character_image = Image.load("SE/kaa.png")

# プレイ画面の処理
def play_screen(character_x, character_y, movement_speed, character_image, sound_effect, bgm)
  # サウンド再生フラグ
  sound_playing = false

  # キャラクターの初期位置と移動速度
  character_x = 100
  character_y = 100
  movement_speed = 5

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
end

# ゲームループ
Window.loop do
  case current_scene
  when :start_screen
    # スタート画面の処理
    Window.loop do
      # ウィンドウをクリア
      Window.draw_box_fill(0, 0, Window.width, Window.height, [0, 0, 0])

      # テキストを表示
      Window.draw_font(100, 50, "kappa", custom_font1, color: [255, 0, 0])
      Window.draw_font(20, 400, "pをクリックしてゲームを開始", custom_font2, color: [255, 250, 250])

      # ゲームウィンドウを更新
      key_state = {}
      key_state[K_P] = Input.key_push?(K_P)

      # スペースキーが押されたらBGMを再生
      if key_state[K_P]
        bgm.play
      end

      if Input.key_push?(K_P)
        current_scene = :play_screen
        break
      end
    end

  when :play_screen
    # プレイ画面の処理
    play_screen(character_x, character_y, movement_speed, character_image, sound_effect, bgm)

  when :result_screen
    # 結果画面の処理
    Window.loop do
      # ウィンドウをクリア
      Window.draw_box_fill(0, 0, Window.width, Window.height, [0, 0, 0])

      # テキストを表示
      Window.draw_font(100, 50, "Game Over", custom_font1, color: [255, 0, 0])
      Window.draw_font(20, 400, "pをクリックしてリトライ", custom_font2, color: [255, 250, 250])

      # ゲームウィンドウを更新
      if Input.key_push?(K_P)
        current_scene = :start_screen
        break
      end
    end
  end
end
