### Capistrano Single Deploy

A Capistrano 3 extension to handle single version deploys, primarily aimed at a LAMP stack.

#### No Releases / Symlinks

The module is designed as a drop-in replacement for the standard capistrano/deploy tasks. You can still type `cap deploy` but you can get your deploy working from a single `Capfile` with no need to use the standard staging system.

*Note* If you are doing more complex delpoys then you are much better sticking with the standard tasks, this package is ideal as a replacement for deploying by hand, especially where you need to deploy to a single location, with a single stage and don't want to maintain multiple releases (and by extension don't need to rollback your releases).


#### The Quick-Start Guide

1. You need a `Capfile` in the root of your project. Make it look something like this:

```
require 'rubygems'
require 'bundler/setup'

# Load DSL and Setup Up Stages
require 'capistrano/setup'
require 'capistrano/simpledeploy'

set :application,   "yourapp"
set :deploy_to,     "."
set :repo_url,      "git@github.com:<your repo details>"

### Default stage
set :stage,         "production"



task :production do
    set :branch,        "master"

    server 'yourserver.com', roles: %w{web},
        ssh_options: {
          user: 'yoursshuser',
          password: 'yoursecretpassword'
        }
end
```

2. You need a Gemfile to define the capistrano dependencies. Make `Gemfile` in the root of your project and add the following:

```
source 'https://rubygems.org'

gem 'capistrano', '~> 3.1'
gem 'capistrano-simpledeploy'
```

3. Finally run `bundle` from the command line in the root directory of your project. You should get an output like the following:

```
Fetching gem metadata from https://rubygems.org/.......
Resolving dependencies...
Using rake (10.1.1)
Using i18n (0.6.9)
Using net-ssh (2.8.0)
Using net-scp (1.1.2)
Using tins (1.0.0)
Using term-ansicolor (1.3.0)
Using sshkit (1.3.0)
Using capistrano (3.1.0)
Using capistrano-bundle (0.0.4)
Using capistrano-compose (0.0.20)
Using capistrano-simplegit (0.1.1)
Using capistrano-simpledeploy (0.0.4)
Using bundler (1.5.3)
Your bundle is complete!
```

4. Now when you want to deploy, you can just type: `cap production deploy`



