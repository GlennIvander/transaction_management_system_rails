class TransactionsWrapper
  def self.call
    response = HTTParty.get("http://localhost:3000/api/v1/transactions")

    if response.success?
      puts "Fetched Transactions:"
      puts response.parsed_response
    else
      puts "Failed with code: #{response.code}"
    end

    response
  end
end
