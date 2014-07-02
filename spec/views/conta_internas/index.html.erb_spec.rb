require 'rails_helper'

RSpec.describe "conta_internas/index.html.erb", :type => :view do
  before :each do
    @conta1 = FactoryGirl.build :conta_interna, nome: "conta 1", saldo: 1
    @conta2 = FactoryGirl.build :conta_interna, nome: "conta 2", saldo: 2
    @contas = [ @conta1, @conta2 ]
  end

  it "should display conta.nome" do
    assign :contas, @contas
    render
    expect(rendered).to match(/conta 1/)
    expect(rendered).to match(/conta 2/)
  end
end
