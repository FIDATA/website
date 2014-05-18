#!/usr/bin/env ruby
# coding: utf-8

# Include file for nanoc helpers
# Copyright © 2014  Basil Peace

# This file is part of code for generation of FIDATA Website.

# This work is licensed under the Creative Commons
# Attribution-ShareAlike 3.0 Unported License. A copy of this license is
# located in LICENSE.code.txt. If you haven't received that file,
# visit http://creativecommons.org/licenses/by-sa/3.0/ or send a letter
# to Creative Commons, 444 Castro Street, Suite 900, Mountain View,
# California, 94041, USA.

# For rendering layouts as partials
include Nanoc::Helpers::Rendering
# For managing tags added to items
include Nanoc::Helpers::Tagging
include Nanoc::Toolbox::Helpers::Navigation

include FIDATAWebsite::Helpers::Localization
include Nanoc::Toolbox::Helpers::Disqus
