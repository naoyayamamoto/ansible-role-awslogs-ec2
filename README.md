# **Ansible Role: AWSLogsEC2**

[![Build Status](https://travis-ci.org/naoyayamamoto/ansible-role-awslogs-ec2.svg?branch=master)](https://travis-ci.org/naoyayamamoto/ansible-role-awslogs-ec2) [![Ansible Galaxy](https://img.shields.io/badge/ansible--galaxy-awslogs--ec2-blue.svg)](https://galaxy.ansible.com/naoyayamamoto/awslogs-ec2)

This role installs and configures the AWS CloudWatch Logs Agent.

## Requirements

This role only requires Ansible version 2.4+ and EC2_FACTS module.

## Role Variables

```yaml

awslogs_logs:
  - file:  /var/log/messages          # The path to the log file you want to ship (required)
    format: "%b %d %H:%M:%S"          # The date and time format of the log file
    time_zone: "LOCAL"                # Timezone, can either be LOCAL or UTC
    initial_position: "start_of_file" # Where log shipping should start from
    group_name: /var/log/messages     # The Cloudwatch Logs group name (required)
    stream_name: "{instance_id}"      # You can use a literal string and/or predefined variables ({instance_id}, {hostname}, {ip_address})
```

In addition, there are three variables that are not used by default:

```yaml
awslogs_region: eu-west-1            # Overrides the local region for log shipping
```

If your instance is behind an HTTP or HTTP proxy, you can configure it with the
following variables:

```yaml
awslogs_enable_proxy: true
awslogs_http_proxy: http://your.proxy:80/
awslogs_https_proxy: http://your.https.proxy:80/
awslogs_noproxy: 169.254.169.254
```

This configuration is further expanded on in the [Amazon Cloudwatch Logs Documentation](http://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AgentReference.html#d0e2872).

## Dependencies

None

## Example Playbook

```yaml
---

- hosts: all

  vars:
    awslogs_region: eu-west-1
    awslogs_logs:
    - file: /var/log/messages
      format: "%b %d %H:%M:%S"
      time_zone: "LOCAL"
      initial_position: "start_of_file"
      group_name: /var/log/messages
      stream_name: "{instance_id}"

  roles:
    - ansible-role-awslogs-ec2

```

## License

MIT / BSD
