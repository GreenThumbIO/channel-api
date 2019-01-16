class DeviceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "device_channel_#{params[:device_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def transmit
    # Transmission.create! text: data['message'], device_id: data['device_id']
    Rails.logger.debug "#{data['message']}"
    ActionCable.server.broadcast "device_channel_#{params[:device_id]}",
      message: data['message']
  end
end
