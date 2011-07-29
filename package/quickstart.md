---
layout: default
title: quick start
---
# Quick Start build system

You want to spin out some fancy repoforge action yourself.  Test rebuilding spec files before asking for a pull request perhaps.  Here is a quick start guide with the possible commands you might run:

* Spin out a new RHEL/CentOS machine

> KVM is your friend if you don't have a spare physical box.

* Software development tools

>
>    yum groupinstall "Development Tools"
>    yum install git

* create a build user:  

>
>    newgrp mock
>    usermod -a G mock repoforge

* Get the Repoforge rpms repository

>
>    git clone ...

* setup mock

>
>    yum install createrepo pigz python-decoratortools mock

* use Repoforge mock configuration to build packages

>
>    sudo -u repoforge -i
>    rpmbuild -bs file.spec
>    mock -r <configfile> rebuild package-1.2-3.src.rpm


## Next Level

Next level for people serious about doing a good job:  test and build on RHEL4 RHEL5 and RHEL6 using Dag's [multidist-build howto](/package/multidist-system).
