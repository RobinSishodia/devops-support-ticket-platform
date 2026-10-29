# Session 01 — Ubuntu on AWS EC2

Date: 30 October 2026 (IST).

## Goal

Launch a Linux learning server, connect through the browser, and verify the actual environment.

## Configuration

| Item | Value |
| --- | --- |
| Name | devops-project-01 |
| Region | ap-south-1 (Mumbai) |
| Image | Canonical Ubuntu Server 24.04 LTS, x86_64 |
| Compute | One t2.micro |
| Root disk | 8 GiB gp3 |
| Network | Default VPC, public subnet, assigned public IPv4 |
| Persistent key pair | None |
| Inbound rule | SSH / TCP 22 / regional EC2 Instance Connect managed prefix list |

## Procedure

1. Select the image, instance type, disk, and network in the EC2 launch wizard.
2. Create a lab security group with TCP 22 sourced from `com.amazonaws.ap-south-1.ec2-instance-connect`.
3. Launch one instance.
4. Open Connect, choose public subnet access with EC2 Instance Connect, and use username `ubuntu`.
5. Verify the shell with the commands below.

```bash
whoami
pwd
cat /etc/os-release
```

## Observed results

```text
whoami → ubuntu
pwd → /home/ubuntu
PRETTY_NAME="Ubuntu 24.04.5 LTS"
VERSION_ID="24.04"
```

The connection succeeded. Live IP addresses, instance IDs, account IDs, and VPC IDs are intentionally absent from this public record.

## Concepts

- An AMI provides the initial operating system image.
- An instance type determines virtual compute resources.
- EBS supplies persistent block storage.
- A security group restricts network traffic; it does not replace authentication.
- Browser EC2 Instance Connect traffic comes from the AWS service, not directly from the laptop's public IP.
- `whoami` identifies the current user, `pwd` prints the directory, and `cat` reads the release file.

## Boundaries

No Flask application, Nginx service, database, or backup system has been deployed. The package installation and health-check exercise are the next checkpoint.

## Reconnect and cleanup

Use EC2 → Instances → devops-project-01 → Connect → EC2 Instance Connect. Save work and stop the instance when the session is over. Restarting may change its automatically assigned public IPv4 address.

Reference: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-connect-prerequisites.html
