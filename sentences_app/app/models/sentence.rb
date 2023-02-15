class Sentence < ApplicationRecord
  has_many :sentence_parts, -> { order(:order) }, dependent: :destroy
end
