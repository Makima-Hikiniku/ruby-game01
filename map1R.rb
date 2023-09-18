require 'dxruby'


if $spoon == '1A'
 #プレイヤー初期値
end


#地形画像
image_tile = Image.new( 512, 176,  [50, 50, 50])
img_hwall = Image.new( 512, 80,  [30, 30, 30])
img_fwall = Image.new( 512, 80, [0, 0, 0])
img_warp = Image.new( 64, 16, [60, 60, 60])
img_box = Image.load('box.png')

#地形スプライト
nwall = Sprite.new(0,  64, img_hwall)
swall = Sprite.new(0, 320, img_fwall)
door = Sprite.new(400, 304, img_warp)
box = Sprite.new(16, 160, img_box)

walls = [nwall, swall]
object = [box]
warps = [door]




Window.loop do
 
    Window.draw(0, 144, image_tile) #描画
    Sprite.draw(walls)
    Sprite.draw(box)
    Sprite.draw(warps)
  
    
      
 
 
 
 
 
 





     # if #ここにプレイヤーのスプライト（←文字だけ消して）　 === door
     #   $scene = 'map2C'
     #   $spoon = '2R'
     #   break
     # elsif  === box
     # #テキストなど表示
     # $flag = 1 #出れるようになる判定
     # end
  
  
  
  
    break if Input.keyPush?(K_ESCAPE)
  
  end