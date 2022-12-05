class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

  # validate :title_is_clickbait

  def title_is_clickbait
    # words = ["Won't Believe", "Secret", "Top [number]", "Guess"]

    # unless words.any? { |word| title.include? word }
    #   errors.add(:title, "Title not valid") 
    # end

    unless title.include?("Won't Believe") or title.include?("Secret") or title.include?("Top [number]") or title.include?("Guess")
      errors.add(:title, "Title not valid") 
    end
  end
end
