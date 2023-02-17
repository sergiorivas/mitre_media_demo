require 'rails_helper'

RSpec.describe "sentences/index", type: :view do
  before(:each) do
    assign(:sentences, [
      Sentence.create!(
        text: "Text"
      ),
      Sentence.create!(
        text: "Text"
      )
    ])
  end

  it "renders a list of sentences" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Text".to_s), count: 2
  end
end
