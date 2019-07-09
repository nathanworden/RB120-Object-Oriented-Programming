class SecretFile
  attr_reader :data

  def initialize(secret_data, SecurityLogger)
    @data = secret_data
  end
end

class SecurityLogger
  def create_log_entry

  end
end