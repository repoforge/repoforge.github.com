---
layout: default
title: Manual Rebuild
---
[Contribute](index.html) | [BuildSystem](quickstart.html) | [Rebuilding](rebuild.html)  

## Manually rebuilding a package from RepoForge ##

So, maybe you have requested that a package be added to RepoForge, and a maintainer has written back to you something like "I've committed your package; it'll be available once it's rebuilt." You may be thinking "But... How long will that take? I need this now!"

Alternately, perhaps like [this guy](http://comments.gmane.org/gmane.linux.centos.general/96029) you have discovered that shared libraries have changed under your feet, and a package no longer works, and people say things like "just rebuild it".

One workaround for situations like these is to manually rebuild the package:

### Set up your environment ###

First, make sure your system is configured to pull packages from RepoForge. If you have not already done so, install the latest rpmforge-release package for your distribution and architecture.

Next, make sure you have development tools installed. The most straightforward way to do this is the following command:

    $ sudo yum groupinstall "Development Tools"

In addition, you will want the following packages:

    $ sudo yum install rpm-build rpm-macros-rpmforge spectool yum-utils

Finally, set up your environment such that you can build RPMs as a non-root user. Russ Herrold has written [a detailed guide](http://www.owlriver.com/tips/non-root/); the parts relevant to this step are parts 2, 3, and 4. For the rest of this document, I will assume that you have set up your build directories as directed by Russ.

### Download the package to be rebuilt ###

Determine whether this package is a brand new, never-before-built package (as in the first example at the top of the page) or whether you are rebuilding an existing package (as in the second example). If you are rebuilding an existing package, the process is easier, since you will have access to an SRPM; if you are rebuilding a brand new package, all you will have is the specfile.

### Rebuilding a SRPM ###

Browse to http://packages.sw.be/ and download the SRPM for the desired package version. SRPMs are packages with names ending in .src.rpm.

Once you have downloaded the SRPM, make sure you have all the necessary dependencies to build it:

    $ sudo yum-builddep <package>.src.rpm 

This process can take some time; if you find that there are dependencies that cannot be met, you may have to manually rebuild those packages as well.

Once you have the SRPM and all its dependencies installed, run the following command:

    $ rpmbuild --rebuild <package>.src.rpm 

You will see a lot of output; if the process completes successfully, you will see that among the last of the status messages are lines telling you where rpmbuild has put your newly build RPMs. Here is an example from a build of the rabbitvcs package:

    ...
    Checking for unpackaged file(s): /usr/lib/rpm/check-files /tmp/rpmbuild/rabbitvcs-0.13.3-1.el5-root
    Wrote: /home/shuff/rpmbuild/SRPMS/rabbitvcs-0.13.3-1.el5.src.rpm
    Wrote: /home/shuff/rpmbuild/RPMS/i386/rabbitvcs-0.13.3-1.el5.i386.rpm
    Wrote: /home/shuff/rpmbuild/RPMS/i386/rabbitvcs-nautilus-0.13.3-1.el5.i386.rpm
    Wrote: /home/shuff/rpmbuild/RPMS/i386/rabbitvcs-gedit-0.13.3-1.el5.i386.rpm
    Wrote: /home/shuff/rpmbuild/RPMS/i386/rabbitvcs-debuginfo-0.13.3-1.el5.i386.rpm
    Executing(%clean): /bin/sh -e /tmp/rpmbuild/rpm-tmp.40244
    + umask 022
    + cd /home/shuff/rpmbuild/BUILD
    + cd rabbitvcs-0.13.3
    + /bin/rm -rf /tmp/rpmbuild/rabbitvcs-0.13.3-1.el5-root
    + exit 0

As you can see, the successful conclusion of this process has dumped a new SRPM and several binary RPMs into the appropriate places in my build tree. At this point, you are all set; just install the newly built RPM.

### Rebuilding from a specfile ###

If there is no SRPM available, you will need to find the specfile for the package. To do this, browse the RepoForge repository, e.g.

    https://github.com/repoforge/rpms/blob/master/specs/<package name>/ 

Download the specfile (.spec) and any included patch files, and put them in the SOURCES directory inside your RPM build tree.

Next, download the source tarball for the package, as follows:

    $ cd ~/rpmbuild/SOURCES
    $ spectool -g -R <package name>.spec

You should see one or more source tarballs being downloaded.

Finally, try to build the package from the specfile:

    $ rpmbuild -ba <package name>.spec 

If rpm complains about unmet dependencies, use yum to install them; unfortunately, you cannot use yum-builddep to automate the process when building from a specfile.

From here on, the process is the same as when rebuilding a SRPM. 
