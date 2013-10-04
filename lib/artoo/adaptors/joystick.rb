require 'artoo/adaptors/adaptor'

module Artoo
  module Adaptors
    # Connect to a joystick device
    # @see device documentation for more information
    class Joystick < Adaptor
      finalizer :finalize
      attr_reader :joystick

      # Closes connection with device if connected
      # @return [Boolean]
      def finalize
        disconnect if connected?
      end

      # Creates a connection with device
      # @return [Boolean]
      def connect
        require 'ruby-sdl-ffi' unless defined?(::SDL)

        ::SDL.Init( ::SDL::INIT_JOYSTICK )

        raise "No SDL joystick available" if num_joysticks == 0
        
        @joystick = ::SDL.JoystickOpen(0) # TODO: allow user to choose which joystick

        super
      end

      # Closes connection with device
      # @return [Boolean]
      def disconnect
        ::SDL.JoystickClose(joystick)
        super
      end

      # Name of device
      # @return [String]
      def firmware_name
        ::SDL.JoystickName(0)
      end

      # Version of device
      # @return [String]
      def version
        Artoo::Joystick::VERSION
      end

      def poll
        ::SDL.JoystickUpdate
      end

      def num_joysticks
        ::SDL.NumJoysticks
      end

      def num_axes
        ::SDL.JoystickNumAxes(joystick)
      end

      def axis(n)
        ::SDL.JoystickGetAxis(joystick, n)
      end

      def num_balls
        ::SDL.JoystickNumBalls(joystick)
      end

      def ball(n)
        ::SDL.JoystickGetBall(joystick, n)
      end

      def num_hats
        ::SDL.JoystickNumHats(joystick)
      end

      def hat(n)
        ::SDL.JoystickGetHat(joystick, n)
      end

      def num_buttons
        ::SDL.JoystickNumButtons(joystick)
      end

      def button(n)
        ::SDL.JoystickGetButton(joystick, n)
      end
    end
  end
end
