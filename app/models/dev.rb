class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        current_freebies = self.freebies.map {|freebie| freebie.item_name}
        if current_freebies.find {|item| item == item_name}
            true
        else
            false
        end
    end

    def give_away(dev, freebie)
        if self.id == freebie.dev_id
            puts "working"
            freebie.dev_id = dev.id
            freebie.save
        end
    end
end
