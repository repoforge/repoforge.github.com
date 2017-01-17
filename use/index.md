---
title: Using RepoForge
layout: default
---

## Using RepoForge ##

First download the appropriate `rpmforge-release` package for your distribution:

* EL 7: [x86_64](http://repository.it4i.cz/mirrors/repoforge/redhat/el7/en/x86_64/rpmforge/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm)
* EL 6: [i686](http://repository.it4i.cz/mirrors/repoforge/redhat/el6/en/i386/rpmforge/RPMS/rpmforge-release-0.5.3-1.el6.rf.i686.rpm), [x86_64](http://repository.it4i.cz/mirrors/repoforge/redhat/el6/en/x86_64/rpmforge/RPMS/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm)
* EL 5: [i386](http://repository.it4i.cz/mirrors/repoforge/redhat/el5/en/i386/rpmforge/RPMS/rpmforge-release-0.5.3-1.el5.rf.i386.rpm), [x86_64](http://repository.it4i.cz/mirrors/repoforge/redhat/el5/en/x86_64/rpmforge/RPMS/rpmforge-release-0.5.3-1.el5.rf.x86_64.rpm), [ppc](http://repository.it4i.cz/mirrors/repoforge/redhat/el5/en/ppc/rpmforge/RPMS/rpmforge-release-0.5.1-1.el5.rf.ppc.rpm)

Then you can use `rpm` or `yum` to install the downloaded package. The package installation will enable the RepoForge repo for subsequent use via `yum`.

More detailed instructions and recommendations are available on the [CentOS wiki](http://wiki.centos.org/AdditionalResources/Repositories/RPMForge).

Hints:

* Use `cat /etc/redhat-release` to find which release of EL you are using
* Use `uname -a` to find your processor architecture
* Use `rpm -ivh package-filename` to install the rpmforge-release package (also works with URLs)
* You can use `wget` or `curl` to download the package using one of the above links if needed (for example on a server with no X Window)
* Then you can use `yum` to install the available packages from the RepoForge repo, e.g. `yum install --enablerepo=rpmforge-extras``
* Afterward, you can disable accidental updates from the repo by setting `enabled = 0` in the repo definition file in `/etc/yum.repos.d/`
