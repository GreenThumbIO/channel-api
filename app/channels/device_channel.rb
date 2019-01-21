class DeviceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "device_channel_#{params[:device_id]}"
    Rails.logger.debug "subscribed cat facts... JK subscribed to device_channel_#{params[:device_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def message(data)
    Transmission.create! message: data['message'], device_id: data['device_id']
    Rails.logger.debug "Message Received #{data[:device_id]}: #{data['message']}"
  end
end
