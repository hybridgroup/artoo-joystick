require 'artoo'

connection :joystick, :adaptor => :joystick
device :controller, :driver => :xbox360, :connection => :joystick, :interval => 0.1

work do
  on controller, :joystick_0 => proc { |*value|
    puts "joystick 0 - x:#{value[1][:x]} y:#{value[1][:y]}"
  }
  on controller, :joystick_1 => proc { |*value|
    puts "joystick 1 - x:#{value[1][:x]} y:#{value[1][:y]}"
  }
  on controller, :button_a => proc { |*value|
    puts "ayyyy!"
  }
  on controller, :button_b => proc { |*value|
    puts "bee!"
  }
  on controller, :button_x => proc { |*value|
    puts "exxx!"
  }
  on controller, :button_y => proc { |*value|
    puts "why!"
  }
end
