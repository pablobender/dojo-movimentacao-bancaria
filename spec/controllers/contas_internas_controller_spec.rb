require 'rails_helper'

RSpec.describe ContasInternasController, :type => :controller do

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
    it "should assign conta_interna" do
      get :new
      expect(assigns(:conta)).to be_a_new(ContaInterna)
    end
  end

end
