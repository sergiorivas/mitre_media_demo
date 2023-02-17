require 'rails_helper'

RSpec.describe "sentences/new", type: :view do
  before(:each) do
    assign(:sentence, Sentence.new(
      text: "MyString"
    ))
  end

  it "renders new sentence form" do
    render

    assert_select "form[action=?][method=?]", sentences_path, "post" do

      assert_select "input[name=?]", "sentence[text]"
    end
  end
end
