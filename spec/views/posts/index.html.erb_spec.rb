require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  let(:user) { User.create(email: "user@social.com", password: "12345678") }
  let(:other_user) { User.create(email: "other-user@social.com", password: "12345678") }

  before(:each) do
    assign(:posts, [
      Post.create!(
        title: "Hey You",
        message: "Hello, I'm writing tests!",
        user: user
      ),
      Post.create!(
        title: "Hey You too",
        message: "Hi, Here's another post!",
        user: other_user
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
    assert_select ".post>h1", text: "Hey You too", count: 1
    assert_select ".post>p", text: "Hi, Here's another post!", count: 1
  end

  it "shows the user's email with the post" do
    assert_select ".post>.meta", text: user.email, count: 1
    assert_select ".post>.meta", text: other_user.email, count: 1
  end

  it "renders new post form" do
    assert_select "form[action=?][method=?]", posts_path, "post" do
      assert_select "textarea#post_title[name=?]", "post[title]"
      assert_select "textarea#post_message[name=?]", "post[message]"
      assert_select "input#[type=?][value=?]", "submit", "Create Post"
    end
  end
end
