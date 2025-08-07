class Api::V1::TransactionsController < ApplicationController
  def index
    csv_path = Rails.root.join("db/seeds/transactions-sample.csv")
    reader = CsvReaderService.new(csv_path)

    transactions = reader.read
    render json: {
      transactions: transactions,
      count: reader.count
    }, status: :ok
  end

  def create
    transaction = Transaction.new(transaction_params)
    transaction.assign_random_status

    if transaction.valid?
      csv_path = Rails.root.join("db/seeds/transactions-sample.csv")
      CsvWriterService.new(csv_path).append(transaction)

      reader = CsvReaderService.new(csv_path)
      render json: {
        transaction: transaction,
        transactions: reader.read,
        count: reader.count,
        message: "Transaction added!"
      }, status: :created
    else
      render json: { errors: transaction.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:transaction_date, :account_number, :account_holder_name, :amount)
  end
end
