require 'dxruby'

Window.width = 512
Window.height = 400




if $spoon == '1B'
 #プレイヤー初期値
end

if $spoon == '1R'
    #
end


#地形画像
image_tile = Image.new( 512, 176,  [50, 50, 50])
img_nwall1 = Image.new( 32, 80,  [30, 30, 30])
img_nwall2 = Image.new( 416, 80,  [30, 30, 30])
img_fwall = Image.new( 512, 80, [0, 0, 0])
img_warp = Image.new( 64, 16, [60, 60, 60])
img_door = Image.load('door.png')

#地形スプライト
nwall1 = Sprite.new(0,  64, img_nwall1)
nwall2 = Sprite.new(96,  64, img_nwall2)
swall = Sprite.new(0, 320, img_fwall)
rwarp = Sprite.new(496, 144, img_warp)
door = Sprite.new(32, 64, img_door)

walls = [nwall1, nwall2, swall]
warps = [door, rwarp]




Window.loop do
 
    Window.draw(0, 144, image_tile) #描画
    Sprite.draw(walls)
    Sprite.draw(warps)
  
    
      
 
 
 
 
 
 





     # if #ここにプレイヤーのスプライト（←文字だけ消して）　 === door
     #   $scene = 'map1R'
     #   $spoon = '1A'
     #   break
     # elsif  === rwalp
     #   $scene = 'map1B'
     #   $spoon = 'map1A'
     #   break
     # end
  
  
  
  
    break if Input.keyPush?(K_ESCAPE)
  
  end