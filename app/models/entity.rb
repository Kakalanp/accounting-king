class Entity < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :groups, foreign_key: :user_id, class_name: 'Group'
end
