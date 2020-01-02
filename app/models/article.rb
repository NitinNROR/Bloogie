class Article < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 5 }
  
  belongs_to :user

  def line
  	return self.text.truncate_words(20)
  end
end
