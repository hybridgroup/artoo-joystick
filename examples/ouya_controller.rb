require 'artoo'

connection :joystick, :adaptor => :joystick
device :controller, :driver => :ouya, :connection => :joystick, :interval => 0.1

work do
  on controller, :joystick => proc { |*value|
    puts "joystick #{value[1][:s]} x:#{value[1][:x]} y:#{value[1][:y]}"
  }

  on controller, :button_o => proc { |*value|
    puts "Button O Pressed!"
  }
  on controller, :button_u => proc { |*value|
    puts "Button U Pressed!"
  }
  on controller, :button_y => proc { |*value|
    puts "Button Y Pressed!"
  }
  on controller, :button_a => proc { |*value|
    puts "Button A Pressed!"
  }
  
  on controller, :button_dpad_up => proc { |*value|
    puts "Button DPad Up Pressed!"
  }
  on controller, :button_dpad_down => proc { |*value|
    puts "Button DPad Down Pressed!"
  }
  on controller, :button_dpad_left => proc { |*value|
    puts "Button DPad Left Pressed!"
  }
  on controller, :button_dpad_right => proc { |*value|
    puts "Button DPad Right Pressed!"
  }
  
  
  on controller, :button_lt => proc { |*value|
    puts "Button Left Trigger Pressed!"
  }
  on controller, :button_rt => proc { |*value|
    puts "Button Right Trigger Pressed!"
  }
  on controller, :button_r2 => proc { |*value|
    puts "Button Right Bumper Pressed!"
  }
  on controller, :button_l2 => proc { |*value|
    puts "Button Left Bumper Pressed!"
  }
end
