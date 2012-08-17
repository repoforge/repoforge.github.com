---
layout: default
title: RepoForge FAQ
---

## RepoForge FAQ ##

### What is RepoForge? ###

The RepoForge project maintains RPM packages for Red Hat Enterprise Linux (RHEL), CentOS and Scientific Linux. It provides a set of repositories compatible with various RHEL-derived distributions.

### How do I use RepoForge? ###

See [Using RepoForge](/use "Using RepoForge")

### How can I contribute? ###

There are numerous ways you can help.  Feel free to do more than one!
* promote RepoForge - let people know when it helped you solve a problem.
* Get active on [our mailinglists](http://lists.repoforge.org/mailman/listinfo)
* Test the various packages in the repos, and let the package maintainers know about any problems you find
* Become a [packager](/package "RepoForge contributor") by fixing packages or adding new packages.
* Get forking. Fork the repository you want to assist with, fix things, submit pull requests: _for example, for the package that is [this website](http://github.com/RepoForge/RepoForge.github.com/)_.
* Become a Mirror! You can setup a mirror of RepoForge - more details on that below.

### Why are there now several repositories?  What is "rfx"? ###

Our goal is to move all packages that conflict with upstream packages into a separate "extras" repository; this way, users who want to be confident that our packages will not cause conflicts with upstream can enable the base repository, and users who want newer versions of packages (and are willing to tolerate some package conflicts) can enable the extras repository.

More information is in [this post](http://lists.RepoForge.org/pipermail/users/2010-November/018282.html).

### How to become a mirror for RepoForge? ###

#### Mirror Requirements ####

We have a few requirements for those wishing to run a mirror:
1. You must subscribe to the mailing list for mirror maintainers.
2. At least 140 GB of available disk space. The current distribution directory is around 90 GB, but we wish to leave room for considerable expansion.
3. You must not trim or abridge the mirrored tree in any way.
4. You must not modify the mirrored tree in any way. In particular, index.html, HEADER.html and README.html files must not be altered or removed.
5. Your mirror must not be shown "inside" another site using, for instance, frames.
6. You must do an update-check at least once a day, and preferably four times a day.
7. Do not rsync more rapidly than every hour.
8. Sync on a random minute so it is more likely the requests will be spaced out with other mirrors.
9. You must use 'RepoForge' name for the mirror.

#### Mirroring techniques ####
We only support rsync for updating mirrors. You can find details on rsync at http://rsync.samba.org/. Update your mirror with:

    /usr/bin/rsync -vai4CH --safe-links --delay-updates --delete rsync://a_Tier1_RepoForge_mirror/RepoForge/ /path/to/local/mirror/RepoForge

We highly recommend the use of a lock file in your cron script, so that you do not spawn multiple connections, which is hard on our servers and on your mirror. Update your mirror with:

    /usr/bin/flock -w 60 /var/lock/EUAK1qEPB3SM /usr/bin/rsync -vai4CH --safe-links --delay-updates --delete rsync://a_Tier1_RepoForge_mirror/RepoForge/ /path/to/local/mirror/RepoForge

Create your unique lockfile with:

    cat /dev/urandom | tr -dc [:alnum:] | head -c12; echo

#### After I setup a mirror, what next? ####

You will need to INFORM us of your new mirror.  Once the site is configured, tested, and updating consistently, you should subscribe to the mirror maintainers mailing list.

Provide us with details of your mirror:
* URL of mirror
* Supported access methods (http, ftp, rsync, ...)
* Country / state / city where the mirror is located
* Contact email address
* Update frequency
* Approximate bandwidth
* The name of **Tier1** mirror you are syncing from, which should be one of these:

    * Asia:

        **ftp.riken.jp** (Japan) - *rsync://ftp.riken.jp/RepoForge/*
  
    * Europe:

        **mirror1.hs-esslingen.de** (Germany) - *rsync://mirror1.hs-esslingen.de/RepoForge/*

        **repository.vsb.cz** (Czech Republic) - *rsync://repository.vsb.cz/RepoForge/*
  
    * North-America / South-America:

        **RepoForge.eecs.wsu.edu** (United States) - *rsync://RepoForge.eecs.wsu.edu/RepoForge/*

Notes:

* If/when your mirror is on the list, you can change the IP of the mirror without notifying us.
* If the best contact point for your mirror is not the address you are subscribed to the [mailing list](http://lists.RepoForge.org/mailman/listinfo/mirrors) with, please provide the email address of your preferred contact as well.
* Please alert the mailing list if anything about the server changes like location, available bandwidth, frequency of updates, etc.

### Why is this FAQ so short? ###

Because you have yet to [fork it on GitHub](http://github.com/RepoForge/RepoForge.github.com/) to add other questions/answers.
