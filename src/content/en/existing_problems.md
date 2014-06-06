---
title: Existing problems
author: Basil Peace
copyright: Copyright © 2014  Basil Peace
---

Problems of existing products
=============================

See [Requirements](<%= @items["/#{@item[:lang]}/requirements/"].path %>)

Problems of proprietary products
--------------------------------

1.	They are not extendable for legal reasons and closed source.

2.	They are black boxes.

3.	Most of the products work exclusively under Windows.

4.	They have architectural flaws and don't meet those or other
requirements for good software for trading.

5.	They are not versatile.
	Choosing a product trader risks to find himself in the situation
when a program can't meet the need arose. Since there is no possibility
to improve the program, he will have to migrate to the new platform.

These problems can't be fixed for lack of extensibility.


Problems of open products
-------------------------

1.	They have architectural flaws and don't meet those or other
requirements for good software for trading.

2.	Most of the products have no quality support. This creates risks for
traders.

3.	Many products haven't been updating for a while.

4.	Python and R have a lot of usable packages. However:

	*	They don't satisfy requirement of work out of the box.
	*	They don't compose solid environment requiring manual coupling.

Architectural flaws mean that it is easier to write something from
scratch than to remake existing program. At the same time if we will
like isolated parts of code of existing open products under compatible
licenses we will be able to reuse them.
