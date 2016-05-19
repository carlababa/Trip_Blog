require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  let(:user) { User.create(email: "user@social.com", password: "12345678") }
  let(:tag) { Tag.create(name: "Nice") }
  let(:post) do
    Post.create!(
      title: "Hey You",
      message: "Hello, I'm writing tests!",
      user: user,
      tags: [tag]
    )
  end

  before(:each) do
    assign(:post, post)
    render
  end

  it "renders the title of the post" do
    assert_select "h1", text: "Hey You", count: 1
  end

  it "renders the message of the post" do
    assert_select "p", text: "Hello, I'm writing tests!", count: 1
  end

  it "renders the tags" do
    assert_select ".tags>a", count: 1 do |tags|
      expect(tags.first.text).to eq("Nice")
      expect(tags.first[:href]).to eq("/tags/#{tag.id}")
    end
  end
end
