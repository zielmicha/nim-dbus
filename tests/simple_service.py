from gi.repository import GLib
import dbus
import dbus.service
from dbus.mainloop.glib import DBusGMainLoop

class MyDBUSService(dbus.service.Object):
    def __init__(self):
        bus_name = dbus.service.BusName('com.zielmicha.test', bus=dbus.SessionBus())
        dbus.service.Object.__init__(self, bus_name, '/com/zielmicha/test')

    @dbus.service.method('com.zielmicha.test')
    def hello(self, *args, **kwargs):
        print( 'hello world {} {}'.format(args, kwargs) )
        return ("Hello, world!", args[0] if args else 1)

    @dbus.service.signal('com.zielmicha.testsignal')
    def hello_sig(self):
        print( 'hello world sig' )

DBusGMainLoop(set_as_default=True)
myservice = MyDBUSService()

loop = GLib.MainLoop()
loop.run()
