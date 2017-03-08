# vyos-aws-vpn
Cross region AWS VPN using VyOS

Welcome, this is Solution for corss region VPC peering in AWS. AWS officially doesn't support cross region VPC peering,
We will enable this peering using a VyOS router in one region and in other regions all we have to is launch a Customer gateway, Virtual Private Gateway and then create VPN connection from other regions to VyOS router.

For Example, Lets say we have two regions us-west-1 and us-west-2. In this example, we will launch an VyOS instance in us-west-1 region and Customer Gateway, Virtual Private Gateway and VPN connection on us-west-1 region. But first thing first, we need to do some homework.

  a. Launch a VPC in both regions 
  b. VPC in which we will launch VyOS instance should have atleast one public subnet.(we need VyOS instance to have public          internet access)
  c. 


