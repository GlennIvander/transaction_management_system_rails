require "csv"

class CsvReaderService
  def initialize(csv_path)
    @csv_path = csv_path
  end

  def read
    rows = CSV.read(@csv_path, headers: true)
    rows.map do |row|
      Transaction.new(
        transaction_date: row["Transaction Date"],
        account_number: row["Account Number"],
        account_holder_name: row["Account Holder Name"],
        amount: row["Amount"],
        status: row["Status"]
      )
    end
  rescue CSV::MalformedCSVError => e
    Rails.logger.error "CSV read failed: #{e.message}"
    []
  end

  def count
    CSV.read(@csv_path, headers: true).count
  end
end
