module Validatable
  def valid?
    validate!
    true
  rescue StandardError
    false
  end
end
