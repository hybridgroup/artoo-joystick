require 'artoo/drivers/driver'

module Artoo
  module Drivers
    # The sdl-joystick driver behaviors
    class Joystick < Driver
      COMMANDS = [:currently_pressed?].freeze

      attr_reader :button_values

      # Start driver and any required connections
      def start_driver
        @button_values = {}

        begin
          every(interval) do
            handle_message_events
          end

          super
        rescue Exception => e
          Logger.error "Error starting SdlJoystick driver!"
          Logger.error e.message
          Logger.error e.backtrace.inspect
        end
      end

      def currently_pressed?(b)
        button_values[b]
      end

      def handle_message_events
        connection.poll
        handle_joystick
        # TODO: handle_trackball
        # TODO: handle_hats
        handle_buttons
      end

      def handle_joystick
        number_sticks = connection.num_axes / 2
        number_sticks.times {|s|
          x = connection.axis(s * 2)
          y = connection.axis(s * 2 + 1)

          publish_joystick(s, x, y)
        }
      end

      def handle_trackball
        if connection.num_balls == 1
          x, y = connection.ball(0)

          publish(event_topic_name("update"), "trackball", {:x => x, :y => y})
          publish(event_topic_name("trackball"), {:x => x, :y => y})
        end
      end

      def handle_buttons
        connection.num_buttons.times {|b|
          currently_pressed = connection.button(b)
          if button_values[b] != currently_pressed
            button_values[b] = currently_pressed
            publish_button(b)
          end
        }
      end

      def publish_joystick(s, x, y)
        publish(event_topic_name("update"), "joystick", {:x => x, :y => y, :s => s})
        publish(event_topic_name("joystick"), {:x => x, :y => y, :s => s})
        publish(event_topic_name("joystick_#{s}"), {:x => x, :y => y})
      end

      def publish_button(b)
        if button_values[b] == 1
          publish(event_topic_name("update"), "button", b)
          publish(event_topic_name("button"), b)
          publish(event_topic_name("button_#{b}"))
        end
      end
    end
  end
end
