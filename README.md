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
│  ├── provider.tf
│  ├── main.tf
│  ├── provider.tf
│  ├── variables.tf
│  └── modules/
│      ├── alb/
       ├── acm/
│      ├── ecs_fargate/
│      ├── iam/
       ├── security_groups/
       ├── vpc/
       └── route53/
└── .github/
   └── workflows/
       ├── docker.yml
       ├── plan.yml
       ├── apply.yml
       └── destroy.yml