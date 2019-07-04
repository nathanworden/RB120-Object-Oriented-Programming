# class Banner
#   def initialize(message)
#     @message_length = message.size
#     @message = message
#     loop do
#       puts "How wide would you like the banner to be?"
#       @length = gets.chomp.to_i
#       break if @length > @message_length
#       puts "That is not long enough for your message. Please provide a longer length."
#     end
#   end

#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end

#   private

#   def horizontal_rule
#     "+-#{"-" * @length}-+"
#   end

#   def empty_line
#     "| #{" " * @length} |"
#   end

#   def message_line
#     "| #{@message.center(@length)} |"
#   end
# end

# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner

# banner = Banner.new('')
# puts banner


class Banner
  MAX_WIDTH = 80
  attr_reader :message, :width

  def initialize(message)
    @message = message
    @width = choose_width
  end

  def to_s
    [horizontal_rule, empty_line, print_message_lines, empty_line, horizontal_rule].join("\n")
  end

  private

  def choose_width
    puts "Enter width! Range: #{minimum_available_width} - #{MAX_WIDTH}."
    number = nil
    loop do
      number = gets.chomp.to_i
      break if (minimum_available_width..MAX_WIDTH).to_a.include?(number)
      puts "Number is either too small or too big! Try again."
    end
    number
  end

  def minimum_available_width
    message.split.max_by(&:length).length
  end

  def chars_count(arr)
    count = 0
    arr.each_do |word|
      count += word.chars.size
    end
    count
  end

  def message_into_lines
    lines = []
    current_line = []
    message.split.each do |word|
      if chars_count(current_line) + "#{word} ".size > width
        lines << current_line
        current_line = []
      end
      current_line << "#{word} "
end

banner = Banner.new('dogs dogs dogs')






