require 'dxruby'

# 画像を読み込む
image1 =  Image.load_tiles("image/400.png", 4, 4, true)


# 初期の画像を設定
x = 320
y = 240
current_image = image1[0]


speed = 5
Window.width = 800
Window.height = 800


# ゲームループ
Window.loop do
  
  # キー入力を監視
  if Input.key_down?(K_W)
    current_image = image1[5]
    if Input.key_down?(K_LSHIFT)
      y -= speed*2
    else
      y -= speed
    end
    
    
  elsif Input.key_down?(K_S)
    current_image = image1[1]
  
    if Input.key_down?(K_LSHIFT)
      y += speed*2
    else
      y += speed
    end
  elsif Input.key_down?(K_A)
    current_image = image1[9]
  
    if Input.key_down?(K_LSHIFT)
      x -= speed*2
    else
      x -= speed
    end
    
  elsif Input.key_down?(K_D)
    current_image = image1[13]
    
    if Input.key_down?(K_LSHIFT)
      x += speed*2
    else
      x += speed
    end
  
      

  end
  
  # 画面に描画
  Window.draw(x, y, current_image)

  # 終了条件（Escキーで終了）
  break if Input.key_push?(K_ESCAPE)
end

# ゲーム終了
Window.close