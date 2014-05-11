class TodoitItem < ActiveRecord::Base
  belongs_to :todoit_list

  validates :content, presence: true,
                          length: { minimum: 2} 





end
