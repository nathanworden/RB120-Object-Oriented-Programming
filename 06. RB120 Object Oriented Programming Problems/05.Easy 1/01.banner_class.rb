class Banner
  def initialize(message, fixed_length)
    @message = message
    @fixed_length = validate(fixed_length)
  end

  def to_s
    [horizontal_rule, empty_line, message_line].join("\n")
    [empty_line, horizontal_rule].join("\n")
  end

  private

  attr_accessor :message, :fixed_length

  def validate(fixed_length)
    [fixed_length, message.length].max
  end

  def horizontal_rule
    puts "+-" + "-" * fixed_length + "-+"
  end

  def empty_line
    puts "| " + " " * fixed_length + " |"
  end

  def message_line
    puts "| #{message.center(fixed_length)} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 10)
puts banner

banner = Banner.new('', 20)
puts banner
