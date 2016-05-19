require 'rails_helper'

RSpec.describe "tags/index", type: :view do
  let(:tags) do
    [
      Tag.create!(
        name: "Nice Tag"
      ),
      Tag.create!(
        name: "Other Tag"
      )
    ]
  end

  before(:each) do
    assign(:tags, tags)
    render
  end

  it "renders the tag name" do
    assert_select "h1", text: "Tags", count: 1
  end

  it "renders the tags" do
    assert_select ".tagname", count: 2 do |e|
      expect(e[0][:href]).to eq("/tags/#{tags[0].id}")
      expect(e[0].text).to eq("#{tags[0].name} • #{tags[0].posts.count}")

      expect(e[1][:href]).to eq("/tags/#{tags[1].id}")
      expect(e[1].text).to eq("#{tags[1].name} • #{tags[1].posts.count}")
    end
  end

end
