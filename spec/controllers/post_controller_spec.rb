require 'rails_helper'

RSpec.describe PostsController, type: :controller do
include ApiHelper 

  before(:each) do 
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)    
    @post = FactoryBot.create(:post)
    @category = FactoryBot.create(:category)
    @token1 = JsonWebToken.jwt_encode(@user.id)
    authenticated_header(request, @user) 

  end 

  let(:create_post) do
    {
      "post": {
        "title": "String",
        "description": "text",
        "category_id": @category.id,
        "user_id": @user.id
      }
    }
  end

  let(:update_post) do
    {
      "post": {
        "title": "String",
        "description": "text",
        "category_id": @category.id,
        "user_id": @user.id
      }
    }
  end

  describe '#index' do 
      it 'should list the recording ' do
        get :index, params: {token: @token1}
      account = JSON.parse(response.body)
      expect(response).to have_http_status :ok
      end
  end 

  # describe "#create post" do
  #   it 'create with post' do
  #     post 'create',params: create_post
  #     expect(response.status).to eq 200
  #   end 
  # end

  
  # describe "destroy" do
  #   it 'destroy with post' do
  #     delete :destroy ,params:{id: @post.id}
  #     expect(response.status).to eq 200
  #   end 
  # end

  # describe "update" do
  #   it 'update with post id' do
  #       put :update,params:{id: @post.id, post: update_post}
  #       expect(response.status).to eq 200
  #   end 
  # end


  # describe "like post" do
  #   it 'like_post' do
  #     get :like_post ,params: {id: @post.id, user_id: @user.id}
  #     expect(response.status).to eq 200
  #   end 
  # end


  # describe "search" do
  #   it 'search' do
  #     get :search ,params: {id: @post.id, user_id: @user.id}
  #     expect(response.status).to eq 200
  #   end 
  # end
end



