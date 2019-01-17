from actioncable.connection import Connection
from actioncable.subscription import Subscription
from actioncable.message import Message
from serial.tools import list_ports
import serial
import time
import json
import time.sleep

connection = Connection(url='ws://localhost:28080')
connection.connect()

subscription = Subscription(connection, identifier={'channel':'DeviceChannel'})
subscription.create()

def on_receive(message):
  print('New message arrived!')
  print('Action: {} | Data: {}'.format(message.action, message.data))

subscription.on_receive(callback=on_receive)

subscription.connection.send({
    'command':'message',
    'identifier': json.dumps({'channel':'DeviceChannel'}),
    'data':json.dumps({'action':'message','message':"Time: " + str(time.time())})
    })

ser = serial.Serial(list_ports.comports()[1].device, 9600)
while True:
    time.sleep(1)
    reading = ser.readline().decode("utf-8")
    print(reading)
    subscription.connection.send({
        'command':'message',
        'identifier': json.dumps({'channel':'DeviceChannel'}),
        'data':json.dumps({'action':'message','message': reading})
        })
