class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.date :transaction_date
      t.text :account_number
      t.text :account_holder_name
      t.float :amount
      t.string :status

      t.timestamps
    end
  end
end
