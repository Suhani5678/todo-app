class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  rolify #:before_add => :before_add_method

  has_many :jobs
  has_many :job_applications
  has_many :messages
  has_many :conversations, foreign_key: :sender_id
end
