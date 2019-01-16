from actioncable.connection import Connection
from actioncable.subscription import Subscription
from actioncable.message import Message
import time

# if __name__ == '__main__':
connection = Connection(url='ws://cable:28080')
connection.connect()

subscription = Subscription(connection, identifier={'identifier': 'DeviceChannel'})

def on_receive(message):
  print('New message arrived!')
  print('Action: {} | Data: {}'.format(message.action, message.data))

subscription.on_receive(callback=on_receive)
subscription.create()

message = Message(action='transmit', data={'message': "Time: " + str(time.time()), 'device_id': 123})

subscription.send(message)
