# frozen_string_literal: true

class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(&formatter)
    @title = 'Monthly Report'
    @text = ['Things are going', 'really, really well.']
    @formatter = formatter
  end

  def output_report
    @formatter.call(self)
  end
end

HTML_FORMATER = lambda do |context|
  puts '<html>'
  puts '  <head>'
  puts "    <title>#{context.title}</title>"
  puts '  </head>'
  puts '  <body>'

  context.text.each do |line|
    puts "    <p>#{line}</p>"
  end

  puts '  </body>'
  puts '</html>'
end

report = Report.new &HTML_FORMATER
report.output_report

report = Report.new do |context|
  puts "***** #{context.title} *****"

  context.text.each do |line|
    puts line
  end
end

report.output_report
