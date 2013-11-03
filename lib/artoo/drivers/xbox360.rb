require 'artoo/drivers/joystick'

module Artoo
  module Drivers
    # The Xbox360 controller driver behaviors
    class Xbox360 < Artoo::Drivers::Joystick
      TATTIEBOGLE_BUTTON_MAP = {
        0 => "dpad_up",
        1 => "dpad_down",
        2 => "dpad_left",
        3 => "dpad_right",
        4 => "start",
        5 => "back",
        6 => "j0",
        7 => "j1",
        8 => "lb",
        9 => "rb",
        10 => "xbox",
        11 => "a",
        12 => "b",
        13 => "x",
        14 => "y"
      }

      DEFAULT_BUTTON_MAP = {
        0 => 'a',
        1 => 'b',
        2 => 'x',
        3 => 'y',
        4 => 'lb',
        5 => 'rb',
        6 => 'back',
        7 => 'start'
      }

      def handle_joystick
        x0 = connection.axis(0)
        y0 = connection.axis(1)
        publish_joystick(0, x0, y0)

        x1 = connection.axis(3)
        y1 = connection.axis(4)
        publish_joystick(1, x1, y1)        
      end

      def publish_button(b)
        publish(event_topic_name("button_#{button_letter(b)}"))
        super
      end

      def button_letter(b)
        button_map[b]
      end

      def button_map
        if additional_params[:usb_driver] == :tattiebogle
          TATTIEBOGLE_BUTTON_MAP
        else
          DEFAULT_BUTTON_MAP
        end
      end
    end
  end
end
