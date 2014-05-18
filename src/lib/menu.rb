#!/usr/bin/env ruby
# coding: utf-8

# Generation of menu
# This code parses *.menu files and generates localized menus for all
#  known languages
# Copyright © 2014  Basil Peace

# This file is part of code for generation of FIDATA Website.

# This work is licensed under the Creative Commons
# Attribution-ShareAlike 3.0 Unported License. A copy of this license is
# located in LICENSE.code.txt. If you haven't received that file,
# visit http://creativecommons.org/licenses/by-sa/3.0/ or send a letter
# to Creative Commons, 444 Castro Street, Suite 900, Mountain View,
# California, 94041, USA.

def generate_menus
	@items.select { |item| item[:extension] == 'menu' }.each do |menu|
		menu_name = menu.identifier[1..-2]
		FIDATAWebsite::Helpers::Localization::LANG_NAMES.keys.each do |lang|
			layout_text = ''
			menu.raw_content.split(/\r?\n/).each do |menuItem_identifier|
				if menuItem_identifier != ''
					begin
						menuItem_identifier[/#\{lang\}/] = lang
					rescue
					end
					layout_text += "<%= render '#{menu_name}.menuItem.html', :menuItem => @items['#{menuItem_identifier}'] %>\n"
				end
			end
			@layouts << Nanoc::Layout.new(
				"<% render '#{menu_name}.html' do %>#{layout_text}<% end %>",
				{},
				"#{menu_name}.#{lang}"
			)
		end
	end
end
