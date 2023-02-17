require 'rails_helper'

RSpec.describe "sentences/edit", type: :view do
  let(:sentence) {
    Sentence.create!(
      text: "MyString"
    )
  }

  before(:each) do
    assign(:sentence, sentence)
  end

  it "renders the edit sentence form" do
    render

    assert_select "form[action=?][method=?]", sentence_path(sentence), "post" do

      assert_select "input[name=?]", "sentence[text]"
    end
  end
end
