class Message < ActiveRecord::Base
  validates :body, presence: true
  validates :destroy_type, inclusion: {in: [0, 1]}
  validates :link, presence: true
  validates :visit_counter, numericality: { greater_than: 0 }
  def self.actual
    where("expires_at > ? OR visit_counter > ?", Time.now, 0)
  end
  def to_param
    "#{link}"
  end
end
