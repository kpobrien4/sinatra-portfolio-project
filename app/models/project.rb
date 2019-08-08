class Project < ActiveRecord::Base
    validates :title, presence: true
    validates :genre, presence: true
    validates :info, presence: true
end
