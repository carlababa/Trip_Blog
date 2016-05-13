require 'rails_helper'

RSpec.describe "posts/index", type: :view do

  let(:user) { User.create(email: "user@social.com", password: "12345678") }

  before(:each) do
    assign(:posts, [
      Post.create!(
        title: "Hey You",
        message: "Hello, I'm writing tests!",
        user: user
      )])

    assign(:post, Post.new)

    render
  end

  it "renders the title of the post" do
    assert_select "h1", text: "Hey You", count: 1
  end

  it "renders the message of the post" do
    assert_select "p", text: "Hello, I'm writing tests!", count: 1
  end

end
