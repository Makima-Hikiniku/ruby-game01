require 'dxruby'


if $spoon == '1B'
 #プレイヤー初期値
end



#地形画像
image_tile = Image.new( 480, 176,  [50, 50, 50])
img_hwall = Image.new( 512, 80,  [30, 30, 30])
img_fwall = Image.new( 512, 80, [0, 0, 0])
img_warp = Image.new( 16, 176, [60, 60, 60])

#地形スプライト
nwall = Sprite.new(0,  64, img_hwall)
swall = Sprite.new(0, 320, img_fwall)
lwarp = Sprite.new(0, 144, img_warp)
rwarp = Sprite.new(496, 144, img_warp)

walls = [nwall, swall]
warps = [lwarp, rwarp]



Window.loop do

  Window.draw(16, 144, image_tile) #描画
  Sprite.draw(walls)
  Sprite.draw(warps)

  









    
    # if #ここにプレイヤーのスプライト（←文字だけ消して）　 === lwarp
    #   $scene = 'map1B'
    #   $spoon = '1C'
    #   break
    # elsif   === rwarp
    #   $scene = '#終了画面'
    #  break
    # end


  break if Input.keyPush?(K_ESCAPE)

end