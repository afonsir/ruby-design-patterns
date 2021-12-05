# frozen_string_literal: true

require_relative 'subject'

class Employee
  include Subject

  attr_reader :name, :salary
  attr_accessor :title

  def initialize(name, title, salary)
    super()
    @name = name
    @title = title
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end
end

fred = Employee.new('Fred Flintstone', 'Crane Operator', 30_000.00)

fred.add_observer do |changed_employee|
  puts "Cut a new check for #{changed_employee.name}!"
  puts "His salary is now #{changed_employee.salary}!"
end

fred.salary = 35_000.00
