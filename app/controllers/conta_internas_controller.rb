class ContaInternasController < ApplicationController
  def index
  end

  def new
    @conta = ContaInterna.new
  end

  def create
    conta_params = params.require(:conta_interna).permit(:nome, :saldo)
    conta = ContaInterna.new(conta_params)
    conta.save!
    redirect_to conta_interna_path(id: conta.id)
  end

  def show
    @conta = ContaInterna.find params[:id]
  end
end
