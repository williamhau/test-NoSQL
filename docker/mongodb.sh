#!/bin/bash
# Memgraph Graph Database
set -a
source ../.env
set +a

# 1. Start in background
docker  compose -f docker-mongodb-compose.yml up -d

# 2. Look at logs
docker compose -f docker-mongodb-compose.yml logs -f

# 3. Stop and remove containers
docker  compose -f docker-mongodb-compose.yml down