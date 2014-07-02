require 'rails_helper'

RSpec.describe ContaInterna, :type => :model do
  before :each do
    @conta = ContaInterna.new
  end
  it "should accpet max 250 char on 'nome'" do
    @conta.nome = "*" * 251
    expect(@conta).not_to be_valid
  end
  it "should require nome" do
    @conta.nome = nil
    @conta.valid?
    expect(@conta.errors.messages[:nome]).to include("não pode ficar em branco")
  end
  it "should require saldo" do
    @conta.saldo = nil
    @conta.valid?
    expect(@conta.errors.messages[:saldo]).to include("não pode ficar em branco")
  end
end
