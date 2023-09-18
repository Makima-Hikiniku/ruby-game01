require 'dxruby'



if $spoon == '1A'
  #
end

if $spoon == '1C'
  #
end

if $spoon == '2A'
    #
end



image_tile = Image.new( 480, 176,  [50, 50, 50])
img_nwall1 = Image.new( 200, 80,  [30, 30, 30])
img_nwall2 = Image.new( 416, 80,  [30, 30, 30])
img_swall = Image.new( 512, 80, [0, 0, 0])
img_warp1 = Image.new( 16, 176, [60, 60, 60])
img_warp2 = Image.new( 80, 16, [60, 60, 60])
img_stair = Image.load('stair.png')


nwall1 = Sprite.new(0,  64, img_nwall1)
nwall2 = Sprite.new(280,  64, img_nwall2)
swall = Sprite.new(0, 320, img_swall)
rwarp = Sprite.new(496, 144, img_warp1)
lwarp = Sprite.new(0, 144, img_warp1)
stair = Sprite.new(208, 64, img_stair)
entrance = Sprite.new(208, 304, img_warp2)


walls = [nwall1, nwall2, swall]
warps = [stair, rwarp, lwarp, entrance]


Window.loop do

  Window.draw(16, 144, image_tile)

  Sprite.draw(walls)
  Sprite.draw(warps)












    
    # if  === rwarp
    #   $scene = 'map2B'
    #   $spoon = '1B'
    #   break
    # elsif  === stair
    #   $scene = 'map2A'
    #   $spoon = '1B'
    #   break
    # elsif === lwarp
    #   $scene = 'map1A'
    #   $spoon = '1B'
    #   break
    # elsif === entrance
    # #テキスト表示とか
    # end

break if Input.keyPush?(K_ESCAPE)

end