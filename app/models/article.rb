class Article < ApplicationRecord
  attr_accessor :long_title
  has_many :comments, dependent: :destroy

  before_validation :convert_title

  # validates(:title, :body, {presence: true})
  validates :title, :body, presence: true

  def not_private
    "JEP"
  end

  # self methods dont need class instance
  def self.something
    'hello'
  end

  private

  def is_private
    "NOPE"
  end

  def convert_title
    return unless long_title.present?
    self.title = long_title.truncate(10)
  end

end
