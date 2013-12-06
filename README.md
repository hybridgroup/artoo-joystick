# Artoo Adaptor For Joysticks & Game Controllers

This repository contains the Artoo (http://artoo.io/) adaptor for the PS3 controller, Xbox 360 controller, or any other joysticks and game controllers that are compatible with Simple DirectMedia Layer (SDL) (http://www.libsdl.org/). 

Artoo is a open source micro-framework for robotics using Ruby.

For more information about Artoo, check out our repo at https://github.com/hybridgroup/artoo

The artoo-joystick adaptor uses the rubysdl gem (http://www.kmc.gr.jp/~ohai/rubysdl.en.html).

[![Code Climate](https://codeclimate.com/github/hybridgroup/artoo-joystick.png)](https://codeclimate.com/github/hybridgroup/artoo-joystick) [![Build Status](https://travis-ci.org/hybridgroup/artoo-joystick.png?branch=master)](https://travis-ci.org/hybridgroup/artoo-joystick)

## Installing

```
gem install artoo-joystick
```

## Using

```ruby
require 'artoo'

connection :joystick, :adaptor => :joystick
device :controller, :driver => :xbox360, :connection => :joystick, :interval => 0.1

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
```

## Connecting to USB Joysticks and Game Controllers

Plus your USB joystick or game controller into your USB port. If your device is supported by SDL, you are now ready.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
