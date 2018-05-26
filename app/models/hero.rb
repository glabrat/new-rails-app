class Hero < ApplicationRecord
    validate :name, presence: true
end
