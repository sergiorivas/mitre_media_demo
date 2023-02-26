class SentencePart < ApplicationRecord
  belongs_to :sentence
  belongs_to :entity_type, optional: true

  def entity?
    !!entity_type
  end

  def entity_type_name
    return nil unless entity?

    entity_type.name
  end
end
