### Cypher / Interesting queries


Get shortest path from any user that is not admin, to Domain admins group
```
MATCH (n:User {admincount: false}), (m:Group {name: "DOMAIN ADMINS@domain.local"}), p=shortestPath((n)-[*1..]->(m)) RETURN p
```

