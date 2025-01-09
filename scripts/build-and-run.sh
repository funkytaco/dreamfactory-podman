#!/bin/bash

# Exit on error
set -e

echo "Building DreamFactory containers..."
podman-compose build

echo "Starting containers..."
podman-compose up -d

echo "Waiting for services to initialize..."
sleep 10

echo "Checking container status..."
podman-compose ps

echo "should be up"