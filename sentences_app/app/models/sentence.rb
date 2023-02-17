class Sentence < ApplicationRecord
  has_many :sentence_parts, -> { order(:order) }, dependent: :destroy

  def parts_created?
    sentence_parts.size > 0
  end

  def create_parts
    text.split(" ").each_with_index do |part, index|
      SentencePart.create(
        text: part,
        sentence: self,
        order: index
      )
    end
  end
end
