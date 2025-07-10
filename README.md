# Threat modelling tool

##  Architechture diagram

<p align="center">
  <img src="threatapp1.jpg" alt="architechtural diagram" style="width:600px"/>
</p>

## Project Structure
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
