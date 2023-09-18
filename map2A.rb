require 'dxruby'

if $spoon == '2B'
  #
end

if $spoon == '1B'
  #
end



image_tile = Image.new( 480, 176,  [50, 50, 50])
img_nwall1 = Image.new( 32, 80,  [30, 30, 30])
img_nwall2 = Image.new( 416, 80,  [30, 30, 30])
img_swall = Image.new( 512, 80, [0, 0, 0])
img_warp = Image.new( 16, 176, [60, 60, 60])
img_stair = Image.load('stair.png')


nwall1 = Sprite.new(0,  64, img_nwall1)
nwall2 = Sprite.new(96,  64, img_nwall2)
swall = Sprite.new(0, 320, img_swall)
rwarp = Sprite.new(496, 144, img_warp)
stair = Sprite.new(32, 64, img_stair)


walls = [nwall1, nwall2, swall]
warps = [stair, rwarp]


Window.loop do

  Window.draw(16, 144, image_tile)

  Sprite.draw(walls)
  Sprite.draw(warps)












    
    # if  === rwarp
    #   $scene = 'map2B'
    #   $spoon = '2A'
    #   break
    # elsif  === stair
    #   $scene = 'map1B'
    #   $spoon = '2A'
    # end

break if Input.keyPush?(K_ESCAPE)

end