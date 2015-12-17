# Starter App

## Local System Setup

#### Don't have a ruby version manager set up? Use rbenv
    $ brew install rbenv
    $ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc                # configure your bash profile
    $ echo 'eval "$(rbenv init -)"' >> ~/.bashrc                              # configure your bash profile
    $ echo 'export PATH=/usr/local/bin:$PATH' >> ~/.bash_profile              # configure your bash profile
    $ echo 'test -f ~/.bashrc && source ~/.bashrc' >> ~/.bash_profile         # configure your bash profile
    $ source ~/.bash_profile                                                  # activate your bash profile in current terminal session
    $ brew install rbenv-gem-rehash
    $ brew install ruby-build

#### Get ruby 2.2.3
    $ rbenv install 2.2.3

#### Maybe you want homebrew to manage git
    $ brew install git
    $ rbenv rehash
    $ git --version                                                           # make sure the new version is in use
    $ git config --global user.name "Your name"
    $ git config --global user.email your_email@example.com

#### Don't have postgres? Install it
    $ brew install postgresql                                                 # may need to chown /usr/local/var/postgres
    $ initdb /usr/local/var/postgres -E utf8                                  # initialize your computer's postgres db
    $ ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents        # set postgres to run on computer startup
    $ launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist    # start postgres now

#### Don't have java? Install it
    $ brew install Caskroom/cask/java

#### Don't have elasticsearch? Install it
    $ brew install elasticsearch
    $ ln -sfv /usr/local/opt/elasticsearch/*.plist ~/Library/LaunchAgents     # set elasticsearch to run on computer startup
    $ launchctl load ~/Library/LaunchAgents/homebrew.mxcl.elasticsearch.plist # start elasticsearch now

#### Don't have redis? Install it
    $ brew install redis
    $ launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist

## Get The Application Running

#### Clone the app
    $ git clone https://github.com/pegulabs/starter_app
    $ cd /starter_app

#### Set local version of ruby for the app
    $ rbenv local 2.2.3
    $ rbenv rehash

#### You'll need bundler to grab all the application gems if you don't have it yet
    $ gem update --system
    $ gem install bundler --no-rdoc --no-ri
    $ bundle install

#### Get env vars for application.yml from a buddy

#### Get the DB going
    $ rake db:create
    $ rake db:setup

#### Moment of truth...
    $ rails s
    $ foreman s                                                               # if you prefer...
