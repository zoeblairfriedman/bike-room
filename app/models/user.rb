class User < ActiveRecord::Base
    has_many :bikes
    has_many :spots
    has_secure_password
    validates_uniqueness_of :name
end
