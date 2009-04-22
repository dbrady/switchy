#!/bin/sh
rm switchy*.gem
sudo gem uninstall -x switchy
sudo gem uninstall -x dbrady-switchy
gem build switchy.gemspec
sudo gem install $(ls switchy*.gem | tail -n 1)
