---
title: Requirements for good software for trading
author: Basil Peace
copyright: Copyright © 2014  Basil Peace
---

Requirements for good software for trading
==========================================

Features
--------

1.	Versatility

	*	No binding to specific classes of financial instruments.
	*	No binding to specific markets.
	*	No binding to specific types of data.
	*	No binding to specific methods of data analysis.
	*	No binding to specific styles of trading.

2.	Storage of metadata of time series

3.	Storage of data provenance

	Sometimes we have to work with some data sources or with data of
questionable quality. The platform should save provenance of data in
order to give a possibility to identify sources of errors.

	Data provenance can be also used to track respect for sui generis
database rights.


Architecture
------------

1.	Extensibility

	*	Required for achievement of versatility.
	*	Interesting for the scientific community in order to have
possibility to build new financial models and promote the results of
their researches to the practicians.

2.	Open source code

	We don't use trading strategies that are black boxes. The same way
we don't trust software that are black boxes.

3.	Portability

	Good software must work under any popular OS.

	(At this moment, targets are Windows, Debian, Ubuntu, OS X.
[Report](<%= @items["/#{item[:lang]}/contacts/"].path %>) if there is
interest or need in other platforms.)

3.	Existence of alternative methods of data access

	*	Computations should be verifiable.
	*	Required for convenience of debugging and searching for bug.
	*	First versions won't be able to meet needs of all users, and
first time they will have to use additional software.

4.	Existence of thin client and web client

	*	Notebooks, tablets, smartphones and internet cafés allow us to
work being not at home.
	*	Unlimited mobile internet is broadly available.
	*	Notebook or tablet can't outperform powerful stationary personal
computer.
	*	During testing of TS the most part of machine time is taken by
computations and only small — by obtaining and displaying of results.
	*	For both single trader and team of traders it is efficiently to
store the same data at one place (Single Source of Truth).

	So, it is efficient to have:

	*	powerful home PC, always online and ready to receive commands and
perform computations;
	*	thin clients, for different platforms, and web-client.

5.	<a name="work_out_of_the_box"></a>Graphical user interface and work
"from the box"

	*	Client should provide graphical interface and not require manual
input of commands from keyboard.
	*	Platform should not require from user manual installation of

6.	Management of dependencies and libraries (avoidance of dependency
hell)

	This problem exists on Windows. For example, various software have
installed on my computer 42 copies of zlib1.dll, and 7 of them are
visible from PATH of my user. They have different versions, were built
by various compilers and are dated by 2005 to 2014. I can't be sure that
each one of them doesn't have vulnerabilities.

	The reason of the problem is that many free libraries use for
building GNU autotools. For compilations of library under Windows each
project make its own port of library, making code incompatible with
source version and not updateable, and not porting changes back to
the source project.

	The right decision is to port libraries to cross-platform build
system, such as CMake, and backporting changes to source projects. Some
projects have already been ported or are being ported now. Others
require help.

	There are some free libraries that will be used in several parts of
the project. They include: zlib, libxml2, libxlst, libiconv (the list is
not exhaustive). For these libraries it is required to:

	1.	Use single, the freshest stable version.
	2.	Port build system to cross-platform, making changes backportable
to the source project.
	3.	Include libraries in our build system.
	4.	Build libraries with the same compilers that other parts of
platform.

	Many implementations of GNU/Linux have embedded package managers and
so this problem doesn't exist there.


Free/libre software is able to satisfy all these requirements.


Technical requirements
----------------------

1.	Use of column-oriented DB for storage of time series

	*	Amounts of data can be very large. See, e.g.,
<http://grv87.blogspot.ru/2014/01/blog-post.html>. It is required to
have indexes.
	*	File storages don't fit in for inability to ensure data
integrity and foreign keys.
	*	A lot of computations include computation of indices by one
column, so it is efficient to use column-oriented DB.
	*	Embedded DBMS like SQLite are unhandy since there is no
alternative methods of data access.

2.	Computations on GPU

	*	A lot of computations of indices can be performed in parallel.
	*	GPUs have more cores and more efficiently in parallel
computations on big amounts of data than CPUs.


Other requirements
------------------

1.	<a name="quality_technical_support"></a>Existence of quality (paid)
technical support


Additional reading
------------------

1.	Philip Russom. Analytical databases for big data. TDWI. 2012, Oct.
URL:
<http://www.paraccel.com/resources/Analyst-Reports/TDWI_Checklist-Report_Analytic-Databases-for-Big-Data.pdf>.
2.	Morten Christiansen, Christian E. Hansen. CUDA DBMS. Aalborg
University, 2009. URL:
<http://projekter.aau.dk/projekter/files/17689777/GPGPU_DBMS_Report.pdf>.
3.	Dennis Shasha. Time Series in Finance: the array database approach.
URL: <http://cs.nyu.edu/shasha/papers/jagtalk.html>.
4.	Tamás Budavári. Projects in CUDA. 2013, Apr., 8. URL:
<http://www.sdss.jhu.edu/~budavari/tamas/teaching/2013-02/PraSci-18-Corr.pdf>.
5.	Suman Karumuri, Jamie Jablin. Relational Joins on Graphics
Processors. URL:
<http://www.slideshare.net/mansu/gpu-join-presentation>.
6.	[CoGaDB](http://wwwiti.cs.uni-magdeburg.de/iti_db/research/gpu/cogadb/)
— research project of column-oriented GPU-accelerated DBMS, developed at
the University of Magdeburg and licensed under GPLv3.


Restrictions
============

1.	<a name="no_trade_organization"></a>Platform is not designed for
trade organization.

	Platform will have some functions simulating actions of real trade
organizer and intended for testing of TS. But it will have no complete
organization of trades.

	At the same time we welcome if exchanges, brokers and dealing
centers will offer traders to use FIDATA platform for access to their
marketplaces.

2.	The following features aren't planned.

	*	Development of robots for high-frequency trading

		Under high-frequency I mean trading with average speed faster
than one deal per second. It is high-competitive high-technology
business where only the largest players can have stable successes. They
are able, for example,
[invest $300 mln. into new transatlantic cable](http://habrahabr.ru/post/128372/).
And they themselves confess that this style of trading has come to an
impasse for physical limitations on speed of light. I'm sure that mere
trader has nothing to do in this area. He can't be a predator and will
certainly lose.

		It is probable that FIDATA platform will allow development of
high-frequency robots that will successfully make money. However it is
not our goal.
