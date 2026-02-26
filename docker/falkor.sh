#!/bin/bash
# Falkor Graph Database with RedisGraph
# 1. Start in background
docker  compose -f docker-falkorDB-compose.yml up -d

# 2. Look at logs
docker compose -f docker-falkorDB-compose.yml logs -f

# 3. Open browser UI → http://localhost:3000
#    (if you set a password → use it when connecting)

# 4. Connect with redis-cli (with password)
redis-cli -p 6379 -a myfalkordb2026

# Inside redis-cli you can immediately start using graph commands:
GRAPH.QUERY mygraph "CREATE (:Person {name: 'William'})-[:KNOWS]->(:Person {name: 'Grok'})"
GRAPH.QUERY mygraph "MATCH (a)-[r]->(b) RETURN a, r, b"