class Transaction
  include ActiveModel::Model

  attr_accessor :transaction_date, :account_number, :account_holder_name, :amount, :status

  STATUSES = %w[Settled Pending Failed]

  validates :transaction_date, :account_number, :account_holder_name, :amount, presence: true
  validates :amount, numericality: true
  validates :account_holder_name, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters" }
  validates :account_number, format: { with: /\A\d{12}\z/, message: "must contain exactly 12 digits" }

  def assign_random_status
    self.status ||= STATUSES.sample
  end
end
