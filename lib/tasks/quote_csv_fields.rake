require "csv"

namespace :csv do
  desc "Making sure that all fields in the CSV are quoted"
  task quote_all_fields: :environment do
    csv_path = Rails.root.join("db/seeds/transactions-sample.csv")

    rows = CSV.read(csv_path, headers: true)

    CSV.open(csv_path, "w", force_quotes: true) do |csv|
      csv << rows.headers
      rows.each { |row| csv << row.fields }
    end

    puts "CSV fields quoted successfully!"
  end
end
