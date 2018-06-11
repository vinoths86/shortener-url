class Shortner < ApplicationRecord

  belongs_to :user

  validates :original_url,
            presence: true

  before_save :generate_short_url

  def generate_short_url
    random_string = ([*('a'..'z')]+[*(2..9)]).sample(8).join
    self.short_url = random_string
  end
end
