class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map do |audition|
            audition.actor
        end
    end

    def locations
        self.auditions.map do |audition|
            audition.location
        end
    end

    def lead
        hired = self.auditions.find_by(hired: true) || "no actor has been hired for this role"
    end

    def understudy
        hired2 = self.auditions.where(hired: true)
        hired2.second || "no actor has been hired for this understudy"
    end


#    
end