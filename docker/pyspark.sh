#!/bin/bash
# PySpark
# 1. Start in background
docker  compose -f docker-pyspark-compose.yml up -d

# 2. Look at logs
docker compose -f docker-pyspark-compose.yml logs -f

# 3. Stop and remove containers
docker  compose -f docker-pyspark-compose.yml down
