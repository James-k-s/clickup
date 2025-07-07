class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks, dependent: :destroy
  has_many :task_comments, dependent: :destroy
  has_many :lists, dependent: :destroy
  has_many :habit_trackers, dependent: :destroy
  has_many :habit_items, through: :habit_trackers
  has_many :habit_logs, through: :habit_items
end
