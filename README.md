## \# Docker Flask REST API

## 

## A simple Flask REST API that I containerized and deployed on AWS EC2 as a hands-on Cloud/DevOps project.

## 

## The main goal of this project was to practice the complete flow from writing an application to building, testing, and deploying it using Docker and GitHub Actions.

## 

## \## What I used

## 

## \* Python / Flask

## \* Docker

## \* Docker Compose

## \* MySQL

## \* Redis

## \* AWS EC2

## \* GitHub Actions

## \* Docker Hub

## \* Terraform

## \* Pytest

## \* Prometheus

## \* Grafana

## 

## \## Project Setup

## 

## The application runs in Docker containers along with MySQL and Redis.

## 

## ```text

## &#x20;               GitHub

## &#x20;                  |

## &#x20;                  v

## &#x20;           GitHub Actions

## &#x20;            /           \\

## &#x20;       Run Tests      Docker Build

## &#x20;                         |

## &#x20;                         v

## &#x20;                    Docker Hub

## &#x20;                         |

## &#x20;                         v

## &#x20;                      AWS EC2

## &#x20;                         |

## &#x20;                   Docker Compose

## &#x20;                   /      |      \\

## &#x20;                  /       |       \\

## &#x20;             Flask      MySQL    Redis

## ```

## 

## \## CI/CD

## 

## I created a GitHub Actions workflow that runs when changes are pushed to the `main` branch.

## 

## The workflow:

## 

## 1\. Checks out the code

## 2\. Sets up Python

## 3\. Installs dependencies

## 4\. Builds the Docker image

## 5\. Runs the tests inside the Docker container

## 6\. Pushes the image to Docker Hub

## 7\. Deploys the application to EC2

## 

## This helped me understand how CI/CD works in a real project instead of deploying everything manually.

## 

## \## Docker

## 

## The Flask application is packaged using a Dockerfile based on Python 3.11.

## 

## Docker Compose is used to run the application and its dependencies.

## 

## The main containers are:

## 

## \* Flask application

## \* MySQL

## \* Redis

## 

## The Flask application is available on port `5000`.

## 

## \## Testing

## 

## I added pytest tests and also run them as part of the GitHub Actions pipeline.

## 

## The tests are executed inside the Docker image to make sure the containerized application works correctly.

## 

## \## AWS EC2

## 

## The application is deployed to an Ubuntu EC2 instance.

## 

## After deployment, I verified the application directly on the server:

## 

## ```bash

## curl http://localhost:5000

## ```

## 

## Response:

## 

## ```text

## Hello, World!

## ```

## 

## \## Terraform

## 

## I also added Terraform configuration for the AWS infrastructure.

## 

## The Terraform configuration is used to define resources such as:

## 

## \* EC2 instance

## \* Security group

## \* AWS provider configuration

## 

## This gave me practical experience with Infrastructure as Code.

## 

## \## Monitoring

## 

## I added Prometheus and Grafana configuration to the project for monitoring.

## 

## The monitoring setup also includes:

## 

## \* Prometheus

## \* Grafana

## \* cAdvisor

## \* Node Exporter

## 

## I used Grafana dashboards to monitor system and container metrics such as CPU and memory usage.

## 

## \## Security

## 

## I keep database credentials and other environment-specific values outside the Git repository.

## 

## The project uses:

## 

## ```text

## .env

## .env.example

## .gitignore

## ```

## 

## The real `.env` file is ignored by Git, while `.env.example` shows the required variables without exposing real credentials.

## 

## GitHub Actions credentials are stored using GitHub Secrets.

## 

## \## Project Structure

## 

## ```text

## docker-flask-rest-api/

## │

## ├── app.py

## ├── Dockerfile

## ├── docker-compose.yml

## ├── requirements.txt

## ├── .env.example

## ├── .gitignore

## ├── README.md

## │

## ├── tests/

## │   └── test\_app.py

## │

## ├── .github/

## │   └── workflows/

## │       ├── ci.yml

## │       └── deploy.yml

## │

## └── terraform/

## &#x20;   ├── main.tf

## &#x20;   └── .terraform.lock.hcl

## ```

## 

## \## Running Locally

## 

## Clone the repository:

## 

## ```bash

## git clone https://github.com/afnithaaa-bit/docker-flask-rest-api.git

## cd docker-flask-rest-api

## ```

## 

## Create your `.env` file using `.env.example` as a reference.

## 

## Then start the application:

## 

## ```bash

## docker compose up -d --build

## ```

## 

## Test it:

## 

## ```bash

## curl http://localhost:5000

## ```

## 

## To stop the containers:

## 

## ```bash

## docker compose down

## ```

## 

## \## What I Learned

## 

## While building this project, I worked with:

## 

## \* Dockerizing a Flask application

## \* Docker Compose

## \* Git and GitHub

## \* GitHub Actions CI/CD

## \* Docker Hub

## \* AWS EC2

## \* Terraform

## \* MySQL and Redis

## \* Automated testing

## \* Prometheus and Grafana

## \* Environment variables and secrets

## \* Deploying and troubleshooting containers on Linux

## 

## This project helped me understand how these tools fit together in a complete DevOps workflow.



