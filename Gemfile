source 'https://rubygems.org'

# Override the :github shortcut to use SSH to avoid the insecurity of git://
git_source(:github) { |repo| "git@github.com:#{repo}.git" }

gem 'spree', github: 'spree/spree', branch: 'master'
#gem 'paperclip-av-transcoder'

gemspec
