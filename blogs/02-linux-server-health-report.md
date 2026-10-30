# My First DevOps Mini-Project: A Linux Server Health Report on AWS

I’m learning DevOps through small projects where I can understand each command, run it myself, troubleshoot mistakes, and keep the work on GitHub.

For my first mini-project, I built a Bash script on an Ubuntu EC2 instance. It produces a report containing a UTC timestamp, disk usage, memory usage, uptime, and load averages.

The script is small, but it gave me hands-on practice with Linux, Bash, Git, and documentation.

[View the project and README on GitHub](https://github.com/RobinSishodia/devops-support-ticket-platform/tree/main/mini-projects/01-linux-healthcheck).

## The problem I wanted to solve

Checking a server manually meant running several commands separately. I wanted one command that would collect the basic information into a readable report.

This version gathers information when I run it. Threshold warnings, scheduled execution, and notifications are possible future improvements.

## My environment

- AWS EC2 instance in the Mumbai region
- Ubuntu 24.04 LTS
- Bash
- Git and GitHub

I used a practice folder first, then copied the script into my cloned Git repository:

```text
mini-projects/01-linux-healthcheck/healthcheck.sh
mini-projects/01-linux-healthcheck/README.md
```

The commands below use paths relative to the repository’s main folder.

## Learning the commands before scripting them

Before combining anything, I ran the commands individually and examined their output.

### Disk space: df -h /

```bash
df -h /
```

The `df` command reports filesystem space usage. The `-h` option displays sizes in human-readable units. The `/` argument selects the filesystem containing the root directory.

In one of my reports, the root filesystem showed about 6.8 GB total space, 2.4 GB used, and 35% usage.

The distinction matters: this command checks the root filesystem, rather than listing every mounted filesystem.

### Memory: free -h

```bash
free -h
```

This displays RAM and swap information in human-readable units.

One lesson was that **free memory and available memory mean different things**. Linux uses RAM for buffers and cache. Some of that memory can be reclaimed, so the available column is more useful than the free column alone when estimating how much memory applications could use.

My report showed around 952 MiB of total RAM and no configured swap.

### Uptime and load: uptime

```bash
uptime
```

This displays the current time, how long the server has been running, the number of logged-in users, and three load averages.

Those averages cover approximately the last 1, 5, and 15 minutes. They are not CPU usage percentages. Linux load includes runnable tasks and tasks in uninterruptible sleep, often while waiting for I/O. CPU count and other measurements help put the numbers in context.

### Report time: date -u

```bash
date -u
```

A saved report needs a timestamp so I can tell when the information was collected.

The `-u` option displays the time in UTC. Using a common time standard helps when comparing logs from different systems.

## The Bash script

Here is the version I built and pushed to GitHub:

```bash
#!/bin/bash

echo "=== SERVER HEALTH REPORT ==="
echo "Generated at:"
date -u
echo "Disk space:"
df -h /

echo
echo "Memory:"
free -h

echo
echo "Uptime and workload:"
uptime
```

The first line, `#!/bin/bash`, identifies Bash as the interpreter for direct execution of the file. In this project, I explicitly invoked Bash when running it.

The script executes commands in order. The `echo` commands print headings, and an `echo` without text adds a blank line.

## Running the report

From the repository’s main folder:

```bash
bash mini-projects/01-linux-healthcheck/healthcheck.sh
```

This prints the report in the terminal.

To save its standard output to a file:

```bash
bash mini-projects/01-linux-healthcheck/healthcheck.sh > report.txt
```

Then I can read the saved report:

```bash
cat report.txt
```

I learned an important difference between two shell operators:

| Operator | Effect |
| --- | --- |
| `>` | Creates a file or replaces its existing contents |
| `>>` | Creates a file or appends to its existing contents |

With `>`, running the report again replaces the previous saved report. The timestamp helps identify the new report’s generation time.

## Tracking the work with Git

I committed the first script, added a README, and later made a separate commit for the timestamp improvement.

Before committing changes, I reviewed them:

```bash
git --no-pager diff -- mini-projects/01-linux-healthcheck/
```

This shows unstaged changes to tracked files in that folder. Green additions and red removals helped me check what I had edited.

After reviewing, I staged the script and documentation:

```bash
git add mini-projects/01-linux-healthcheck/healthcheck.sh mini-projects/01-linux-healthcheck/README.md
```

Then I committed and pushed:

```bash
git commit -m "Add UTC timestamp to server health report"
git push origin main
```

Finally, I checked:

```bash
git status
```

After the successful push, Git reported that my branch was up to date with `origin/main` and my working tree was clean.

My understanding is now:

- **git add** selects changes for the next commit.
- **git commit** records the staged changes in the local repository.
- **git push** sends local commits to the remote repository.

Here, “local” means my EC2 server, because that is where I cloned the repository.

## Mistakes that helped me learn

### Using the wrong filename

I initially tried running the script with an incomplete filename and received a “No such file or directory” error.

Using the correct filename, `healthcheck.sh`, fixed it. This reinforced the importance of checking filenames and paths.

### GitHub authentication failed

My first HTTPS push failed during authentication. I installed GitHub CLI and completed its browser-based authentication flow. A later push succeeded.

This also taught me that Git author details and authentication serve different purposes: the name and email label commits, while authentication establishes permission to access the remote repository.

### Typing terminal output as a command

I accidentally typed Git’s branch-update output into the shell. The `>` character acted as output redirection and created an unintended empty file.

I inspected the file before removing it. The lesson: terminal output is information to read, and shell symbols can have effects when typed as input.

### Keeping the README accurate

After adding the timestamp, I updated the README and removed timestamps from the list of future improvements.

Documentation needs to reflect the current code.

## What I can build next

The next improvements I want to explore are disk-space thresholds, warning messages, and scheduled reports.

For now, I have a working report script, a README explaining how to run it, and a Git history showing the changes. I can explain what each command does and why it is there.

*Learning note: I used AI assistance for explanations, troubleshooting, and drafting this article. I ran the commands and checked the results on my EC2 instance.*
