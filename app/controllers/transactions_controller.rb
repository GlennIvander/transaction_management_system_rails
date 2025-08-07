require "csv"
require "ostruct"

class TransactionsController < ApplicationController
  layout "application"
  helper TransactionsHelper

  def index
    csv_path = Rails.root.join("db/seeds/transactions-sample.csv")
    reader = CsvReaderService.new(csv_path)
    all_transactions = reader.read

    @q = OpenStruct.new(params[:q])
    if params[:q] && params[:q][:account_holder_name_cont].present?
      keyword = params[:q][:account_holder_name_cont].downcase
      @transactions = all_transactions.select { |t| t.account_holder_name.downcase.include?(keyword) }
    else
      @transactions = all_transactions
    end

    @transaction_count = @transactions.count
    @transaction = Transaction.new
  end


  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.assign_random_status

    if @transaction.valid?
      csv_path = Rails.root.join("db/seeds/transactions-sample.csv")
      CsvWriterService.new(csv_path).append(@transaction)

      reader = CsvReaderService.new(csv_path)
      @transactions = reader.read
      @transaction_count = reader.count

      flash.now[:notice] = "Transaction added!"

      respond_to do |format|
        format.html { redirect_to transactions_path, notice: "Transaction added!" }
        format.turbo_stream
      end
    else
      csv_path = Rails.root.join("db/seeds/transactions-sample.csv")
      reader = CsvReaderService.new(csv_path)
      @transactions = reader.read
      @transaction_count = reader.count

      render :index, status: :unprocessable_entity
    end
  end

  private

  def transaction_params
    params.require(:transaction).permit(:transaction_date, :account_number, :account_holder_name, :amount)
  end
end
