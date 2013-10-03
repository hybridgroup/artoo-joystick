# Artoo Adaptor For Joysticks & Game Controllers

This repository contains the Artoo (http://artoo.io/) adaptor for joysticks and game controllers that are compatible with Simple DirectMedia Layer (SDL). 

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
device :controller, :driver => :joystick, :connection => :joystick, :interval => 0.1

work do
  on controller, :joystick => proc { |*value|
    puts "joystick x:#{value[1][:x]} y:#{value[1][:y]}"
  }
  on controller, :button => proc { |*value|
    puts "button #{value[1]}"
  }
end
```

## Connecting to USB Joysticks and Game Controllers

Your USB joystick or game controller plugs into your USB port. You are now ready, if your device is supported by SDL.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
