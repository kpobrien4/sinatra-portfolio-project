class User < ActiveRecord::Base
    has_many :projects

    validates :username, presence: true, uniqueness: true

    has_secure_password
end
