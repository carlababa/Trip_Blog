require 'rails_helper'

RSpec.describe "tags/index", type: :view do

  before(:each) do
    assign(:tags, [
      Tag.create!(
        name: "Nice Tag"
      ),
      Tag.create!(
        name: "Other Tag"
      )])

    assign(:tag, Tag.new)

    render
  end

  it "renders the tag name" do
    assert_select "h1", text: "Tags", count: 1
  end

  it "renders the tags" do
    assert_select "#tagname", count:2
  end

end
