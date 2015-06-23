from gi.repository import Gtk
import dbus
import dbus.service
from dbus.mainloop.glib import DBusGMainLoop

class MyDBUSService(dbus.service.Object):
    def __init__(self):
        bus_name = dbus.service.BusName('com.zielmicha.test', bus=dbus.SessionBus())
        dbus.service.Object.__init__(self, bus_name, '/com/zielmicha/test')

    @dbus.service.method('com.zielmicha.test')
    def hello(self):
        print 'hello world'
        return "Hello, world!"

DBusGMainLoop(set_as_default=True)
myservice = MyDBUSService()
Gtk.main()
