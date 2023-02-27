class EntityType < ApplicationRecord
  def self.generate_color
    loop do
      r  =  rand(255)
      g  =  rand(255)
      b  =  rand(255)
      hsp = Math.sqrt(
        (0.299 * (r * r)) +
        (0.587 * (g * g)) +
        (0.114 * (b * b))
      )
      next unless hsp > 160

      r = r.to_s(16)
      g = g.to_s(16)
      b = b.to_s(16)

      r = r.size == 1 ? "0#{r}" : r
      g = g.size == 1 ? "0#{g}" : g
      b = b.size == 1 ? "0#{b}" : b

      return "#{r}#{g}#{b}".upcase
    end
  end

  def self.sanitize(text:)
    text.strip.upcase
  end
end
