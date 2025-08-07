module TransactionsHelper
  def status_color_class(status)
    {
      "Settled" => "bg-green-100 text-green-800",
      "Pending" => "bg-yellow-100 text-yellow-800",
      "Failed"  => "bg-red-100 text-red-800"
    }[status] || "bg-gray-100 text-gray-800"
  end

  def formatted_currency(amount)
    number_to_currency(amount, unit: "", delimiter: ",", precision: 2)
  end

  def formatted_account_number(account_number)
    return "" unless account_number.present?
    digits_only = account_number.gsub(/\D/, "")
    return account_number unless digits_only.length == 12
    digits_only.scan(/.{1,4}/).join("-")
  end
end
