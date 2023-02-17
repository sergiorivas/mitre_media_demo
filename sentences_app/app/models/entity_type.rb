class EntityType < ApplicationRecord

  def self.sanitize(text: )
    text.strip.downcase
  end
end
