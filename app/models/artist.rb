class Artist < ActiveRecord::Base
    belongs_to :user 

    validates :name, presence: true
    validates :skills, presence: true
    validates :info, presence: true
    validates :contact, presence: true
end
