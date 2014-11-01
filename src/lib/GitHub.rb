#!/usr/bin/env ruby
# coding: utf-8

# Generation of files for GitHub (CNAME AND .nojekyll)
# Copyright © 2014  Basil Peace

# This file is part of code for generation of FIDATA Website.

# This work is licensed under the Creative Commons
# Attribution-ShareAlike 3.0 Unported License. A copy of this license is
# located in LICENSE.code.txt. If you haven't received that file,
# visit http://creativecommons.org/licenses/by-sa/3.0/ or send a letter
# to Creative Commons, 444 Castro Street, Suite 900, Mountain View,
# California, 94041, USA.

require 'uri'

def generate_GitHub_files(path = '/')
	uri = URI(@config[:base_url])
	if uri.path == '' and uri.query.nil? and uri.fragment.nil?
		@items << Nanoc::Item.new(
			"#{uri.host}\n",
			{},
			"#{path}CNAME/",
			:binary => false
		)
	end
	@items << Nanoc::Item.new(
		'',
		{},
		"#{path}.nojekyll/",
		:binary => false
	)
end
