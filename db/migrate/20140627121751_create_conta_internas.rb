class CreateContaInternas < ActiveRecord::Migration
  def change
    create_table :conta_internas do |t|
      t.string :nome
      t.float :saldo

      t.timestamps
    end
  end
end
