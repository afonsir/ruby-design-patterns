# frozen_string_literal: true

class Portfolio
  include Enumerable

  def initialize
    @accounts = []
  end

  def each(&block)
    @accounts.each(&block)
  end

  def add_account(account)
    @accounts << account
  end
end

my_portfolio = Portfolio.new

my_portfolio.add_account Account.new('First Account', 10_000.00)
my_portfolio.add_account Account.new('Second Account', 5_000.00)
my_portfolio.add_account Account.new('Third Account', 2_500.00)

my_portfolio.any? { |account| account.balance > 2000 } # true
my_portfolio.all? { |account| account.balance >= 10 } # true
