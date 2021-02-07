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

    def five_most_popular_destinations
        freq = self.destinations.inject(Hash.new(0)) { |h,v| h[v] += 1; h }.sort_by { |k, v| v }.reverse
        arr = []
        i = 0
        while i < 5
            arr << freq[i][0] if freq[i] != nil
            i += 1
        end
        arr
    end

end
