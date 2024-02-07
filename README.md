## Provisioned AWS infrastructure from scratch:

```
1.Created custom VPC.
2.Created custom subnet.
3.Connecting VPC to internet using Internet Gateway.
4.Inside the subnet I have deployed EC2 instance.
5.Created Security Group (Firewall) to access the nginx server running on the EC2 from the browser and also from SSH.
6.EC2 instance running a docker container where I have deployed nginx web server.
```