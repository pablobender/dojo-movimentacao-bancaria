require 'rails_helper'

RSpec.describe ContaInternasController, :type => :controller do

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
    it "should route_to '/conta_internas'" do
      expect(get: "/conta_internas").to route_to(controller: "conta_internas", action: "index")
    end
    it "should assign @contas" do
      get :index
      contas = FactoryGirl.create_list :conta_interna, 2
      expect(assigns(:contas)).to include(*contas)
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get(:new)
      expect(response).to be_success
    end
    it "should assign conta_interna" do
      get :new
      expect(assigns(:conta)).to be_a_new(ContaInterna)
    end
    it "should route_to '/conta_internas/new'" do
      expect(get: "/conta_internas/new" ).to route_to(controller: "conta_internas", action: "new")
    end
  end

  describe "POST 'create'" do
    before :each do
      post :create, conta_interna: { nome: 'conta x', saldo: 100 }
      @conta = ContaInterna.first
    end
    it "should redirect to conta_interna_show" do
      expect(response).to redirect_to(conta_interna_path(id: @conta.id))
    end
    context "save" do
      it "should save nome" do
        expect(@conta.nome).to be_eql("conta x")
      end
      it "should save saldo" do
        expect(@conta.saldo).to be_eql(100.0)
      end

      it "should be persisted" do
        expect(@conta.persisted?).to be_eql(true)
      end
    end
    it "should route_to '/conta_internas'" do
      expect(post: "/conta_internas").to route_to(controller: "conta_internas", action: "create")
    end
  end

  describe "GET 'show'" do
    before :each do
      @conta = ContaInterna.new id: 1, nome: 'conta y', saldo: 123
      @conta.save!
    end
    it "returns http success" do
      get :show, id: 1
      expect(response).to be_success
    end
    it "should assign conta_interna" do
      get :show, id: 1
      expect(assigns(:conta)).to be_a(ContaInterna)
    end
    it "should route_to '/conta_interna/*id*'" do
      expect(get: "/conta_interna/123").to route_to(controller: "conta_internas", action: "show", id: "123")
    end
  end
end
