require 'spec_helper'

describe SessionsController do

  describe '#create' do
    
    before do
      @user = User.create!(email: "user1@user.com", password: "password", password_confirmation: "password")
    end

    it "sets the user_id in the session on successful login" do
      post :create, { email: @user.email, password: "password" }
      expect(session[:user_id]). to eq @user.id
    end

    it "redirects after login" do
      post :create, { email: @user.email, password: "password" }
      expect(response.status).to redirect_to user_path(@user)
    end

    it "redirects to root if login invalid" do
      post :create, { email: @user.email, password: "assword" }
      expect(response.status).to redirect_to root_url
    end

  end

  describe '#destroy' do

    before do
      @user = User.create!(email: "user1@user.com", password: "password", password_confirmation: "password")
    end

    it "clears the session at logout" do
      delete :destroy
      expect(session[:user_id]).to eq nil
    end

  end

end
