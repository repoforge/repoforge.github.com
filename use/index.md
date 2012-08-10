---
title: Using RepoForge
layout: default
---

## Using RepoForge ## 

First download the appropriate package for your distribution:

* EL 6: [i686](http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.i686.rpm), [x86_64](http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm)
* EL 5: [i386](http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-2.el5.rf.i386.rpm), [x86_64](http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-2.el5.rf.x86_64.rpm), [ppc](http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.1-1.el5.rf.ppc.rpm)
* EL 4: [i386](http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-2.el4.rf.i386.rpm), [x86_64](http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-2.el4.rf.x86_64.rpm), [ppc](http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.1-1.el4.rf.ppc.rpm)
* EL 3: [i386](http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-2.el3.rf.i386.rpm), [x86_64](http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.2-2.el3.rf.x86_64.rpm)

Then you can use `rpm` to install the downloaded package.  The package installation will enable the RepoForge repo for subsequent use via `yum`.

More detailed instructions and recommendations are available on the [CentOS wiki](http://wiki.centos.org/AdditionalResources/Repositories/RPMForge).

Hints:
* Use `cat /etc/redhat-release` to find which release of EL you are using.
* Use `uname -a` to find your processor architecture. 
* You can use `wget` or `curl` to download the package using one of the above links if needed (for example on a server with no Xwindow)
* Use `rpm -Uvh package-filename` to install the rpmforge-release package.
* Then you can use `yum` to install packages from the RepoForge repo
* Afterward, you can disable accidental updates from the repo by setting `enabled = 0` in the repo definition file in `/etc/yum.repos.d/`
