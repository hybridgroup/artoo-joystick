require 'artoo/drivers/joystick'

module Artoo
  module Drivers
    # The Xbox360 controller driver behaviors
    class Xbox360 < Artoo::Drivers::Joystick
      BUTTON_MAP = {
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
        BUTTON_MAP[b]
      end
    end
  end
end
