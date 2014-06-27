#!/usr/bin/env ruby
# coding: utf-8

# Gemfile for FIDATA Website
# Copyright © 2014  Basil Peace

# This file is part of code for generation of FIDATA website.

# This work is licensed under the Creative Commons
# Attribution-ShareAlike 3.0 Unported License. A copy of this license is
# located in LICENSE.code.txt. If you haven't received that file,
# visit http://creativecommons.org/licenses/by-sa/3.0/ or send a letter
# to Creative Commons, 444 Castro Street, Suite 900, Mountain View,
# California, 94041, USA.

require 'rbconfig'

source "https://rubygems.org"

gem 'win32console', :platforms => [:mswin, :mingw]
gem 'nanoc'
gem 'kramdown'
gem 'sass'
gem 'nokogiri'
# Navigation, Disqus
gem 'nanoc-toolbox'
# Minimization of JS
gem 'uglifier'
# TODO: Optimization of images
# gem 'nanoc-image-compressor'
# For ExecJS
gem 'therubyracer', :platforms => :ruby

gem 'guard-nanoc'
# Adapters for using by guard-nanoc instead of polling
# TODO: I couldn't  have made wdm listener work.
# See:
# *	https://github.com/guard/listen/issues/149
# *	https://github.com/Maher4Ever/wdm/issues/14
gem 'wdm', '>= 0.1.0' if RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/i
gem 'rb-kqueue', '>= 0.2' if RbConfig::CONFIG['host_os'] =~ /freebsd/i
