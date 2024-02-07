## Provisioned AWS infrastructure from scratch:

```
Created custom VPC.
Created custom subnet.
Connecting VPC to internet using Internet Gateway.
Inside the subnet I have deployed EC2 instance.
Created Security Group (Firewall) to access the nginx server running on the EC2 from the browser and also from SSH.
EC2 instance running a docker container where I have deployed nginx web server.
```