require 'spec_helper'

describe UserSessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "renders the new template" do
      get 'new'
      expect(response).to render_template('new')
    end 
  end

  describe "POST 'create'" do
    it "ridrects to the todolist path" do
      post :create, :email: "marcus.tisater@gmail.com", password: "hej12345"
      expect(response).to be_redirect
      expect(response).to redirect_to(todo_lists_path)
  end

  it "authentiactes my user"
      user = User.create(first_name: "Marcus", last_name: "Tisater", email: marcus.tisater@gmail.com, password: "hej12345", password_confirmation: "hej12345")
      expect(user).to receive(:authentiactes)
      post :create, :email: "marcus.tisater@gmail.com", password: "hej12345"
      

  end 
end
