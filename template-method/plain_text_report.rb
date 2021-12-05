# frozen_string_literal: true

require_relative 'report'

class PlainTextReport < Report
  def output_head
    puts "**** #{@title} ****"
    puts
  end

  def output_line(line)
    puts line
  end
end

# report = PlainTextReport.new
# report.output_report
