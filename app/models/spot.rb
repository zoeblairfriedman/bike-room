class Spot < ActiveRecord::Base
    belongs_to :user

    def level?
        if self.id.even?
            "upper level"
        else self.id.odd?
            "lower level"
        end
    end

end
