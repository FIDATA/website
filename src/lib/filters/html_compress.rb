#!/usr/bin/env ruby
# coding: utf-8

# nanoc_html_compress
# Homepage: http://www.thehorrors.org.uk/snippets/nanoc-html-compress/.
# Copyright (c) 2013 thehorrors.org.uk

# Licensed under MIT X11 license. License is in
# LICENSES/nanoc_html_compress.txt.

require 'nokogiri'

class HTMLCompressFilter < Nanoc::Filter
  identifier :html_compress
  type :text

  def run(content, params={})
    doc = Nokogiri::HTML(content)
    
    # Find comments.
    doc.xpath("//comment()").each do |comment|
        # Check it's not a conditional comment.
        if (comment.content !~ /\A(\[if|\<\!\[endif)/)
            comment.remove()
        end
    end

    doc.to_html
  end
end
