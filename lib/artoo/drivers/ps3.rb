require 'artoo/drivers/joystick'

module Artoo
  module Drivers
    # The Ps3 controller driver behaviors
    class Ps3 < Artoo::Drivers::Joystick
      BUTTON_MAP = {
        0 => 'square',
        1 => 'x',
        2 => 'circle',
        3 => 'triangle',
        4 => 'l1',
        5 => 'r1',
        6 => 'l2',
        7 => 'r2',
        8 => 'select',
        9 => 'start',
        10 => 'left_joystick',
        11 => 'right_joystick',
        12 => 'home'
      }

      def handle_joystick
        x0 = connection.axis(0)
        y0 = connection.axis(1)
        publish_joystick(0, x0, y0)

        x1 = connection.axis(2)
        y1 = connection.axis(3)
        publish_joystick(1, x1, y1)        
      end

      def publish_button(b)
        if button_values[b] == 1
          publish(event_topic_name("button_#{button_letter(b)}"))
        else
          publish(event_topic_name("button_up_#{button_letter(b)}"))
        end
        super
      end

      def button_letter(b)
        BUTTON_MAP[b]
      end
    end
  end
end
