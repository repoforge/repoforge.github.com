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
>    useradd -a G mock repoforge

* Get the Repoforge rpms repository

>
>    git clone ...

* setup mock

>
>    yum install mock

* use Repoforge mock configuration to build packages

>
>    sudo -u repoforge -i

* setup a build environment

>    mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
>    mkdir -p ~/rpmbuild/RPMS/{i386,i486,i586,i686,noarch,athlon}

* build an rpm for your platform

>    rpmbuild -bs file.spec
>    mock -r <configfile> rebuild package-1.2-3.src.rpm
	
* to build an rpm for an older platform (EL5 package on an EL6 machine):

>    edit /usr/sbin/rpmbuild-old

* paste the following contents

>    #!/bin/bash
>    
>    rpmbuild \
>        --define "_source_filedigest_algorithm 1" \
>        --define "_binary_filedigest_algorithm 1" \
>        --define "_binary_payload w9.gzdio" \
>        --define="dist .el5" \
>        --define="el5 1" \
>        $*

* make the file executable

>    chmod +x /usr/sbin/rpmbuild-old

* now build for el5

>    /usr/sbin/rpmbuild-old -bs file.spec

## Next Level

Next level for people serious about doing a good job:  test and build on RHEL4 RHEL5 and RHEL6 using Dag's [multidist-build howto](/package/multidist-system).
