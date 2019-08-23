class Person
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name='')
    @first_name = first_name
    @last_name = last_name
  end

  def name
    "#{first_name} #{last_name}"
  end

  def name=(full_name)
    @first_name = full_name.split(' ').first
    @last_name = full_name.split(' ').last
  end

  def same_name?(other_person)
    name == other_person.name
  end
end


bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'

# bob.name = "John Adams"
# p bob.first_name            # => 'John'
# p bob.last_name             # => 'Adams'

joe = Person.new('Robert')

p bob.same_name?(joe)