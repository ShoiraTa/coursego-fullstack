class Category < ApplicationRecord
  belongs_to :user
  has_many :activity_logs
end
