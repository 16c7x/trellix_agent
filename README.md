# trellix_agent

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with trellix_agent](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with trellix_agent](#beginning-with-trellix_agent)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)

## Description

The module installs and configures the Trellix agent on Linux systems.

## Setup

### Setup Requirements **OPTIONAL**

Trellix is installed from a script which is generated via the Trellix dashboard, the installation script must be added to the files directory of this module.

If you have multiple installation scripts this will to specified via the ```agent_install_script``` parameter.

### Beginning with trellix_agent

If only one installation script is needed then begin with;

```
include trellix_agent
```

To specify the install script:

```
class { 'trellix_agent':
  agent_install_script  => 'puppet:///modules/trellix_agent/<script name>',          
}
```

## Limitations

This module will only work on Linux systems.
