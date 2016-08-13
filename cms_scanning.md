# CMS Scanning



`sudo wpscan -u http://cybear32c.lab`

If you hit a 403. That is, the request if forbidden for some reason.
Read more here: https://en.wikipedia.org/wiki/HTTP_403

It could mean that the server is suspicious because you don't have a proper user-agent in your request, in wpscan you can solve this by inserting --random-agent.
You can of course also define a specific agent if you want that. But random-agent is pretty convenient.
`sudo wpscan -u http://cybear32c.lab/ --random-agent`

## Scan for users

You can use wpscan to enumerat users:
