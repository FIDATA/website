#!/usr/bin/env ruby
# coding: utf-8

# Gemfile for FIDATA Website
# Copyright © 2014, 2017  Basil Peace

# This file is part of code for generation of FIDATA website.

# This work is licensed under the Creative Commons
# Attribution-ShareAlike 3.0 Unported License. A copy of this license is
# located in LICENSE.code.txt. If you haven't received that file,
# visit http://creativecommons.org/licenses/by-sa/3.0/ or send a letter
# to Creative Commons, 444 Castro Street, Suite 900, Mountain View,
# California, 94041, USA.

require 'rbconfig'

source 'https://fidata.jfrog.io/fidata/api/gems/gems'

gem 'win32console', '~> 1.3', :platforms => [:mswin, :mingw, :x64_mingw, :mri]
gem 'nanoc', '~> 4.8'
# Markdown
gem 'kramdown', '~> 1.15'
# Stylesheets
gem 'sass', '~> 3.5'
# gem 'nokogiri', '~> 1.8'
# Navigation, Disqus
gem 'nanoc-toolbox', '~> 0.0'
# JS minimization
gem 'uglifier', '~> 3.2'
# Image Optimization
gem 'nanoc-image-compressor', '~> 0.1'
# For ExecJS
# gem 'therubyracer', '~> 0.12', :platforms => :ruby

gem 'guard-nanoc', '~> 2.1'
# Adapters for using by guard-nanoc instead of polling
# BLOCKED: I couldn't have made wdm listener work.
# See:
# *	https://github.com/guard/listen/issues/149
# *	https://github.com/Maher4Ever/wdm/issues/14
# <>
gem 'wdm', '~> 0.1', :platforms => [:mswin, :mingw, :x64_mingw, :mri] if RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/i
gem 'rb-kqueue', '~> 0.2' # if RbConfig::CONFIG['host_os'] =~ /bsd/i
