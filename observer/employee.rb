# frozen_string_literal: true

require_relative 'subject'

require_relative 'payroll'
require_relative 'tax_man'

class Employee
  include Subject

  attr_reader :name, :salary
  attr_accessor :title

  def initialize(name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
    @observers = []
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end
end

fred = Employee.new('Fred Flintstone', 'Crane Operator', 30_000.00)

payroll = Payroll.new
fred.add_observer(payroll)

tax_man = TaxMan.new
fred.add_observer(tax_man)

fred.salary = 35_000.00
