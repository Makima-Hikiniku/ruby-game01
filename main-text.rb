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
sound_effect = Sound.new("SE/HitPaw Joiner Audio (2) (mp3cut.net).wav")

# BGMの読み込み
bgm = Sound.new("SE/bgm (mp3cut.net).wav")
bgm.loop_count = -1

# キャラクターの初期位置と移動速度
character_x = 100
character_y = 100
movement_speed = 5

# キャラクター画像の読み込み
character_image = Image.load("SE/kaa.png")

# テキストウィンドウの背景指定
text_window_bcolor = [255, 0, 0]

# フォントの設定
custom_font3 = Font.new(50, '怨霊') # カスタムフォントサイズ32、'メイリオ' フォントを使用

# テキストのリスト（改行を含むテキストを使用）
texts = [
  "20の青年三人組は",
  "ある日\n閉鎖された山の上にある\n廃校を見つける",
  "度胸試しに\n柵を乗り越え中を\n徘徊する少年たち",
  "いくつかの棟があり\n自分たちの通う学校よりも\nはるかに大きい",
  "だが\n中の部屋にあるのは古びた\n机やイス、\nよくある学校の備品",
  "奥へ奥へと進んでいくが\n暗いだけで\n特に面白いものはない",
  "最後の棟である\n五番目の棟に入った",
  "階段を上がり\n一番上の階についた\nその時異変が起きた",
  "その時異変が起きた",
  "人間の足音ではないと\n直感で気付いた\n明かりは自分たちの持つ\n懐中電灯だけ",
  "Cはもう帰ろう\nと提案するが\n二人は構わず先に進んだ",
  "異臭がする",
  "恐る恐る物音のする\n部屋の扉を開けると\nそこには...",
  "見たこともない\n怪物がいた\n本能的に死を悟った三人",
  # ここにさらに多くのテキストを追加
]

# テキストのインデックス
text_index = 0

# テキストウィンドウの位置とサイズ
text_window_x = 0
text_window_y = 0
text_window_width = 640
text_window_height = 480

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
        current_scene = :text_screen
        break
      end
    end

  when :text_screen
    # テキストスクリーンの処理
    # テキストウィンドウを描画
    Window.draw_box_fill(text_window_x, text_window_y, text_window_x + text_window_width, text_window_y + text_window_height, text_window_bcolor)

    # テキストを描画（カスタムフォントを使用）
    text = texts[text_index]
    if text
      lines = text.split("\n")
      lines.each_with_index do |line, i|
        Window.draw_font(text_window_x + 20, text_window_y + 20 + i * custom_font3.size, line, custom_font3)
      end
    end

    # Enterキーで次のテキストに進む
    if Input.key_push?(K_RETURN)
      text_index += 1
      # テキストが最後まで表示されたらゲーム終了
      if text_index >= texts.length
        current_scene = :play_screen
        break
      end
    end

  when :play_screen
    # プレイ画面の処理
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

      # キーボードのESCキーが押されたら終了
      if Input.key_push?(K_ESCAPE)
        break
      end
    end
  end
end
