class ContaInterna < ActiveRecord::Base
  validates :nome, length: { maximum: 250 }
  validates_presence_of :nome, :saldo
end
