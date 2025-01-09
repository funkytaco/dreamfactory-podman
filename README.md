# DreamFactory Podman Setup

This repository contains Podman configurations for running DreamFactory with MySQL, Redis, and a test Postgres database.

## Prerequisites

- Podman
- podman-compose

## Quick Start

1. Clone this repository:
```bash
git clone https://github.com/funkytaco/dreamfactory-podman.git
cd df-podman
```

2. Build and start containers:
```bash
./scripts/build-and-run.sh
```

3. Access DreamFactory at `http://127.0.0.1`

## Container Details

- DreamFactory application
- MySQL (system database)
- Redis (caching)
- Postgres (test database with 100k+ records)

## Data Persistence

Data is stored in these volumes:
- `df-storage:/opt/dreamfactory/storage` - DreamFactory storage
- `df-mysql:/var/lib/mysql` - MySQL data
- `df-postgres:/var/lib/postgresql/data` - Postgres data

## Managing Containers

Stop containers:
```bash
podman-compose down
```

Remove containers and volumes:
```bash
podman-compose down -v
```

## Licensed Instance Setup

1. Add license files to `df-podman` directory
2. Uncomment lines 14 and 51 in `Dockerfile`
3. Add License Key in `Dockerfile` line 51
4. Rebuild and restart:
```bash
./scripts/build-and-run.sh
```

## System Database Configuration

After initial setup, get your APP_KEY:
```bash
podman-compose exec web cat .env | grep APP_KEY
```

Add this value to `podman-compose.yml` APP_KEY field to persist configuration.

## Test Database Connection

PostgreSQL test database details:
- Port: 5432
- Database: dellstore
- Username: postgres
- Password: root_pw

Get container IP:
```bash
podman inspect <container-id> | grep "IPAddress"
```
