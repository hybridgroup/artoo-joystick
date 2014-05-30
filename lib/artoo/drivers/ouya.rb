require 'artoo/drivers/joystick'

module Artoo
  module Drivers
    # The OUYA controller driver behaviors
    class Ouya < Artoo::Drivers::Joystick

      def currently_pressed?(b)
        if button_map.has_value?(b)
          button_values[button_map.key(b)]
        else
          super b
        end
      end

      def handle_joystick
        x0 = connection.axis(axis_map[:j0_x])
        y0 = connection.axis(axis_map[:j0_y])
        publish_joystick(0, x0, y0)

        x1 = connection.axis(axis_map[:j1_x])
        y1 = connection.axis(axis_map[:j1_y])
        publish_joystick(1, x1, y1)
      end

      def publish_button(b)
        if button_values[b] == 1
          publish(event_topic_name("button_#{button_map[b]}"))
        else
          publish(event_topic_name("button_up_#{button_map[b]}"))
        end
        super
      end

      def button_map
        BINDING_MAP[:ouya][:button_map]
      end

      def axis_map
        BINDING_MAP[:ouya][:axis_map]
      end

    end
  end
end
