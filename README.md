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
> * `yum install git asciidoc`
* `gem install jekyll bluecloth redcloth github-markup`
* `git clone git://github.com/repoforge/repoforge.github.com.git`
* `cd repoforge.github.com`
* `jekyll --auto --serve`
* browse to: http://localhost:4000/
* hack hack hack

Random Notes
------------

GitHub supports ASCIIdoc but getting that working on the localhost with jeykll has proven to be troublesome.  Getting the ball rolling with markdown as default markup.  Helpful hint for markdown: `gem install cheat`  and then `cheat markdown`

Web design: html5 + blueprint + ghetto css to start with.
