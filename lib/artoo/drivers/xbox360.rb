require 'artoo/drivers/joystick'

module Artoo
  module Drivers
    # The Xbox360 controller driver behaviors
    class Xbox360 < Artoo::Drivers::Joystick
      TATTIEBOGLE_MAP = {
        :button_map => {
          0 => :dpad_up,
          1 => :dpad_down,
          2 => :dpad_left,
          3 => :dpad_right,
          4 => :start,
          5 => :back,
          6 => :j0,
          7 => :j1,
          8 => :lb,
          9 => :rb,
          10 => :xbox,
          11 => :a,
          12 => :b,
          13 => :x,
          14 => :y
        },
        :axis_map => {
          :j0_x => 0,
          :j0_y => 1,
          :j1_x => 2,
          :j1_y => 3,
          :lt => 4,
          :rt => 5
        }
      }

      DEFAULT_MAP = {
        :button_map => {
          0 => :a,
          1 => :b,
          2 => :x,
          3 => :y,
          4 => :lb,
          5 => :rb,
          6 => :back,
          7 => :start
        },
        :axis_map => {
          :j0_x => 0,
          :j0_y => 1,
          :j1_x => 3,
          :j1_y => 4
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

        handle_trigger
      end

      def handle_trigger
        unless axis_map[:lt].nil?
          publish_trigger(:lt, connection.axis(axis_map[:lt]))
        end

        unless axis_map[:rt].nil?
          publish_trigger(:rt, connection.axis(axis_map[:rt]))
        end
      end

      def publish_trigger(t, v)
        publish(event_topic_name("trigger_#{t}"), v)
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
        if additional_params[:usb_driver] == :tattiebogle
          TATTIEBOGLE_MAP
        else
          DEFAULT_MAP
        end
      end
    end
  end
end
