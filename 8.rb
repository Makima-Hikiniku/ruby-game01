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

# テキストボックスの描画メソッド
def draw_textbox(x, y, width, height, color)
  Window.draw_box_fill(x, y, x + width, y + height, color)
end

# テキストを表示するメソッド
def draw_text(x, y, text, color, font_size)
  font = Font.new(font_size)  # フォントサイズを指定して新しいフォントを作成
  Window.draw_font(x, y, text, font, color: color)
end

# テロップの内容を管理する配列
teleprompter = [
  "これはテロップの例です。",
  "新しいメッセージを表示します。",
  "スペースキーを押して次に進めます。",
  "これでテロップの表示ができます。",
  "新しい冒険が始まります！"
]

# 現在表示中のテロップのインデックス
current_teleprompter_index = 0

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

  # テキストボックスを描画（一番上に描画）
  draw_textbox(10, 10, 620, 100, [0, 0, 0, 128])  # 黒色で透明度を128に設定

  # 現在のテロップを表示
  draw_text(20, 20, teleprompter[current_teleprompter_index], [255, 255, 255], 24)

  # キャラクターを描画
  Window.draw(character_x, character_y, character_image)

  # スペースキーが押されたら次のテロップに進む
  if Input.key_push?(K_SPACE)
    current_teleprompter_index += 1

    # テロップが最後まで表示された場合、ゲームを終了
    if current_teleprompter_index >= teleprompter.length
      exit
    end
  end

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
end
