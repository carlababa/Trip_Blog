require 'rails_helper'

RSpec.describe "tags/show", type: :view do
  let(:user) { User.create(email: "user@social.com", password: "12345678") }
  let(:tag) { Tag.create(name: "Nice Tag") }
  let!(:post) do
    Post.create!(
      title: "Hey You",
      message: "Hello, I'm writing tests!",
      user: user,
      tags: [tag]
    )
  end

  before(:each) do
    assign(:tag, tag)
    render
  end

  it "renders the tag name" do
    assert_select "h1", text: "Nice Tag", count:1
  end

  it "renders the posts" do
    assert_select ".posts>a", count:1 do |e|
      expect(e[0].text).to eq("Hey You")
      expect(e[0][:href]).to eq("/posts/#{post.id}")
    end
  end

end
