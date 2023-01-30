class Employee < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true, length: {maximum: 10}
end
