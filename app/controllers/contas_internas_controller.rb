class ContasInternasController < ApplicationController
  def index
  end

  def new
    @conta = ContaInterna.new
  end
end
