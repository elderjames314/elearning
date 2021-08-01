class Course < ApplicationRecord
    # add some validation here
    validates :title, presence: true
    validates :description, presence: true, length: { :minimum => 5 }
    
    
    def to_s
        title
    end
    
    belongs_to :user
    
    has_rich_text :description
    
    extend FriendlyId
    #friendly_id :title, use: :slugged
    
    friendly_id :generated_slug, use: :slugged
    def generated_slug 
        require "securerandom"
        @random_slug ||= persisted? ? friendly_id : SecureRandom.hex(12)
    end
    
end
