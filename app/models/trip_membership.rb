# app/models/trip_membership.rb
class TripMembership < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  
  enum :role, { viewer: 0, contributor: 1, organizer: 2 }
  enum :status, { invited: 0, confirmed: 1, declined: 2 }
  
  validates :user_id, uniqueness: { scope: :trip_id }
  
  scope :confirmed, -> { where(status: :confirmed) }
  scope :organizers, -> { where(role: :organizer) }
end