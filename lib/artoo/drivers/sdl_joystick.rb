require 'artoo/drivers/driver'

module Artoo
  module Drivers
    # The sdl-joystick driver behaviors
    class SdlJoystick < Driver

      # Start driver and any required connections
      def start_driver
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

      def handle_message_events
        connection.poll

        x = connection.axis(0)
        y = connection.axis(1)
        
        publish(event_topic_name("update"), "joystick", {:x => x, :y => y})
        publish(event_topic_name("joystick"), {:x => x, :y => y})
      end

    end
  end
end
