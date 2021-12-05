# frozen_string_literal: true

require_relative 'task'

class AddLiquidsTask < Task
  def initialize
    super('Add liquid ingredients')
  end
  
  def get_time_required
    0.5 # 0.5 minute to add milk
  end
end
