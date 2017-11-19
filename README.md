# Git Puppet Module for Boxen

[![Build Status](https://travis-ci.org/boxen/puppet-git.svg)](https://travis-ci.org/boxen/puppet-git)

Install [Git](http://git-scm.com), a stupid content tracker.

## Usage

```puppet
include git

git::config::local { 'repo_specific_email':
  ensure => present,
  repo   => '/path/to/my/repo',
  key    => 'user.email',
  value  => 'turnt@example.com'
}

git::config::global { 'user.email':
  value  => 'turnt@example.com'
}
```

## Required Puppet Modules

* `boxen`
* `homebrew`
* `ini_setting`

## Development

Write code. Run `script/cibuild` to test it. Check the `script`
directory for other useful tools.

## Hiera configuration

The following variables may be automatically overridden with Hiera:

```yaml
---
git::configdir: "%{::boxen::config::configdir}/git"

git::package: 'boxen/brews/git'
git::version: '2.15.0-boxen2'

git::credentialhelper: "%{::boxen::config::repodir}/script/boxen-git-credential"
git::global_credentialhelper: "%{boxen::config::home}/bin/boxen-git-credential"
git::global_excludesfile: "%{hiera('git::configdir')}/gitignore"
```

