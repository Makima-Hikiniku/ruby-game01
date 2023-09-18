require 'dxruby'

Window.width = 512
Window.height = 400




$scene = 'map2A'
$spoon = '2B'


loop do
    case $scene
        when 'map2A'
            load 'map2A.rb'
        when 'map2B'
            load 'map2B.rb'
        when 'map2C'
            load 'map2C.rb'
        when 'map2R'
            load 'map2R.rb'
    end

   

    
end