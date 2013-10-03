require 'artoo'

connection :joystick, :adaptor => :sdl_joystick
device :controller, :driver => :sdl_joystick, :connection => :joystick, :interval => 0.1

work do
  on controller, :joystick => proc { |*value|
    puts "joystick x:#{value[1][:x]} y:#{value[1][:y]}"
  }
  on controller, :button => proc { |*value|
    puts "button #{value[1]}"
  }
end
