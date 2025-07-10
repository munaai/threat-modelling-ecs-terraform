# Threat modelling tool
This project deploys a containerised application to **AWS ECS Fargate** using **Terraform**, with end-to-end automation via **GitHub Actions**.

##  Architechture diagram

<p align="center">
  <img src="threatapp1.jpg" alt="architechtural diagram" style="width:600px"/>
</p>

## Features

Fully automated infrastructure using Terraform
Docker container pushed to Amazon ECR
ECS Fargate service behind an ALB with HTTPS
SSL certificate issued via ACM and validated through Route 53
GitHub Actions workflows for:
Docker image build & push
Terraform plan, apply, and destroy

## Project Structure
<pre>
./
├── app/
├── Dockerfile
├── terraform/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   └── modules/
│       ├── acm/
│       ├── alb/
│       ├── ecs_fargate/
│       ├── iam/
│       ├── route53/
│       ├── security_groups/
│       └── vpc/
└── .github/
    └── workflows/
        ├── apply.yml
        ├── destroy.yml
        ├── docker.yml
        └── plan.yml

</pre>

## Local App Setup 💻
### Option 1: Run Locally Without Docker
<pre>
yarn install
yarn build
yarn global add serve
serve -s build
</pre>

Then visit: http://localhost:3000

### Option 2: Run Using Docker
<pre>
docker build -t my-app .
docker run -p 3000:3000 my-app
</pre>

