class Bike < ActiveRecord::Base
    belongs_to :user
    validates_presence_of :model, :description
end
