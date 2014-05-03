class TodoitList < ActiveRecord::Base

    has_many :todoit_items 



    validates :title, presence: true 
    validates :title, length: { minimum: 3}
    validates :description, presence: true 
    validates :description, presence: true
    validates :description, length: { minimum: 5}

end
