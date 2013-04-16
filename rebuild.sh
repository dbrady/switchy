#!/bin/sh
rm switchy*.gem
gem uninstall -x switchy
gem build switchy.gemspec
gem install `ls switchy*.gem | tail -n 1`
