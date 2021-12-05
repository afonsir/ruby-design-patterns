# frozen_string_literal: true

require 'observer'

require_relative '../payroll'
require_relative '../tax_man'

class Employee
  include Observable

  attr_reader :name, :salary
  attr_accessor :title

  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
    @observers = []
  end

  def salary=(new_salary)
    old_salary = @salary
    @salary = new_salary

    if old_salary != new_salary
      changed
      notify_observers(self)
    end
  end
end

fred = Employee.new('Fred Flintstone', 'Crane Operator', 30_000.00)

payroll = Payroll.new
fred.add_observer(payroll)

tax_man = TaxMan.new
fred.add_observer(tax_man)

fred.salary = 35_000.00
fred.salary = 35_000.00
fred.salary = 30_000.00
