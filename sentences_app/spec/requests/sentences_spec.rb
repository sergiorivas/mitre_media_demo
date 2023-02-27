require 'rails_helper'

RSpec.describe "/sentences" do
  describe "GET /index" do
    it "renders a successful response" do
      get sentences_url
      expect(response).to be_successful
    end
  end

  describe "DELETE /destroy" do
    let!(:sentence) { SentenceService.create_sentence(text: "This is my test") }

    it "destroys the requested sentence" do
      expect do
        delete sentence_url(sentence)
      end.to change(Sentence, :count).by(-1)
    end

    it "redirects to the sentences list" do
      delete sentence_url(sentence)
      expect(response).to redirect_to(sentences_url)
    end
  end
end
