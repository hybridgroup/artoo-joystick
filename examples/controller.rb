require 'artoo'

connection :joystick, :adaptor => :joystick
device :controller, :driver => :joystick, :connection => :joystick, :interval => 0.1

work do
  on controller, :joystick => proc { |*value|
    puts "joystick #{value[1][:s]} x:#{value[1][:x]} y:#{value[1][:y]}"
  }
  on controller, :button => proc { |*value|
    puts "button #{value[1]}"
  }
end
