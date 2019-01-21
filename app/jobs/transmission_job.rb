class TransmissionJob < ApplicationJob
  queue_as :default

  def perform(transmission_id)
    transmission = Transmission.find(transmission_id)
    ActionCable.server.broadcast "device_channel_#{transmission.device_id}", message: transmission.message
  end
end
