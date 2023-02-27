require "rails_helper"

RSpec.describe SentenceService, type: :service do
  let(:text) { "This is my test" }

  context "creating a sentence" do
    before do
      described_class.create_sentence(text:)
    end

    it "saves the sentence" do
      expect(Sentence.find_by(text:)).not_to be_nil
    end

    it "creates the sentence parts" do
      expect(Sentence.find_by(text:).sentence_parts.size).to eq(4)
    end
  end

  describe "setting an entity" do
    let(:entity_type_name) { "SUBJECT" }
    let(:sentence) { described_class.create_sentence(text:) }
    let(:sentence_part) { sentence.sentence_parts.find_by(text: "test") }

    context "when is a new entity" do
      before do
        described_class.define_entity(sentence_part_id: sentence_part.id, entity_type_name:)
        sentence_part.reload
      end

      it "creates the entity" do
        expect(EntityType.find_by(name: entity_type_name)).not_to be_nil
      end

      it "associates the entity" do
        entity_type = EntityType.find_by(name: entity_type_name)
        expect(sentence_part.entity_type).to eq(entity_type)
      end

      it "creates a color" do
        entity_type = EntityType.find_by(name: entity_type_name)
        expect(entity_type.color).not_to be_nil
      end
    end

    context "when is an existent entity" do
      let!(:existent_entity_type) { FactoryBot.create(:entity_type, name: entity_type_name) }

      before do
        described_class.define_entity(sentence_part_id: sentence_part.id, entity_type_name:)
        sentence_part.reload
      end

      it "associates the entity" do
        expect(sentence_part.entity_type).to eq(existent_entity_type)
      end
    end
  end

  context "resetting the entity" do
    let(:entity_type_name) { "SUBJECT" }
    let(:sentence) { described_class.create_sentence(text:) }
    let(:sentence_part) { sentence.sentence_parts.find_by(text: "test") }

    before do
      described_class.define_entity(sentence_part_id: sentence_part.id, entity_type_name:)
      sentence_part.reload
      described_class.reset_part(sentence_part_id: sentence_part.id)
      sentence_part.reload
    end

    it "removes the association" do
      expect(sentence_part.entity_type).to be_nil
    end
  end
end
