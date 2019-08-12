class Machine
  # attr_reader :switch

  def initialize
    @switch = :off
  end

  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  # def state?
  #   @switch
  # end

  def to_s
    puts "The machine is #{switch}."
  end

  def state?
    "#{self}"
  end

  private

  attr_writer :switch
  attr_reader :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end


machine = Machine.new

machine.state?

machine.start
machine.state?

machine.stop
machine.state?