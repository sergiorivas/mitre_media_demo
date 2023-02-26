class SentencePart < ApplicationRecord
  belongs_to :sentence
  belongs_to :entity_type, optional: true

  def entity?
    !!entity_type
  end
end
