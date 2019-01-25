class Transmission < ApplicationRecord
  searchkick callbacks: :async
  belongs_to :device
  after_create_commit { TransmissionJob.perform_later self.id }
end
