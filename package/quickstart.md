---
layout: default
title: quick start
---

# Quick Start build system

You want to spin out some fancy RepoForge action yourself. Test rebuilding SPEC files before asking for a pull request perhaps. Here is a quick start guide with the possible commands you might run:

* Spin out a new RHEL/CentOS machine

> KVM is your friend if you don't have a spare physical box.

* Software development tools

        yum groupinstall "Development Tools"
        yum install git

* Setup mock (available at RepoForge) and use RepoForge mock configuration to build packages

        yum install mock

* Create a build user

        useradd -a G mock repoforge
        sudo -u repoforge -i

* Checkout the RepoForge RPMs repository (or make & checkout your own fork if you are expecting to submit your patches back to us, which you really ought to, of course!)

        git clone git://github.com/repoforge/rpms.git

* Setup a build environment

        mkdir -p ~/rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
        mkdir -p ~/rpmbuild/RPMS/{i386,i486,i586,i686,noarch,athlon}

* Build an RPM for your platform

        rpmbuild -bs file.spec
        mock -r <configfile> rebuild package-1.2-3.src.rpm
	
* To build an RPM for an older platform (EL5 package on an EL6 machine):

        mkdir ~/bin
        vi ~/bin/rpmbuild-old

* Paste the following contents

        #!/bin/bash

        rpmbuild \
            --define "_source_filedigest_algorithm 1" \
            --define "_binary_filedigest_algorithm 1" \
            --define "_binary_payload w9.gzdio" \
            --define="dist .el5" \
            --define="el5 1" \
            $*

* Make the file executable

        chmod +x ~/bin/rpmbuild-old

* Now build for EL5

        rpmbuild-old -bs file.spec

For people serious about doing a good job: build and test at least on RHEL4, RHEL5 and RHEL6 by specifying correct config files to mock builder!
