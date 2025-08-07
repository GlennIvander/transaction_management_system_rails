require "csv"

class CsvWriterService
  def initialize(csv_path)
    @csv_path = csv_path
  end

  def append(transaction)
    CSV.open(@csv_path, "a", write_headers: false, force_quotes: true) do |csv|
      csv << [
        transaction.transaction_date,
        transaction.account_number,
        transaction.account_holder_name,
        transaction.amount,
        transaction.status
      ]
    end
  end
end
