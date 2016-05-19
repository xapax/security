# Scripting with python

Most things we want to do with python is connecting to networks in different ways. For this the socket module is fundamental.


## Basic banner-grabber
Here is an example of the most basic usage of the socket module. It connects to a port and prints out the response.

```python
#!/user/bin/env python

# Importing the socket module
import socket

# We use the socker() method of the module socket and store it in the variable s.
s = socket.socket()

# Here we use the connect method of the socket we created. The two arguments are pretty self-explanatory
# The first is the adress the second is the port.
s.connect(("192.168.1.104", 22))

# Here we save what the socket reviewed in the variable answer.
answer = s.recv(1024)

# Here we close the socket.
s.close

# Here we print out what we recieved.
print answer
```

If you need to check all 65535 ports this might take some time. If a packet is sent and recieved that makes it 65535 seconds, it translates into about 18 hours. So to solve that we can run the a function in new threads.

```python
from multiprocessing.dummy import Pool as ThreadPool
pool = ThreadPool(300)
results = pool.map(function, array)
```

Read more about parallellism here: http://chriskiehl.com/article/parallelism-in-one-line/


