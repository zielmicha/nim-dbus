# nim-dbus
libdbus binding for Nim


## Testing

The tests rely on the Python dbus service found in `tests/simple_service.py`.  Use one of the sections below to get an environment prepared to run the Python script, then run:

```
python tests/simple_service.py
```

Then run

```
nimble test
```

### Docker

```
docker run --rm -it --cap-add ipc_lock -v $(pwd):/code -w /code nimlang/nim /bin/bash
```

Within the running container:

```
apt-get update -q
apt-get install -y dbus libdbus-1-dev python-gi python-dbus
dbus-run-session -- bash
```

```
python tests/simple_service.py &
```


## Resources

http://www.matthew.ath.cx/misc/dbus - libdbus tutorial

http://lists.freedesktop.org/archives/dbus/2007-October/008859.html - simplest loop
