require 'dxruby'


if $spoon == '2B'
  #プレイヤー初期値
end

if $spoon == '2R'
  #
end
 
#地形画像
 image_tile = Image.new( 496, 176,  [50, 50, 50])
 img_hwall = Image.new( 512, 80,  [30, 30, 30])
 img_fwall = Image.new( 512, 80, [0, 0, 0])
 img_warp = Image.new( 16, 176, [60, 60, 60])
 img_door = Image.load('door.png')
 img_darkdoor = Image.new(64,75, C_BLACK)
 
 #地形スプライト
 nwall = Sprite.new(0,  64, img_hwall)
 swall = Sprite.new(0, 320, img_fwall)
 lwarp = Sprite.new(0, 144, img_warp)
 door = Sprite.new(400, 64, img_door)
 
 walls = [nwall, swall]
 warps = [lwarp, door]
 
 
 
 Window.loop do
 
   Window.draw(16, 144, image_tile) #描画
   Sprite.draw(walls)
   Sprite.draw(warps)
 
   
     






    # if #ここにプレイヤーのスプライト（←文字だけ消して）　 === lwarp
    #   $scene = 'map2B'
    #   $spoon = '2C'
    #   break
    # elsif === door
    #   door.image = img_darkdoor
    #   $scene = 'map2R'
    #   $spoon = '2C'
    # end
 
 
 
 
   break if Input.keyPush?(K_ESCAPE)
 
 end