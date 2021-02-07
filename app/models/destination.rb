class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def five_most_recent_posts
        self.posts.order(created_at: :desc).limit(5)
    end

    def featured_post
        self.posts.max { |a, b| a.likes <=> b.likes }
    end
end
