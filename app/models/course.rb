class Course < ApplicationRecord
    # add some validation here
    validates :title, presence: true
    validates :description, presence: true, length: { :minimum => 5 }
    
    
    def to_s
        title
    end
    
    belongs_to :user
    
    has_rich_text :description
    
end
