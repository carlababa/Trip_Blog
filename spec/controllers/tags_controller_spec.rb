require 'rails_helper'

RSpec.describe TagsController, type: :controller do

  let!(:tag) { Tag.create!(name: "Nice") }

  describe "GET #index" do
    it "assigns all tags as @tags" do
      get :index
      expect(assigns(:tags)).to eq([tag])
    end
  end

  describe "GET #show" do
    it "assigns @tag and render the show template" do
      get :show, id: tag.id
      expect(assigns(:tag)).to eq(tag)
    end
  end

end
