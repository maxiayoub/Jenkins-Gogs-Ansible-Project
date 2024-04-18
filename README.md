---

# Jenkins-Gogs-Ansible-Project

## Overview

This project aims to automate the setup of a CI/CD pipeline using Jenkins, Gogs, and Ansible for provisioning, user management, and deployment automation.

## Features

- Provisioning of three CentOS VMs using VMware Workstation.
- User management on VM3 with Bash scripts.
- Integration of Gogs with Jenkins for automated builds.
- Creation of a Git repository on Gogs.
- Automation of Nginx installation using Ansible.
- Email notification upon pipeline execution.
- Flexibility in email notification configuration (Bash, Ansible, Jenkins).

## Prerequisites

- VMware Workstation installed on your system.
- CentOS VMs provisioned for Jenkins, Gogs, and services/user management.
- Gogs server set up and configured.
- Jenkins installed and configured to monitor Gogs repository.
- Ansible installed on the Jenkins server.
- Access to SMTP server for email notifications.

## Installation and Setup

1. Provision CentOS VMs using VMware Workstation.
2. Configure user management on VM3 using provided Bash scripts.
3. Integrate Gogs with Jenkins and configure Jenkins job.
4. Create a Git repository on Gogs and add necessary files.
5. Configure Nginx installation automation using Ansible playbook.
6. Set up email notification in Jenkins pipeline.

## Usage

1. Push changes to the Gogs repository to trigger Jenkins builds.
2. Monitor Jenkins dashboard for build status and email notifications.

## Directory Structure

```

├── ansible.cfg
├── Email_Bash.sh
├── EmailNotify.yml
├── GroupMembers.sh
├── InstallNginx.yml
├── inventories
│   └── hosts
├── Jenkinsfile
├── README.md
└── roles
    ├── email
    │   └── tasks
    │       └── main.yml
    └── nginx
        └── tasks
            └── main.yml

```

## Contributors

- Maximous ElKess Ayoub 
	GitHub: ( https://github.com/maxiayoub )
	LinkedIn: Maximous ELKess Ayoub


