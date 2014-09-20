require 'rails_helper'

RSpec.describe HomeController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET index" do
    it "renders template index" do
      get :index
      expect(response).to render_template :index
    end
  end
end

