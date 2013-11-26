require 'artoo/drivers/joystick'

module Artoo
  module Drivers
    # The Ps3 controller driver behaviors
    class Ps3 < Artoo::Drivers::Joystick
      OSX_MAP = {
        :button_map => {
          0 => :select,
          1 => :j0,
          2 => :j1,
          3 => :start,
          4 => :dpad_up,
          5 => :dpad_right,
          6 => :dpad_down,
          7 => :dpad_left,
          8 => :l2,
          9 => :r2,
          10 => :l1,
          11 => :r1,
          12 => :triangle,
          13 => :circle,
          14 => :x,
          15 => :square,
          16 => :ps3
        },
        :axis_map => {
          :j0_x => 0,
          :j0_y => 1,
          :j1_x => 2,
          :j1_y => 3
        }
      }

      DEFAULT_MAP = {
        :button_map => {
          0 => :square,
          1 => :x,
          2 => :circle,
          3 => :triangle,
          4 => :l1,
          5 => :r1,
          6 => :l2,
          7 => :r2,
          8 => :select,
          9 => :start,
          10 => :left_joystick,
          11 => :right_joystick,
          12 => :home
        },
        :axis_map => {
          :j0_x => 0,
          :j0_y => 1,
          :j1_x => 2,
          :j1_y => 3
        }
      }

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
        get_map[:button_map]
      end

      def axis_map
        get_map[:axis_map]
      end

      def get_map
        if additional_params[:usb_driver] == :osx
          OSX_MAP
        else
          DEFAULT_MAP
        end
      end
    end
  end
end
