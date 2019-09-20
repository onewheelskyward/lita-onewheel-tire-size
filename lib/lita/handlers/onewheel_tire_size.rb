module Lita
  module Handlers
    class OnewheelTireSize < Handler
      route(/^tire\s+(.*)/i, :handle_tire_size, command: true)
      route(/^tiresize\s+(.*)/i, :handle_tire_size, command: true)

      def handle_tire_size(response)
        size = response.matches[0][0]

        size.match(/(\d+[\/ ]\d+\s*R*\d+)\s+litaa(\d+[\/ ]\d+\s*R*\d+)/) do |m|
          puts m.captures.inspect
          dia1 = get_diameter(m.captures[0])
          dia2 = get_diameter(m.captures[1])
          response.reply "#{m.captures[0]} is #{dia1}\", #{m.captures[1]} is #{dia2}\", a difference of #{(dia1 - dia2).abs}"
          return
        end

        response.reply "diameter for #{size} is #{get_diameter(size)} inches"
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
