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

### How to become a mirror for repoforge? ###

#### Requirements ####

We have a few requirements for those wishing to run a mirror:
* You must subscribe to the mailing list for mirror maintainers.
* At least 140 GB of available disk space. The current distribution directory is around 90 GB, but we wish to leave room for considerable expansion.
* You must not trim or abridge the mirrored tree in any way.
* You must not modify the mirrored tree in any way. In particular, index.html, HEADER.html and README.html files must not be altered or removed.
* Your mirror must not be shown "inside" another site using, for instance, frames.
* You must do an update-check at least once a day, and preferably four times a day.
* Do not rsync more rapidly than every hour.
* Sync on a ranodm minute so it is more likely the requests will be spaced out with other mirrors.
* You must use 'repoforge' name for the mirror.

#### Mirroring techniques ####
We only support rsync for updating mirrors. You can find details on rsync at http://rsync.samba.org/. Update your mirror with:
    
    /usr/bin/rsync -vai4CH --safe-links --delay-updates --delete rsync://a_Tier1_RepoForge_mirror/repoforge/ /path/to/local/mirror/repoforge


We highly recommend the use of lock file in your cron script, so that you don't spawn multiple connections, which is hard on our servers and on your mirror. Update your mirror with:

    /usr/bin/flock -w 60 /var/lock/EUAK1qEPB3SM /usr/bin/rsync -vai4CH --safe-links --delay-updates --delete rsync://a_Tier1_RepoForge_mirror/repoforge/ /path/to/local/mirror/repoforge

Create your unique lockfile with:

    cat /dev/urandom | tr -dc [:alnum:] | head -c12; echo

#### Inform us ####
Once the site is configured, tested, and updating consistently, you should subscribe to the mirror maintainers mailing list.

Provide us with details of your mirror:
* URL of mirror
* Supported access methods (http, ftp, rsync, ...) 
* Country/State/City where the mirror is located
* Contact email address
* Update frequency
* Approximate bandwidth
* The name of **Tier1** mirror you are syncing from, which should be one of this:
    * **mirror1.hs-esslingen.de** (Germany) - *rsync://mirror1.hs-esslingen.de/repoforge/*
    * **repository.vsb.cz** (Czech Republic) - *rsync://repository.vsb.cz/repoforge/*
    * **repoforge.eecs.wsu.edu** (United States) - *rsync://repoforge.eecs.wsu.edu/repoforge/*                                    

Notes:
* If/when your mirror is in the list, you can change the IP of the mirror without notifying us.
* If the best contact point for your mirror is not the address you are subscribed to the mailing list (http://lists.repoforge.org/mailman/listinfo) with, please provide the email address of your preferred contact as well.
* Please alert the mailing list if anything about the server changes like location, available bandwidth, frequency of updates, etc.
