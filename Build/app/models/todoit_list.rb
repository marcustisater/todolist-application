class TodoitList < ActiveRecord::Base

    has_many :todoit_items 



    validates :title, presence: true 
    validates :title, length: { minimum: 3}
    validates :description, presence: true 
    validates :description, presence: true
    validates :description, length: { minimum: 5}

    def has_completed_items?
      todoit_items.completed.size > 0 
    end 

    def has_incomplete_items?
      todoit_items.incomplete.size > 0
    end

end
