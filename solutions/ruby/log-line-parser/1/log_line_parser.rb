class LogLineParser
  def initialize(line)
    @line = line
  end

  def parser 
    # return an array of log level and message
    # created to not seperate the line again and again
    line_array = @line.split

    log_level = line_array.shift
    log_level = log_level.slice!(1, (log_level.length-2-1))

    [log_level.downcase, line_array.join(' ')]
  end

  def message
    _, msg = parser
    msg
  end

  def log_level
    level, _ = parser
    level.downcase
  end

  def reformat
    log_level, message = parser
    "#{message} (#{log_level})"
  end
end
