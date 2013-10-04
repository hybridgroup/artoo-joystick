require 'artoo'

connection :joystick, :adaptor => :joystick
device :controller, :driver => :xbox_360, :connection => :joystick, :interval => 0.1

work do
  on controller, :joystick => proc { |*value|
    puts "joystick #{value[1][:s]} x:#{value[1][:x]} y:#{value[1][:y]}"
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
