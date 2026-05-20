# 🚀 Dockerized Flask REST API (AWS DevOps Capstone)

<p align="center">
  <img src="https://img.shields.io/badge/DevOps-AWS-orange?style=for-the-badge&logo=amazon-aws" />
  <img src="https://img.shields.io/badge/Docker-Compose-blue?style=for-the-badge&logo=docker" />
  <img src="https://img.shields.io/badge/Python-Flask-green?style=for-the-badge&logo=python" />
  <img src="https://img.shields.io/badge/CI/CD-GitHub_Actions-black?style=for-the-badge&logo=githubactions" />
</p>

<p align="center">
  <b>Multi-container REST API deployed using Docker, AWS EC2, MySQL & Redis</b>
</p>
PROJECT NAME:
Dockerized Python Flask REST API with MySQL and Redis using Docker Compose

--------------------------------------------
DESCRIPTION:
--------------------------------------------
This project is a containerized REST API built using Python Flask.
It is deployed using Docker and Docker Compose with multiple services:

- Flask Application (2 instances)
- MySQL Database
- Redis Cache

The system demonstrates microservice architecture using containers,
with proper service communication, environment variables, and restart policies.

--------------------------------------------
ARCHITECTURE:
--------------------------------------------
Services:
1. Flask App 1 (Load balanced container)
2. Flask App 2 (Load balanced container)
3. MySQL Database (Persistent storage)
4. Redis Cache (In-memory cache)

Communication:
- Flask apps connect to MySQL using DATABASE_URI
- Flask apps connect to Redis using REDIS_HOST and REDIS_PORT

--------------------------------------------
TECHNOLOGIES USED:
--------------------------------------------
- Python (Flask)
- Docker
- Docker Compose
- MySQL
- Redis

--------------------------------------------
FEATURES:
--------------------------------------------
1. REST API built using Flask
2. Palindrome check endpoint with DB storage
3. Redis caching test endpoint
4. Health check endpoint (/status)
5. Multi-container architecture
6. Auto-restart using Docker policies
7. Environment-based configuration

--------------------------------------------
DOCKER SERVICES:
--------------------------------------------

Flask App:
- Built using Dockerfile
- Runs on port 5000
- Two replicas (app1, app2)

MySQL:
- Official MySQL 8 image
- Database: palindrome_db
- Persistent volume enabled

Redis:
- Official Redis image
- Used for caching and hit counter

--------------------------------------------
HOW TO RUN THE PROJECT:
--------------------------------------------

Step 1: Build containers
docker compose build

Step 2: Start services
docker compose up -d

Step 3: Initialize database
docker exec -it flask_app_1 python create_db.py

--------------------------------------------
API ENDPOINTS:
--------------------------------------------

1. GET /
   → Returns: Hello World

2. GET /status
   → Returns: 200 OK if service is ready

3. GET /palindrom/<text>
   → Checks palindrome
   → Stores valid palindrome in database

4. GET /redis-hits
   → Tests Redis connection and increments counter

5. GET /prepare-for-deploy
   → Prepares application for deployment

6. GET /ready-for-deployment
   → Confirms readiness for deployment

7. GET /admin
   → Admin endpoint

--------------------------------------------
TESTING STEPS:
--------------------------------------------

1. Open browser:
   http://<EC2_PUBLIC_IP>:5000/

2. Test health:
   http://<EC2_PUBLIC_IP>:5000/status

3. Test palindrome:
   http://<EC2_PUBLIC_IP>:5000/palindrom/madam

4. Test Redis:
   http://<EC2_PUBLIC_IP>:5000/redis-hits

--------------------------------------------
RESTART POLICY:
--------------------------------------------

All containers use:
restart: unless-stopped

This ensures:
- Auto restart on failure
- Auto restart after system reboot

--------------------------------------------
STOP PROJECT:
--------------------------------------------

docker compose down

--------------------------------------------
REBUILD PROJECT:
--------------------------------------------

docker compose up --build -d

--------------------------------------------
KNOWN ISSUES / NOTES:
--------------------------------------------

- First MySQL startup may take 20–40 seconds
- If /status shows "Not ready", wait and retry
- Ensure ports 5000, 3306, 6379 are open in security group

--------------------------------------------
AUTHOR:
--------------------------------------------
Docker Capstone Project - Afnitha
