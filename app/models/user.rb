class User < ActiveRecord::Base
    has_many :projects
    has_many :artists

    validates :username, presence: true, uniqueness: true

    has_secure_password
end
