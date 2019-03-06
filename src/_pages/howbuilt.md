---
layout: default
title: How this site is built
permalink: /about/howbuilt
---
# {{ page.title }}

This portal is designed and built using the following principles:

* everything has to be version controlled
* adopt KISS princicple: Keep It Simple and Stupid.
* build a static website
* use open source tools whenever possible

## Scaffolding

This website is a statically generated one: there is no CMS, no database, no
authorization server behind it. It is just a bunch of HTML pages. These pages
are generate by [Jekyll][jk].

Jekyll is a static site generator, i.e. it takes a description, generally a
template, of the pages you want to build and generates the relevant HTML.


### Repositories

We use [git] as our (distributed) version control system.
And we selected GitHub as the central server for our git repositories.

In order to group all our repositories we created a [GitHub organization][ghorg]
called `euctrl-pru`. It is a sort of company/team account.

For the website we have two repositories one for the *source* pages and one for
the *compiled* ones.
The source repository is called `website` the `compiled` repository is named
`euctrl-pru.github.io`.

The reason we have these two repositories is related to the fact we use plug-ins
that would not be allowed to run in the [automatic setup][ghpages-plugins]
GitHub provides out-of-the-box.


### Web hosting

The name `euctrl-pru.github.io` for the repository of the compiled website is
due to a fantastic service GitHub provides: [GitHub Pages][ghpages].
When using GitHub Pages any repository named `<username or
organization nane>.github.io` will be served on the web by GitHub web servers.
And if you want your site to be visible under your own domain name you just need
to specify it in a file called `CNAME` and the magic will happen.
(Ok, there are [few other things to setup][cname] but it is soooo simple.)

And our `CNAME` points to `ansperformance.eu`.


### Continuous Integration and Deployment

We use [Travis CI][travis] to automatically

* build every commit in our release branch (any branch name starting with
  `2016<2 digit month number>-release`). These build can include tests to be
  executed in order to garantee a certain level of quality...

* build every `master` branch commit **and if successful** (and the commit is
  properly tagged) deploy the generated site.
  This is a way to publish our releases and make them available on the Internet.
  (*Less work for the Humans more boring work for the Machines*)

## Tools and services we use

* [git], a distributed version control system.
* [Jekyll][jekyll], a static site generator.
* [Jekyll plugins][jkplugs], additional features that can generated custom
  content specific to your site. See our [Gemfile][gems] and [_config.yml][cfg]
  for the ones we use.
* [GitHub Pages][ghpages], a service by GitHub whereby you can have a website
  served on the Internet for every user, organization or repository.
* [GitHub Organizations][ghorg], a service by GitHub for groups of people.


[git]: <https://git-scm.com/> "git"
[jk]: <https://jekyllrb.com/> "Jekyll"
[jkplugs]: <https://jekyllrb.com/docs/plugins/> "Jekyll plugins"
[ghpages]: <https://pages.github.com/> "GitHub Pages"
[ghorg]: <https://github.com/blog/674-introducing-organizations> "GitHub Organizations blog post"
[cfg]: <https://github.com/euctrl-pru/website/blob/master/_config.yml> "Our config.yml file"
[gems]: <https://github.com/euctrl-pru/website/blob/master/Gemfile> "Our Gemfile file"
[cname]: <https://help.github.com/articles/quick-start-setting-up-a-custom-domain/> "Custom domain setup for GitHub Pages"
[ghpages-plugins]: <https://help.github.com/enterprise/2.6/user/articles/adding-jekyll-plugins-to-a-github-pages-site/> "Adding GitHub Pages plugins"
