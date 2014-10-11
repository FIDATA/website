#!/usr/bin/env ruby
# coding: utf-8

# FIDATA Website localization helper
# Copyright © 2014  Basil Peace
#
# This file is based on examples from nanoc documentation
# at http://nanoc.ws/docs/guides/creating-multilingual-sites/.
# © 2007–2014 Denis Defreyne
#
# Dummy text is the tale of Tower of Babel
# Translations are from http://www.omniglot.com/babel/index.htm

# This file is part of code for generation of FIDATA Website.

# This work is licensed under the Creative Commons
# Attribution-ShareAlike 3.0 Unported License. A copy of this license is
# located in LICENSE.code.txt. If you haven't received that file,
# visit http://creativecommons.org/licenses/by-sa/3.0/ or send a letter
# to Creative Commons, 444 Castro Street, Suite 900, Mountain View,
# California, 94041, USA.

module FIDATAWebsite::Helpers::Localization

	# Language names
	LANG_NAMES = {
		'en' => 'English',
		'ru' => 'Русский',
	}

	def lang_name_of(item)
		LANG_NAMES(item[:lang])
	end

	def items_in(lang)
		@items.select { |i| i[:lang] == lang }
	end

	# Returns all articles in the given language
	def articles_in(lang)
		items_in(lang).select { |p|
			p.kind == 'article'
		}.sort_by { |a|
			a.created_at
		}.reverse
	end

	def translations_of(item)
		@items.select { |i|
			!i[:lang].nil? && i[:canonical_identifier] == item[:canonical_identifier]
		}
	end

	def translation_of(item, params={})
		translations_of(item).find { |i|
			i[:lang] == params[:in]
		}
	end
	
	DUMMY_TEXTS = {
		'en' => [
			"And the whole earth was of one language, and of one speech.",
			"And it came to pass, as they journeyed from the east, that they found a plain in the land of Shinar; and they dwelt there.",
			"And they said one to another, Go to, let us make brick, and burn them thoroughly. And they had brick for stone, and slime had they for morter.",
			"And they said, Go to, let us build us a city and a tower, whose top may reach unto heaven; and let us make us a name, lest we be scattered abroad upon the face of the whole earth.",
			"And the LORD came down to see the city and the tower, which the children of men builded.",
			"And the LORD said, Behold, the people is one, and they have all one language; and this they begin to do: and now nothing will be restrained from them, which they have imagined to do.",
			"Go to, let us go down, and there confound their language, that they may not understand one another's speech.",
			"So the LORD scattered them abroad from thence upon the face of all the earth: and they left off to build the city.",
			"Therefore is the name of it called Babel; because the LORD did there confound the language of all the earth: and from thence did the LORD scatter them abroad upon the face of all the earth.",
	],
		'ru' => [
			"На всей земле был один язык и одно наречие.",
			"Двинувшись с востока, они нашли в земле Сеннаар равнину и поселились там.",
			"И сказали друг другу: наделаем кирпичей и обожжем огнем. И стали у них кирпичи вместо камней, а земляная смола вместо извести.",
			"И сказали они: построим себе город и башню, высотою до небес, и сделаем себе имя, прежде нежели рассеемся по лицу всей земли.",
			"И сошел Господь посмотреть город и башню, которые строили сыны человеческие.",
			"И сказал Господь: вот, один народ, и один у всех язык; и вот что начали они делать, и не отстанут они от того, что задумали делать;",
			"сойдем же и смешаем там язык их, так чтобы один не понимал речи другого.",
			"И рассеял их Господь оттуда по всей земле; и они перестали строить город.",
			"Посему дано ему имя: Вавилон, ибо там смешал Господь язык всей земли, и оттуда рассеял их Господь по всей земле.",
		],
	}
	
end

def preprocess_langs
	@items.each do |item|
		item[:lang] ||= (item.identifier.match(%r{^/(..)/}) || [])[1]
		item[:canonical_identifier] = (item.identifier.match(%r{^(?:/..)?(/.*)$}) || [])[1]
	end
end
