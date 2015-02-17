class Tweet < ActiveRecord::Base
    has_one :location,foreign_key: :tweeter_id, dependent: :destroy
    scope :recent, order('created_at desc').limit(4) 
    scope :graveyard, where(show_location:true,location:"graveyard")
    before_save :before_save
    after_update :log_update
    after_destroy :log_destroy
    def before_save
        self.show_location = true if self.location
    end
    def log_update
        logger.info "Tweet #{id} updated"
    end

    def log_destroy
        logger.info "Tweet #{id} deleted"
    end
end