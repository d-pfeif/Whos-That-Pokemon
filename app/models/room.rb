class Room < ApplicationRecord
  before_create :set_code

  private
  def set_code
    attempts = 0
    code_length = 4
    code = SecureRandom.alphanumeric(code_length)

    while Room.exists?(code: code)
      attempts += 1
      if attempts > 10
        code_length += 1
        attempts = 0
      end
      code = SecureRandom.alphanumeric(code_length)
    end

    self.code = code
  end
end
