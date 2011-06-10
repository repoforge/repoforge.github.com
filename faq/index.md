---
layout: default
title: Repoforge FAQ
---

## Repoforge FAQ ##

### What is Repoforge? ###

Repoforge is the new name of the RPMforge project.

Repoforge is a project that maintains RPM packages for Red Hat Enterprise Linux (RHEL), CentOS and Scientific Linux. It consists of a set of repositories compatible with various RHEL versions.

### How do I use this? ###

See the [user guide](/use "user guide")

### How can I contribute? ###

* Become a [packager](/package "repoforge contributer") by fixing or adding new packages.
* Get forking.  Fork the repository you want to assist with, fix things, submit pull requests. _like [this website](http://github.com/repoforge/repoforge.github.com/)_

### Why are there now several repositories?  What is "rfx"? ###

Our goal is to move all packages that conflict with upstream packages into a separate "extras" repository; this way, users who want to be confident that our packages will not cause conflicts with upstream can enable the base repository, and users who want newer versions of packages (and are willing to tolerate some package conflicts) can enable the extras repository.

More information is in [this post](http://lists.repoforge.org/pipermail/users/2010-November/018282.html).
