module Lita
  module Handlers
    class OnewheelTireSize < Handler
      config :app_id
      config :api_uri

      route(/^tire\s+(.*)/i, :handle_tire_size, command: true)
      route(/^tiresize\s+(.*)/i, :handle_tire_size, command: true)

      def handle_tire_size(response)
        size = response.matches[0][0]
        # parse size
        # '245/40R17'
        puts get_diameter(size)
      end

      def get_diameter(size)
        size.match(/(\d+)[\/ ](\d+)\s*R*(\d+)/) do |m|
          diameter = (m.captures[0].to_f * m.captures[1].to_f / 2540 * 2) + m.captures[2].to_f
          diameter.round(2)
        end
      end

    end
    Lita.register_handler(OnewheelTireSize)
  end
end
