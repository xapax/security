# Payloads


There are three different types of payload modules.

1. Singles
2. Stagers
3. Stages


## Singles

Singles are self-contained payloads. They can be caught with netcat for example.

## Stagers

Stagers set up a network connection between the attacher and the target. This usually comes in the form of a shell. It is called stagers because it uploads several items/shells in the process. First it sets up a connection, then it improves the connection with like meterpreter.

It can be that an exploit only gives you so much space to use, so instead of sending one big payload you send it in stages.

## Stages

Stages are the different component that are downloaded/uploaded in the Stagers payload. 
