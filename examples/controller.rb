require 'artoo'

connection :joystick, :adaptor => :sdl_joystick
device :joystick, :driver => :sdl_joystick, :connection => :joystick, :interval => 0.1

work do
  on joystick, :joystick => proc { |*value|
    puts "joystick x:#{value[1][:x]} y:#{value[1][:y]}"
  }
  on joystick, :button => proc { |*value|
    puts "button #{value[1]}"
  }
end
