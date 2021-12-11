# frozen_string_literal: true

require_relative 'command'

class DeleteFile < Command
  def initialize(path)
    super("Delete file: #{path}")
    @path = path
  end

  def execute
    @contents = File.read(@path) if File.exists?(@path)
    File.delete(@path)
  end

  def unexecute
    File.open(@path, 'w') { |f| f.write(@contents) } if @contents
  end
end
