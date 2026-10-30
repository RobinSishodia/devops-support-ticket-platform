# Linux Server Health Report

My first DevOps mini-project: a Bash script that displays disk space,
memory usage, uptime, and workload information.

## Environment

Built and run on Ubuntu 24.04 LTS on AWS EC2.

## What the script reports

- Disk space using `df -h /`
- Memory usage using `free -h`
- Uptime and load averages using `uptime`

## Run the script

From the repository's main folder:

```bash
bash mini-projects/01-linux-healthcheck/healthcheck.sh
```

## Save a report

```bash
bash mini-projects/01-linux-healthcheck/healthcheck.sh > report.txt
```

This creates or replaces `report.txt`.

## What I practised

Linux navigation, creating and reading files, output redirection,
Bash scripting, and Git commits and pushes.

## Next improvements

Add report timestamps and automatic disk-space warnings.
