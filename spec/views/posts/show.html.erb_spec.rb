require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  let(:user) { User.create(email: "user@social.com", password: "12345678") }

  before(:each) do
    assign(:posts, [
      Post.create!(
        title: "Hey You",
        message: "Hello, I'm writing tests!",
        user: user
      )
    ])

    assign(:post, Post.new)

    render
  end

  it "renders the title of the page" do
    assert_select "h1", text: "Posts", count: 1
  end

  it "renders a list of posts with title" do
    assert_select ".post>h1", text: "Hey You", count: 1
    assert_select ".post>p", text: "Hello, I'm writing tests!", count: 1
  end

  it "shows the user's email with the post" do
    assert_select ".post>.meta", text: user.email, count: 1
  end

end
