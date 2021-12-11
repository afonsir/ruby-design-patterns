# frozen_string_literal: true

require_relative 'command'

class CreateFile < Command
  def initialize(path, contents)
    super("Create file: #{path}")
    @path = path
    @contents = contents
  end

  def execute
    File.open(@path, 'w') { |f| f.write(@contents) }
  end

  def unexecute
    File.delete(@path)
  end
end
