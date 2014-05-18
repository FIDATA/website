---
title: Licensing
author: Basil Peace
copyright: Copyright © 2014  Basil Peace
---

Licensing
=========

Main code will be licensed under GPLv3+. There is a desire to license
server side under AGPLv3+. Libraries and individual modules will be
released under various free licenses compatible with GPL.

Argumentation for GPL:

*	Project is free/libre and will remain so
*	Project is large
*	Monetization of project under permissive license is more difficult
*	We gain possibility to use all best products which exists in open
source world

At the same time, the project is modular and requires careful approach
to choice of licenses on individual modules.

Important part of the project is the engine for plugging in modules a-la
OSGi. It will be licensed under permissive license (Apache License 2.0).
It will give possibility to dynamically plug in beforehand unknown
modules under different licenses, including incompatible with GPL and
proprietary. (Under the condition that these modules don't reuse
code from libraries under GPL). Question still exists will it be able to
write modules without libraries under GPL.

Unresolved issues:

*	Possible problems with version of GPL

	We need to review all required libraries and make sure that we may
use them. As I recall, I met some potentially useful libraries licensed
under GPLv2 only.

*	Licensing of code of server (choice between GPL and AGPL)

	There is a desire to release code of server under AGPL. The server
will have embedded function to provide its source code. It will give us
possibility to backport changes made by users in their custom
installations.

	Possible problem is that engine for plugging in modules might not
work in installation under AGPL. I will discover this question more.

	If we will be able to release server under AGPL then there is
a possibility to sell builds of server under GPL at a higher price.
