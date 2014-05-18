---
title: Architecture
author: Basil Peace
copyright: Copyright © 2014  Basil Peace
---

Architecture
============

Modularity
----------

Platform will have modular architecture. Under module I mean a
collection of executable and auxiliary files deployed to user's
computer. For deployment of modules I plan to use
[Qt Installer Framework](http://doc-snapshot.qt-project.org/qtifw-master/index.html).
From developer's point of view module can include one or some artifacts.

Platform will have embedded engine a-la OSGi. It will allow describe
standard interfaces implemented by modules and dynamically load specific
implementation. Examples of features that can work via standard
interfaces:

*	[languages for development of robots/TS](<%= @items["/#{@item[:lang]}/DSL/"].path %>)
*	protocols for work with data providers and trade organizers
*	formats for import/export of data
*	types of plots
*	indicators of TA
*	numerical algorithms
*	localization of user interface

Advantages of modular architecture:

*	**For users**:

	*	ease of installation and updates

		User installs only the necessary modules not  overburdening
interface and keeping installation size in reasonable limits.

	*	opportunity to use third-party modules under incompatible
licenses (see
[Licensing](<%= @items["/#{@item[:lang]}/licensing/"].path %>))

	*	ease of writing own modules

*	**For developers**:

	*	ease of development and support

	*	ease of release updates

	*	ease of support of different software and hardware platforms
(release of platform-dependent versions of modules)

	*	ease of reuse of off-the-shelf code from other projects

	*	opportunity to have some alternative implementations, compare
them by performance and choose the best solutions


Client-server architecture
--------------------------

Platform will have client-server architecture.

![Architecture](<%= @items["/#{@item[:lang]}/images/architecture/"].path %>)

From software point of view, it will be three/four-tier architecture.

From hardware point of view, it will be, most probably, two-tier
architecture. If computations will be performed inside application
server then, by my opinion, it will be inefficient to run DBMS and
application server on separate machines since it would require
transferring large amount of data over the network. In addition, it
could require organization of additional temporary storage inside
application server. See details below.


Specific tasks performed at different levels of architecture
------------------------------------------------------------

1.	**DBMS**:

	*	Storage of data

		*	Storage of time series
		*	Storage of metadata
		*	Storage of data obtained during testing of TS
		*	Maintenance of data integrity
		*	(Possibly) Performing computations (data analysis)

2.	**Application server**:

	*	Interaction with clients

		*	Authorization of users
		*	Receiving of commands
		*	Sending of results of computations
		*	Translation of metadata objects

	*	Interaction with DBMS

	*	(Possibly) Performing computations (data analysis, testing of
TS)

	*	Compilation of TS

	*	Testing of TS

		*	Receiving of real data
		*	Provision of exchange protocols

	*	Generation of reports

3.	**Thin client**:

	*	Interaction with the server

	*	Editing TS (in the form of source code and in graphical form)

	*	View and edit of metadata

	*	Plotting/charting and graphical analysis

		*	Receiving data from server
		*	Receiving online data

	*	Display of results of data analysis and testing of TS

4.	**Web application**:

	*	regular thin client

	*	technology rendering desktop windows into webpage


Unresolved issues
------------------

1.	**Where should computations be performed?**

	Theoretically it is possible to implement all computations inside
DBMS.

	**Arguments "PRO"**:

	1.	DBMS itself is able to perform some computations (e.g., averages
or window functions). Therefore, it has sense to perform algorithms
existing in DBMS on GPU.

	2.	DBMS with developed procedural languages (like PostgreSQL)
allows implementing all computations inside DBMS.

	3.	If computations are performed only inside DBMS then it is
possible to implement three-tier hardware architecture.

	**Arguments "CONTRA"**:

	1.	We need both methods of computations:

		*	Computations on historical data

			For acceleration of the work, it is efficient to compute
required index on large amount of data using GPU.

		*	Computations on real data

			Use of GPU for computation of a single number is inefficient
and senseless.

		Implementation inside DBMS still requires implementation of the
same algorithm in separate library loaded by robot.

	2.	Implementation inside DBMS is more difficult for debugging and
searching for bugs.

	3.	For the present, it's not very clear how modular architecture
would live inside DBMS. It is not clear how installation, update or
uninstallation of separate modules would be performed.

	4.	Implementation of computations inside DBMS can have other
pitfalls that I don't know yet.

2.	<a name="problem_compilation"></a>**Compilation of robot/TS**

	Feature of compilation means that the platform should have embedded
compiler. Compiler should be compatible with
[used for compilation of the platform and libraries](<%= @items["/#{@item[:lang]}/development_and_building/"].path %>#C_CPP_compiler).
For C/C++ or language based on them, we can't and won't embed in the
platform MSVC. However, this violates
[requirement of work out of the box](<%= @items["/#{@item[:lang]}/requirements/"].path %>#work_out_of_the_box).

	**Possible solutions**:

	*	Give up compilation in favor to interpretation.

	*	Interpret code in the platform and make a feature of generation
texts in C/C++ or some other intermediate format for compilation into
binaries by user itself.

	*	Do not include in deployment any compilers. Use compiler found
on user machine. (Doesn't meet requirement of work out of the box).

	*	Use for development of robots non-C/C++ language (e.g., Pascal).

	**Considering solution**: require from Windows users installed
Visual Studio. Express version is free of charge and can be installed by
user himself. Since:

	*	we develop free/libre software,
	*	it is required to encourage Windows' users to migrate to free
platforms,
	*	even Windows users will often run robots on servers under
GNU/Linux, and features of compilation under Windows will be demanded
even less
	*	it seems that there are no other options (excepting choice of
other language),

	it is possible to make some restrictions for ardent fans of Windows.

3.	<a name="problem_online_data"></a>**Architecture of subsystem of
receiving online data**

	1.	How the client will receive data (via server or directly from
the exchange)?
	2.	How the data will be written in database on the server?
	3.	How data will be distribute on the server between database and
testing at the same moment TS?
	4.	How indicators will be computed in real time?

	Probably we need here some cache or redistributor of data. See how
it's done in kdb+:
<http://kx.com/_papers/Kx_White_Paper-2013-131023.pdf>.
