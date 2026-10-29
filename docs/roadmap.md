# Project roadmap

Only checkpoint 01 is complete. Each stage must have reproducible instructions and an observed result before being marked complete.

| Stage | Deliverable | Acceptance evidence | Status |
| --- | --- | --- | --- |
| 01 | Ubuntu EC2 and restricted browser SSH | User, directory, and OS verified | Complete |
| 02 | Linux workspace and Bash health check | Tool versions and script exit status recorded | Planned |
| 03 | Flask ticket application | Create and retrieve a test ticket | Planned |
| 04 | Persistent storage and backup | Restore test records into a clean database | Planned |
| 05 | Dedicated user, systemd, and Nginx | App survives reboot; proxy request verified | Planned |
| 06 | Docker and Compose | Fresh clone starts; data survives container replacement | Planned |
| 07 | CI/CD | Failed test blocks release; failed deployment rolls back | Planned |
| 08 | Terraform and Ansible | Environment recreated from code | Planned |
| 09 | Kubernetes and Helm | Pod recovery, controlled rollout, and scaling demonstrated | Planned |
| 10 | GitOps and delivery security | Reviewed change reconciled; insecure change blocked | Planned |
| 11 | Metrics, logs, traces, and incident response | Injected failure detected and diagnosed | Planned |
| 12 | Progressive delivery and disaster recovery | Faulty canary reverted; recovery measured | Planned |

Start with one application and add operational complexity only when the previous stage is understood.
