class Message < ActiveRecord::Base
  validates :body, presence: true
  validates :destroy_type, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 1}
  validates :link, presence: true, uniqueness: true
  validates :visit_counter, presence: true, if: :visit_counter_destroy_type?
  validates :visit_counter, numericality: { greater_than: 0 }, if: :visit_counter_destroy_type?
  validates :expires_at, presence: true, unless: :visit_counter_destroy_type?
  def visit_counter_destroy_type?
    destroy_type == 1
  end
  def self.actual
    where("expires_at > ? OR visit_counter > ?", Time.now, 0)
  end
  def to_param
    "#{link}"
  end
end
