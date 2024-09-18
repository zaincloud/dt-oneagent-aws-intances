# Project: Automating EC2 Instance Creation and Dynatrace OneAgent Installation

## Overview
This project automates the creation of multiple EC2 instances using Terraform and installs Dynatrace OneAgent on them using Ansible. The process involves running a Terraform script to provision the instances and then using Ansible playbooks to configure and install the necessary software.

## Prerequisites
- Terraform installed on your local machine.
- Ansible installed on your local machine.
- AWS credentials with the necessary permissions.
- Dynatrace API token and environment ID.

## Project Structure
```
project/
├── project.yml
├── roles/
│   ├── terraform_script/
│   │   ├── tasks/
│   │   │   └── main.yml
│   │   ├── files/
│   │   │   ├── main.tf
│   │   │   └── variables.tf
│   ├── add_ip_host/
│   │   ├── tasks/
│   │   │   └── main.yml
│   │   ├── vars/
│   │   │   └── main.yml
│   ├── dt-oneagent/
│   │   ├── tasks/
│   │   │   └── main.yml
│   │   ├── vars/
│   │   │   └── main.yml
```

## Files and Their Purpose

### project.yml
Defines the Ansible playbook structure to run the Terraform script, add instance IPs to the inventory, and install Dynatrace OneAgent.

```yaml
---

- name: Run Terraform Script
  hosts: localhost
  roles:
      - terraform_script
       
- name: Adding IP to Host
  hosts: localhost
  gather_facts: false
  roles:
      - add_ip_host

- name: Install Dynatrace OneAgent on EC2 instances
  hosts: ec2_instances
  roles:
      - dt-oneagent
```

### roles/terraform_script/tasks/main.yml
Tasks to install Terraform, create necessary directories, copy Terraform scripts, initialize, and apply the Terraform configuration.


### roles/terraform_script/files/main.tf
Terraform configuration to create EC2 instances.



### roles/terraform_script/files/variables.tf
Defines the variables used in the Terraform configuration.

### roles/add_ip_host/tasks/main.yml
Tasks to load instance IPs from the Terraform state file and add them to the Ansible inventory.



### roles/add_ip_host/vars/main.yml
Defines the location of the Terraform state file.


### roles/dt-oneagent/tasks/main.yml
Tasks to download and install Dynatrace OneAgent on the EC2 instances.



### roles/dt-oneagent/vars/main.yml
Defines the Dynatrace API token and environment ID.



## How to Run

1. **Clone the repository:**
   ```sh
   git clone <repository_url>
   cd <repository_directory>
   ```

2. **Update the variables:**
   - Update the `roles/terraform_script/files/variables.tf` with your AWS credentials and desired configuration.
   - Update the `roles/dt-oneagent/vars/main.yml` with your Dynatrace API token and environment ID.

3. **Run the Ansible playbook:**
   ```sh
   ansible-playbook project.yml
   ```
