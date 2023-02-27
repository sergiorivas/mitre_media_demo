require "rails_helper"

RSpec.describe SentenceService, type: :service do
  context "creating a sentence" do
    it "saves the sentence"
    it "creates the sentence parts"
  end

  describe "setting an entity" do
    context "when is a new entity" do
      it "creates the entity"
      it "associates the entity"
      it "creates a color"
    end

    context "when is an existent entity" do
      it "associates the entity"
    end
  end

  context "resetting the entity" do
    it "removes the association"
  end

end
