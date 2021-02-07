class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :bio, length: { minimum: 30 }
    validates :age, numericality: { greater_than: 0 }

    def total_likes
        self.posts.map { |p| p.likes }.sum
    end

    def featured_post
        self.posts.max { |a, b| a.likes <=> b.likes }
    end

end
