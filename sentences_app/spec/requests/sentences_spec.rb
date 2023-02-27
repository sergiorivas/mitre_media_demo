require 'rails_helper'

RSpec.describe "/sentences" do
  describe "GET /index" do
    it "renders a successful response" do
      get sentences_url
      expect(response).to be_successful
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested sentence" # do
    #   sentence = Sentence.create! valid_attributes
    #   expect {
    #     delete sentence_url(sentence)
    #   }.to change(Sentence, :count).by(-1)
    # end

    it "redirects to the sentences list" # do
    #   sentence = Sentence.create! valid_attributes
    #   delete sentence_url(sentence)
    #   expect(response).to redirect_to(sentences_url)
    # end
  end
end
