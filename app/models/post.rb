class Post < ApplicationRecord
    has_one_attached :image, :dependent => :destroy
    belongs_to :user
    acts_as_votable
end
