class ChangeAmountToDecimalInTransactions < ActiveRecord::Migration[7.1]
  def change
    change_column :transactions, :amount, :decimal, precision: 10, scale: 2
  end
end
