class User < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :entities, foreign_key: :user_id, class_name: 'Entity'
end
