---
layout: default
title: Repoforge Project Website README
---

Repoforge website
-----------------

This is the jeykll website content for http://repoforge.org/


Goal of the website:

* how to install repoforge
* how to cooperate/contribute
* information for mirror users
* where to find information

Places information need to come from:

* https://rpmrepo.org/RPMforge
* http://dag.wieers.com/rpm/
* http://wiki.centos.org/AdditionalResources/Repositories/RPMForge


Quick Start Guide
-----------------

How to get a copy of this website running on your local machine.

* have git, ruby and gem (w00t RVM)
* `gem install jekyll`
* `git clone git://github.com/repoforge/repoforge.github.com.git` # read-only
* `cd repoforge.github.com`
* `jekyll --auto --serve`
* http://localhost:4000/
* hack hack hack

Random Notes
------------

GitHub supports ASCIIdoc but getting that working on the localhost with jeykll has proven to be troublesome.  Getting the ball rolling with markdown as default markup.

Web design: html5 + blueprint + ghetto css to start with.
