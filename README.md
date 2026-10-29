# DevOps Support-Ticket Platform

A project-driven DevOps learning repository by Robin Sishodia. One support-ticket application will evolve from Linux hosting on AWS EC2 to automated delivery, Kubernetes, observability, and recovery.

**Current status:** the Ubuntu server is launched and browser SSH access is verified. Application development and deployment have not started.

## Completed checkpoint

- Ubuntu Server 24.04 LTS on one t2.micro in Mumbai (`ap-south-1`).
- An 8 GiB gp3 root disk, default VPC, public subnet, and public IPv4.
- SSH restricted to the AWS-managed regional EC2 Instance Connect prefix list.
- Browser login as `ubuntu`; verified `/home/ubuntu` and Ubuntu 24.04.5 LTS.

## Read the project

- [Session 01: launch and verify Ubuntu](docs/01-ec2-ubuntu.md)
- [Roadmap and acceptance criteria](docs/roadmap.md)
- [How each checkpoint is documented and published](docs/publishing-workflow.md)
- [Articles and publication links](blogs/README.md)

## Learning workflow

Understand the change → implement it → inspect the result → troubleshoot → commit the evidence → publish the explanation.

Commit only working code and accurate notes. Mark planned work as planned. Keep local configuration, credentials, live resource identifiers, and unredacted console screenshots out of public commits.

## Next checkpoint

Refresh Ubuntu package metadata, install Git/Python/curl, create the project workspace, and write a Bash environment check.

## Cost and cleanup

This is an AWS lab and can incur compute, storage, IPv4, and other usage charges. Check your own account's plan and credits. Save work and stop the instance between sessions when it is not needed; retained disks and other resources may remain billable. Terminate resources only after preserving the work and checking what will be deleted.

## Author

[GitHub](https://github.com/RobinSishodia) · [Hashnode](https://sishodiarobin.hashnode.dev) · [Portfolio](https://robinsishodia.github.io/)
