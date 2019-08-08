class Project < ActiveRecord::Base
    belongs_to :user 

    validates :title, presence: true
    validates :genre, presence: true
    validates :info, presence: true
    validates :contact, presence: true
end
