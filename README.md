# Artoo Adaptor For Joysticks & Game Controllers

This repository contains the Artoo (http://artoo.io/) adaptor for the PS3 controller, Xbox 360 controller, or any other joysticks and game controllers that are compatible with Simple DirectMedia Layer (SDL) (http://www.libsdl.org/). 

Artoo is a open source micro-framework for robotics using Ruby.

For more information about Artoo, check out our repo at https://github.com/hybridgroup/artoo

The artoo-joystick adaptor uses the ruby-sdl-ffi gem (https://github.com/hybridgroup/ruby-sdl-ffi).

[![Code Climate](https://codeclimate.com/github/hybridgroup/artoo-joystick.png)](https://codeclimate.com/github/hybridgroup/artoo-joystick) [![Build Status](https://travis-ci.org/hybridgroup/artoo-joystick.png?branch=master)](https://travis-ci.org/hybridgroup/artoo-joystick)

## Installing

### OSX

```
brew install sdl
gem install artoo-joystick
```

Mac OS X does not provide native support for XBox 360 controllers. A third-party driver is available from http://tattiebogle.net/index.php/ProjectRoot/Xbox360Controller/OsxDriver


### Ubuntu

```
sudo apt-get install libsdl1.2-dev
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

## Documentation

Check out our [documentation](http://artoo.io/documentation/) for lots of information about how to use Artoo.

## IRC

Need more help? Just want to say "Hello"? Come visit us on IRC freenode #artoo

## Contributing

* All patches must be provided under the Apache 2.0 License
* Please use the -s option in git to "sign off" that the commit is your work and you are providing it under the Apache 2.0 License
* Submit a Github Pull Request to the appropriate branch and ideally discuss the changes with us in IRC.
* We will look at the patch, test it out, and give you feedback.
* Avoid doing minor whitespace changes, renamings, etc. along with merged content. These will be done by the maintainers from time to time but they can complicate merges and should be done seperately.
* Take care to maintain the existing coding style.
* Add unit tests for any new or changed functionality.
* All pull requests should be "fast forward"
  * If there are commits after yours use “git rebase -i <new_head_branch>”
  * If you have local changes you may need to use “git stash”
  * For git help see [progit](http://git-scm.com/book) which is an awesome (and free) book on git


(c) 2012-2014 The Hybrid Group
