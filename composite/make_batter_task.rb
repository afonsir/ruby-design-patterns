# frozen_string_literal: true

require_relative 'composite_task'
require_relative 'add_dry_ingredients_task'
require_relative 'add_liquids_task'
require_relative 'mix_task'

class MakeBatterTask < CompositeTask
  def initialize
    super('Make batter')
    add_sub_task( AddDryIngredientsTask.new ) 
    add_sub_task( AddLiquidsTask.new ) 
    add_sub_task( MixTask.new ) 
  end
end
