# Artoo Adaptor For Joysticks & Game Controllers

This repository contains the Artoo (http://artoo.io/) adaptor for the PS3 controller, Xbox 360 controller, or any other joysticks and game controllers that are compatible with Simple DirectMedia Layer (SDL) (http://www.libsdl.org/). 

Artoo is a open source micro-framework for robotics using Ruby.

For more information about Artoo, check out our repo at https://github.com/hybridgroup/artoo

The artoo-joystick adaptor uses the ruby-sdl-ffi gem (https://github.com/hybridgroup/ruby-sdl-ffi).

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

Plug your USB joystick or game controller into your USB port. If your device is supported by SDL, you are now ready.

### Additional XBox 360 Controller Information

Trigger button events are published to :trigger_lt and :trigger_rt for the XBox 360 controller.

```ruby
require 'artoo'

connection :joystick, :adaptor => :joystick
device :controller, :driver => :xbox360, :connection => :joystick, :interval => 0.1

work do
  on controller, :trigger_lt => proc { |*value|
    puts "trigger lt: #{value[1]}"
  }
  on controller, :trigger_rt => proc { |*value|
    puts "trigger rt: #{value[1]}"
  }
end
```

### XBox 360 Controller Mac OS X driver

Mac OS X does not provide native support for XBox 360 controllers. A third-party driver is available from http://tattiebogle.net/index.php/ProjectRoot/Xbox360Controller/OsxDriver

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
