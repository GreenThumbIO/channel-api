from actioncable.connection import Connection
from actioncable.subscription import Subscription
from actioncable.message import Message
import time
import json
# if __name__ == '__main__':
connection = Connection(url='ws://cable:28080')
connection.connect()

subscription = Subscription(connection, identifier={'channel':'DeviceChannel'})
subscription.create()

subscription.connection.send({
    'command':'message',
    'identifier': json.dumps({'channel':'DeviceChannel'}),
    'data':json.dumps({'action':'message','message':"Time: " + str(time.time())})
    })
