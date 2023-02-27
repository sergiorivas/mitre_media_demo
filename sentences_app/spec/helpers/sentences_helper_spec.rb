require 'rails_helper'

RSpec.describe SentencesHelper do
  describe "#decorate_sentence_part" do
    let(:entity_type_name) { "SUBJECT" }
    let(:sentence) { SentenceService.create_sentence(text:) }
    let(:text) { "This is my test" }
    let(:sentence_part) { sentence.sentence_parts.find_by(text: "test") }

    it "manages a part without entity" do
      expect(helper.decorate_sentence_part(sentence_part)).to eq(sentence_part.text)
    end

    it "manages an entity part" do
      SentenceService.define_entity(sentence_part_id: sentence_part.id, entity_type_name:)
      sentence_part.reload
      expect(helper.decorate_sentence_part(sentence_part).include?("span")).to be(true)
    end
  end
end
