class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :ClickBaitTitle

  def ClickBaitTitle
    /\bWon't Believe|\bSecret|\bTop \d+|\bGuess/.match(self.title)
  end
end
