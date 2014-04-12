class TodoitList < ActiveRecord::Base

    validates :title, presence: true 
end
