class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendees
  has_many :items
  has_many :comments


  validates :name, :description, :when, :where, presence:true
  
  geocoded_by :where
  after_validation :geocode

  def attendee_count
  	self.attendees.count
  end
end
