FIDATA Website
==============

Sources for fidata.github.io

Build environment
-----------------

*	Ruby
*	Bundle gem
	Installation: run `gem install bundle`.
	
Having bundle installed, run: `bundle` in the root directory. It will
install all needed gems.

Run `bundle update` to update your gems to the latest versions.

Generation of Website
---------------------

Run `nanoc` in `src` directory.

Nanoc Guard
-----------

Guard is a framework for listening to filesystem changes and acting upon
them.

Run `guard` in `src` directory. Under Windows, there are still some
bugs, so use `guard -p` instead.


------------------------------------------------------------------------
Copyright © 2014  Basil Peace

This is part of FIDATA Website.

Copying and distribution of this file, with or without modification,
are permitted in any medium without royalty provided the copyright
notice and this notice are preserved.  This file is offered as-is,
without any warranty.
