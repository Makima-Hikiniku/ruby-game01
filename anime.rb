require 'dxruby'
class AnimeSprite < Sprite

    def initialize(x=0, y=0, image=nil)
      super
      @anime_sprite_count = 0
      @anime_sprite_frame_count = 1
      @anime_sprite_pause = true
      @anime_sprite_animation_pattern = nil
      @anime_sprite_hash = {}
      @anime_sprite_next = nil
    end
  
    def start_animation(v, animation_pattern=nil, nxt=nil)
      temp = @anime_sprite_hash[v]
      if temp
        @anime_sprite_frame_count = temp[0]
        @anime_sprite_animation_pattern = temp[1]
        @anime_sprite_next = temp[2]
      else
        @anime_sprite_frame_count = v
        @anime_sprite_animation_pattern = animation_pattern
        @anime_sprite_next = nxt
      end
      @anime_sprite_pause = false
      @anime_sprite_count = 0 
    end
  
    def change_animation(v, animation_pattern=nil, nxt=nil)
      temp = @anime_sprite_hash[v]
      if temp
        @anime_sprite_frame_count = temp[0]
        @anime_sprite_animation_pattern = temp[1]
        @anime_sprite_next = temp[2]
      else
        @anime_sprite_frame_count = v
        @anime_sprite_animation_pattern = animation_pattern
        @anime_sprite_next = nxt
      end
    end
  
    def pause_animation
      @anime_sprite_pause = true
    end
  
    def resume_animation
      @anime_sprite_pause = false
    end
  
    def add_animation(v, frame_count, animation_pattern=nil, nxt=nil)
      @anime_sprite_hash[v] = [frame_count, animation_pattern, nxt]
    end
  
    def update
      if @anime_sprite_animation_pattern
        unless @anime_sprite_pause
          @anime_sprite_count += 1
          if @anime_sprite_count >= @anime_sprite_frame_count * @anime_sprite_animation_pattern.size
            if @anime_sprite_next
              temp = @anime_sprite_hash[@anime_sprite_next]
              if temp
                @anime_sprite_frame_count = temp[0]
                @anime_sprite_animation_pattern = temp[1]
                @anime_sprite_next = temp[2]
              else
                self.send @anime_sprite_next
              end
            end
            @anime_sprite_count = 0 
          end
        end
        self.image = @anime_sprite_animation_image[@anime_sprite_animation_pattern[@anime_sprite_count / @anime_sprite_frame_count]]
      else
        unless @anime_sprite_pause
          @anime_sprite_count += 1
          if @anime_sprite_count >= @anime_sprite_frame_count * @anime_sprite_animation_image.size
            if @anime_sprite_next
              temp = @anime_sprite_hash[@anime_sprite_next]
              if temp
                @anime_sprite_frame_count = temp[0]
                @anime_sprite_animation_pattern = temp[1]
                @anime_sprite_next = temp[2]
              else
                self.send @anime_sprite_next
              end
            end
            @anime_sprite_count = 0
          end
        end
        self.image = @anime_sprite_animation_image[@anime_sprite_count / @anime_sprite_frame_count]
      end
      super
    end
  
    def animation_image
      @anime_sprite_animation_image
    end
  
    def animation_image=(v)
      @anime_sprite_animation_image = v
      self.image = v[0]
    end
end
  
  
image = Image.load_tiles("image/4001.png", 4, 4)
character2_image = Image.load('image/a1.png')
current_image = image[0]
custom_font1 = Font.new(200, "chiller")
s = AnimeSprite.new
s.x = 320
s.y = 240

s.animation_image = image
s.add_animation(:anime1, 10,[0,1,2,3], :anime1)
s.add_animation(:anime3, 10,[4,5,6,7], :anime3)
s.add_animation(:anime4, 10,[8,9,10,11], :anime4)
s.add_animation(:anime5, 10,[12,13,14,15], :anime5)
s.add_animation(:anime2, 4,[0,1,0,1,0,1,0,1,0,1], :anime1)
speed = 5
Window.bgcolor = [255, 255, 255]


# キャラクター2の初期位置とサイズ
character2_x = 400
character2_y = 400
character2_width = 125
character2_height = 125

# テキスト表示に関する変数
show_text = false

# ゲームオーバー後のキー入力を受け付けるフラグ
accept_input = true


character2_size = 1
# 四角の移動速度
move_speed = 0
Window.width=800
Window.height=800
Window.loop do
  s.x = [s.x, 0].max  # X座標が0未満にならないように制限
  s.x = [s.x, Window.width-100 ].min  # X座標が画面幅を超えないように制限
  s.y = [s.y, 0].max  # Y座標が0未満にならないように制限
  s.y = [s.y, Window.height-100 ].min  # Y座標が画面高さを超えないように制限

  if Input.key_push?(K_Z)
    s.pause_animation
  end
  if Input.key_push?(K_X)
    s.resume_animation
  end
  if Input.key_push?(K_C)
    s.start_animation(:anime2)
  end
  s.update
  s.draw
  if Input.key_down?(K_W)
    if Input.key_push?(K_W) 
      s.start_animation(:anime3)  # Wキーが押されたらフラグを立てる
    
    elsif Input.key_release?(K_W)
      current_image = image[0]
    end
    if Input.key_down?(K_LSHIFT)
      s.y -= speed*2
    else
      s.y -= speed
    end
    
    
  elsif Input.key_down?(K_S)
    if Input.key_push?(K_S)
      s.start_animation(:anime1)  # Sキーが押されたらフラグを立てる
      
    elsif Input.key_release?(K_S)
      current_image = image[4]
    end
    if Input.key_down?(K_LSHIFT)
      s.y += speed*2
    else
      s.y += speed
    end

  elsif Input.key_down?(K_A)
    if Input.key_push?(K_A)
      s.start_animation(:anime4)  # Aキーが押されたらフラグを立てる
      
    elsif Input.key_release?(K_A)
      current_image = image[8]
    end
    if Input.key_down?(K_LSHIFT)
      s.x -= speed*2
    else
      s.x -= speed
    end
    
  elsif Input.key_down?(K_D)
    if Input.key_push?(K_D)
      s.start_animation(:anime5)  # Dキーが押されたらフラグを立てる
      
    elsif Input.key_release?(K_D)
      current_image = image[12]
    end
    if Input.key_down?(K_LSHIFT)
      s.x += speed*2
    else
      s.x += speed
    end
  end
  if 
    s.x < character2_x + character2_width +50 &&
    s.x  > character2_x - character2_width &&
    s.y < character2_y + character2_height +50&&
    s.y  > character2_y - character2_height
    show_text = true
  else
    show_text = false
  end
  # キャラクター2をa.pngとして描画
  Window.draw(character2_x, character2_y, character2_image)
  s.x += Input.x * 3
  s.y += Input.y * 3
  @move_speed_counter ||= 0
  @move_speed_counter += 1
  if @move_speed_counter >= 30  # 60フレームごとに速度を変更
    @move_speed_counter = 0
    move_speed = rand(1..10)     # 速度をランダムに設定（1から4の間でランダム
  end
  # 敵（青鬼）の追跡動作
  dx = s.x - character2_x
  dy = s.y - character2_y
  distance = Math.sqrt(dx * dx + dy * dy)

  if distance > 0
    vx = dx / distance * move_speed
    vy = dy / distance * move_speed
    character2_x += vx
    character2_y += vy
  end
  # テキストを表示
  if show_text 
    Window.draw_font(10, 50,  "GAMEOVER", custom_font1, color: [255, 0, 0])
    accept_input = false
  end
  


  break if Input.key_push?(K_ESCAPE)
  
end
