require 'dxruby'

# キャラクターの初期位置
character_x = 100
character_y = 100

# キャラクターの移動速度
movement_speed = 5

# サウンドエフェクトの読み込み
sound_effect = Sound.new("SE/walking_on_floor1 (mp3cut.net).wav")

# マップの当たり判定の画像を読み込み
map_collision = Image.load("SE/ka.png")

# BGMの読み込み
bgm = Sound.new("SE/bgm (mp3cut.net).wav")

# BGMをループ再生モードに設定
bgm.loop_count = -1  # -1を設定すると無限ループになります

# ゲームウィンドウの設定
Window.width = 640
Window.height = 480

# キャラクター画像の読み込み
character_image = Image.load("SE/kaa.png")

# 床の画像の読み込み
floor_image = Image.load("SE/iki.png")

# マップ上の当たり判定を描画する関数
def draw_map_collision
  map_collision.draw(0, 0)
end

# テキストボックスの描画メソッド
def draw_textbox(x, y, width, height, color)
  r, g, b, a = color
  Window.draw_box(x, y, x + width, y + height, [r, g, b, a], fill: true)
end

# テキストを表示するメソッド
def draw_text(x, y, text, color, font_size)
  Font.default.size = font_size
  Window.draw_font(x, y, text, Font.default, color: color)
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
  draw_floor(floor_image)

  # マップ上の当たり判定を描画
  draw_map_collision

  # キャラクターを描画
  Window.draw(character_x, character_y, character_image)

  # テロップ枠を描画
  draw_textbox(10, 300, 620, 100, [0, 0, 0, 128])

  # 現在のテロップを表示
  draw_text(20, 310, teleprompter[current_teleprompter_index], [255, 255, 255], 24)

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

  # キャラクターの当たり判定
  if character_x < 0
    character_x = 0
  elsif character_x + character_image.width > Window.width
    character_x = Window.width - character_image.width
  end

  if character_y < 0
    character_y = 0
  elsif character_y + character_image.height > Window.height
    character_y = Window.height - character_image.height
  end

  # マップ上の当たり判定
  if character_x < 160 && character_y < 160
    character_x = 160
    character_y = 160
    sound_effect.play
  end
end
