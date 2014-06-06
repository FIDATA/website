---
title: Development and Building
author: Basil Peace
copyright: Copyright © 2014  Basil Peace
---

Development and Building
========================

Programming language(s)
-----------------------

*	I offer to write the most part of the project in Python 3.
*	Since Python is itself slow enough critical parts (and better the
whole code) should be compiled, translated or converted to C/C++. See
below
[the list of JIT-compilers for Python](#PythonCompilers).
*	Project will include some part of the code in C/C++.

Choice of language is the important and arguable question for
developers. I've received suggestions about other languages. Unlike
other pages of website I bring here detailed argumentation of choice of
Python.

**Arguments "PRO" Python**:

*	High-level general-purpose programming language.
*	Open implementation.
*	Actively maintained and developed.
*	Evenly supported on all popular desktop platforms.
*	Actively evolving as the language for scientific computing.
*	There are a lot of off-the-shelf modules for financial and
scientific computing that can be reused. The official repository:
<https://pypi.python.org/>.
*	I studies this issue thoroughly and I'm sure that all stuff required
by us can be implemented in Python with some degree of С/С++.
*	Procedural language PL/Python is embedded in PostgreSQL. This can
simplify reusage of code.

**Why Python 3**:

*	Python 3 works with UTF-8 by default, which takes away all problems
with code pages.
*	Most of the packages have been already ported to Python 3.

### Considered alternatives

I also considered the following languages as primary:

*	**C# or other language for .NET**

	**Disadvantages**:

	*	Closeness of original implementation and the risk of patent
pursuit of other implementations

		See details at <http://www.fsf.org/news/dont-depend-on-mono>.

	*	Risks of portability

		Although there are projects
[Portable.NET](http://www.gnu.org/software/dotgnu/pnet.html) and
[Mono](http://www.mono-project.com/), there are no warranties that they
support all required features and 100%-compatible with the original
implementation. For example,
[WPF in Mono is not implemented and won't be](http://www.mono-project.com/WPF).
Since .NET is not free platform there is no warranties that these
projects will be developed in the future.

		Mono gives possibility to develop under Windows too, but this
doesn't save us from the problem #1.

	*	Not the best performance

		.NET is the layer between the code and the processor, so
implementation of some algorithm in C# will always lose to
implementation of the same algorithm in C/C++. Loss, however, is not
very significant. See, for example,
<http://www.codeproject.com/Articles/212856/Head-to-head-benchmark-Csharp-vs-NET>.

	**Advantages**:

	*	Off-the-shelf packages: <http://www.nuget.org/>.

		By my feeling there are less libraries for financial and
scientific computing than for Python.

	*	There is ready actively developed project
[StockSharp](<%= @items['/en/existing_products/'].path %>#StockSharp).
It is written in C# and releases free (not the latest) version) under
GPLv3. It doesn't meet all our
[requirements](<%= @items["/#{@item[:lang]}/requirements/"].path %>),
but we can reuse a lot of pieces of code from it.

	*	If we wish to support F# for development of robots/TS, we will
need .NET platform.

	**Decisions**:

	1.	Don't develop anything for .NET platform.
	2.	At first, we can plug into Python available modules under .NET.
	3.	Take the code from projects under .NET and port it to Python.

*	**Java**

	**Advantages**:

	*	Easiness of porting
	*	Existence of some off-the-shelf products for technical analysis
written in Java
	*	Speed of development, availability of ready high-level
abstractions for a lot of operations. For example,
[GMP](http://www.eclipse.org/modeling/gmp/) — for creation of graphical
editors.

	**Disadvantages** (I judge from the point of view of Windows user.
Situation under GNU/Linux can be better):

	*	Low performance and large memory consumption

		*	I use some server products written in Java: CollabNet
Subversion Edge, Artifactory, SonarQube, Jenkins. I'm not satisfied with
neither theirs performance nor their memory consumption.
		*	Java, like .NET, is a layer slowing down code execution.

	*	Less security for end user

		Antiviruses and firewalls, by obvious reasons, work poorly with
Java code (most of them work nohow). I have experience of virus
infection via Java. Usage of Java would jeopardize users of the product
and create inconvenience for them.

	*	For work with GPU we still require native binaries

	*	(Personal prejudice, not an argument) I don't like Java and
unlikely would want to participate in Java project.

	**Conclusions**:

	1.	Probably there is a sense to use Java on the client. But
definitely not on the server.

	**Decisions**:

	1.	At first, we can plug into Python available modules in Java.
	2.	Take the code from projects in Java and port it to Python.

*	**Object Pascal** (in implementation of Free Pascal)

	It is the language of enough low level comparable with C/C++, but
not with Python.

	**Advantages**:

	*	The broadest list of natively supported hardware and software
platforms

	*	Possibility to use libraries in C

	*	There are available implementations of neural networks and some
numerical algorithms.

	**Disadvantages**:

	*	Pascal is a dying language

	*	Free Pascal is developed inactively. Fixes of bugs are happened
with significant latency

	*	There are no known available high-level libraries for finances
or mathematics

*	**Erlang**

	(It was proposed by one commenter)

	*	I'm not familiar with this language in details. I can't imagine
where in the project we could use it.
	*	License (Erlang Public License) is incompatible with GPL.


### Supporting languages

Python is not the only language that is used for financial and
scientific software. Since we plan to reuse code from other projects
that can also be projects in other languages.

*	**R**

	**Similarities with Python**:

	*	Actively used in scientific community
	*	Official repository of packages:
<http://cran.r-project.org/>.

	**Differences from Python**:

	*	Python is general-purpose language, R is the language for
statistical data processing
		R doesn't allow to develop full application and hasn't a lot of
other features of data analysis besides statistical.
	*	Quality of plots made in Python (via
[Matplotlib](<%= @items["/en/existing_products/"].path %>#Matplotlib)),
beats R
	*	R (in my opinion) has more complicated syntax than Python
	*	Development of own packages is more difficult than in Python

*	**Perl**

	**Advantages**:

	*	Official repository of packages: <http://www.cpan.org/>. There
is some number of modules for financial computations.

	**Disadvantages**:

	*	There is no ready free native implementation for Windows
		*	[In December 2013 ActiveState made ActivePerl non-free](http://adpgtech.blogspot.ru/2013/12/activestate-make-activeperl-non-free.html).
		*	Strawberry Perl is being built with GCC
		*	It is possible to
[build by ourselves](http://habrahabr.ru/post/78034/)

**Decisions for listed languages**:

1.	Depending on specific task:

	*	Plug into Python available modules in other languages, or
	*	Port the code to Python.


### Modular architecture

Modular architecture allows to write separate modules in different
languages, compare implementations by speed, cut out some
implementations and put in others. So, the choice of the languages can
be not ultimate.


### Interaction between languages, JIT compilers

Items are grouped by primary (calling) language. The list is intended
for first acquaintance and is not exhaustive.

*	**Python**

	More comprehensive lists:

	*	<https://wiki.python.org/moin/IntegratingPythonWithOtherLanguages>
	*	<http://web.archive.org/web/20071108024137/http://www.thinkware.se/cgi-bin/thinki.cgi/UsingPythonWithOtherLanguages>

	*	<a name="PythonCompilers"></a>compilers

		*	[Cython](http://cython.org/)
		*	<a name="PyPy"></a>[PyPy](http://pypy.org/) — alternative
implementation of the Python language (2.7 and 3.2) with JIT compiler
		*	[Psyco](http://psyco.sourceforge.net/) — now unmaintained
and dead. Offers to look at [PyPy](#PyPy)
		*	[Pymothoa](http://code.google.com/p/pymothoa/) — inactive
because author have joined forces with the [Numba](#Numba) team
		*	<a name="Numba"></a>[Numba](https://github.com/numba/numba)
— NumPy-aware dynamic Python compiler using [LLVM](#LLVM)
		*	Py2C: [1](https://code.google.com/p/py2c/),
[2](https://github.com/pradyun/Py2C) — Python to pure C/C++ translator
(converter)

		It it still in development and, unfortunately,
[won't deal with external modules in near future](https://groups.google.com/forum/#!topic/py2c-discussion/5YOy4m7T-ks).
	*	[LLVM](#LLVM)

		*	llvmpy: [1](http://www.llvmpy.org/),
[2](https://github.com/llvmpy/llvmpy) — Python bindings for
[LLVM](#LLVM). Fork/update of [llvm-py](#llvm-py)
		*	<a name="llvm-py"></a>
[Llvm-py](http://www.mdevan.org/llvm-py/) — Python bindings for
[LLVM](#LLVM). Inactive

	*	C

		*	[CFFI](https://cffi.readthedocs.org/) — Foreign Function
Interface for Python calling C code

	*	R

		*	[RPy](http://rpy.sourceforge.net/)

	*	Java

		*	[JPE](http://jpe.sourceforge.net/) — Java access to Python's
native extension, and Java's Swing to Python developers
		*	[JPype](http://jpype.sourceforge.net/)
		*	[PyJava](https://github.com/remram44/pyjava) — C extension
that uses [JNI](#JNI)
		*	[javabridge](https://pypi.python.org/pypi/javabridge) —
Python wrapper for the [JNI](#JNI)

	*	.NET

		*	[PythonNet](http://pythonnet.sourceforge.net/)

	*	Perl

		*	PyPerl: [1](https://wiki.python.org/moin/PyPerl),
[2](http://en.wikibooks.org/wiki/Python_Programming/Extending_with_Perl)
and subsequent links

*	**R**

	*	C++

		*	[Rcpp](http://cran.r-project.org/web/packages/Rcpp/)

	*	Python

		*	[rPython](http://cran.r-project.org/web/packages/rPython/)

	*	Java

		*	<a name="rJava"></a>[rJava](http://rforge.net/rJava/)

*	**Java**

	*	Python

		*	[Jython](http://www.jython.org/) — Python for the Java
Platform
			Doesn't support Python 3.
		*	[JyNI](http://jyni.org/) — Jython Native Interface. Enables
Jython to use native CPython extensions like NumPy or SciPy
		*	[JPE](http://jpe.sourceforge.net/) — Java access to Python's
native extension, and Java's Swing to Python developers
		*	[Jepp](http://jepp.sourceforge.net/)

	*	R

		*	[JRI](http://rforge.net/JRI/), now it's part of
[rJava](#rJava)

*	**.NET**

	*	Python

		*	IronPython: [1][http://ironpython.net/],
[2][https://ironpython.codeplex.com/] — implementation of Python 2.6 for
.NET.

			Doesn't support Python 3.

*	**PostgreSQL**

	*	Python

		*	[PL/Python](http://www.postgresql.org/docs/9.3/static/plpython.html)
(included)
		*	[pg-python (aka PL/Py)](http://python.projects.pgfoundry.org/backend/)

	*	Perl

		*	[PL/Perl](http://www.postgresql.org/docs/9.3/static/plperl.html)
(included)

	*	TCL

		*	[PL/TCL](http://www.postgresql.org/docs/9.3/static/pltcl.html)
(included)

	*	R

		*	[PL/R](http://www.joeconway.com/plr/)

	*	Java

		*	[PL/Java](http://pljava.projects.pgfoundry.org/)

	*	Ruby

		*	PL/Ruby: [1][http://rubyforge.org/projects/plruby/],
[2][https://github.com/knu/postgresql-plruby]

	*	PHP

		*	[PL/PHP](http://www.commandprompt.com/community/plphp/)

	*	sh
		*	[PL/sh](https://github.com/petere/plsh)

*	**Perl**

	*	The Perl Compiler: [1][http://www.perl-compiler.org/],
[2][https://code.google.com/p/perl-compiler/] — compiles to C or
platform-compatible Bytecode

	*	Python

		*	[Inline::Python](http://search.cpan.org/dist/Inline-Python/)

*	**Lua**

	*	C

		*	[LuaJIT’s FFI](http://luajit.org/ext_ffi.html) — allows
calling external C functions and using C data structures from pure Lua
code

*	[**SWIG**](http://www.swig.org/) — connects programs written in C and
C++ with variety of high-level programming languages

	Supported languages: Tcl, Python, Perl, Java (incl. Android), Ruby,
PHP, Ocaml, C#, Modula-3, Lua, CLISP, Common Lisp with UFFI, R, Octave,
Go, D and others.

	Is known for its slowness.

*	<a name="LLVM"></a>[**LLVM**](http://llvm.org/) — a collection of
modular and reusable compiler and toolchain technologies.

*	<a name="JNI"></a>
[**Java Native Interface (JNI)**](http://en.wikipedia.org/wiki/Java_Native_Interface)

*	[**Python Native Interface**](http://jpype.sourceforge.net/pni.html)
(project)


Source code
-----------

*	**Version control system**: Git

*	**Hosting of source code**: [GitHub](https://github.com/)

	FIDATA organization on GitHub: <https://github.com/FIDATA/>

A lot of third-party libraries that we need are already hosted on
GitHub. We simply make forks for them. Some are already made.

Other projects can use other version control systems (Mercurial, Bazaar,
Subversion, CVS). For them we should create forks on GitHub.

For all forks periodical synchronization with source repository is
required.


Building process and code organization
--------------------------------------

![Процесс сборки](<%= @items["/#{@item[:lang]}/images/building_process/"].path %>)

We will use build systems designed for Java in order to build non-Java
projects. To avoid confusion I use the following terminology:

*	**Artifact** — one or some files that are required for compilation
of code from other repository. Artifacts are intended for developers
only.
	For C/C++ artifact can be a compiled library with header and object
files.

	Artifacts are classified by version, compiler, target platform,
compilation options etc. Some modules require artifacts of source code.

*	**Module** — one or some files intended for deployment on end-user
machine.
	Primarily modules contain executables and data files.

	Module can be created from one or some artifacts.

	Description of modules as long as description of artifacts include
the list of dependencies.

	Modules are classified by version and target platform.

Artifacts and modules should be big enough so not to unduly increase
number of them and small enough to exactly satisfy dependencies.

**Repositories**, in general, are created by modules.

Build system
------------

![Build system](<%= @items["/#{@item[:lang]}/images/build_system/"].path %>)

1.	**Continuous integration server**: Jenkins

2.	**Main build system**: Maven or Gradle

	All other tasks are run from this one.

	Firstly I planned Maven. However, some modules I've already started
under Gradle.

3.	**For projects in C/C++**:

	1.	Build system: CMake

	2.	Compiler:

		Initial plan was:

		*	Windows — Visual C++ 2013 (MSVC 12.0)
		*	GNU/Linux — GCC (the most fresh stable version is 4.9.0)

		Since the platform itself
[should have feature for code compilation](<%= @items["/#{@item[:lang]}/architecture/"].path %>#problem_compilation),
it is worth to consider other compilers. I look at
[clang](http://clang.llvm.org/). It is cross-platform compiler,
compatible with GCC and comparable with it by speed. clang is also
binary compatible with MSVC 2012 (11.0). It is a part of the project
[LLVM](#LLVM), which also has interfaces for Python.

4.	**Building of documentation**:

	*	Python: TODO
	*	TeX — LuaLaTex + Latexmk
	*	Conversion between formats:
[pandoc](http://johnmacfarlane.net/pandoc/)

5.	**Unit testing**:

	*	Python: TODO
	*	C/C++: TODO
	*	PostgreSQL:
		*	[Epic](http://epictest.org/)

6.	**Inspection of code quality**:

	*	SonarQube
	*	Tests for compliance to PEP 8
	*	[Clang Static Analyzer](http://clang-analyzer.llvm.org/)

7.	**Binary artifacts repository**: Artifactory

8.	**Production of modules**:
[Qt Installer Framework](http://qt-project.org/wiki/Qt-Installer-Framework)

9.	**Modules repository**: file hosting with http, ftp, sshd


Integrated development environment
----------------------------------

I prefer:

*	Eclipse — for general development

	In [this repository](https://github.com/FIDATA/dev-toolkit) there
are links to custom configuration of Eclipse and additional plugins.

*	[Eric](http://eric-ide.python-projects.org/) — for Python + Qt


Formats of documentation
--------------------

*	multi-page и one-page HTML — for placement on the website
*	CHM — for Windows
*	PDF
*	MarkDown — for GitHub
*	GNU/Linux: TODO
*	OS X: TODO


Links for developers
--------------------

*	**Official website**: <http://fidata.org/>

	In official website:

	*	description and official documentation of the project
	*	official documentation of modules (it is compiled and saved in
gh-pages branches)

	In GitHub Wiki (TODO):

	*	documentation for developers
	*	notes, thoughts, ideas

*	**Bug tracker**:

	*	Open: GitHub
	*	Closed (if will be needed): [Mantis](http://grv87.ftp.sh/bugs/)

*	**Jenkins installations**:

	*	Ubuntu: <http://jenkins-ubuntu.fidata.org/>
	*	Windows 7 x64: <http://grv87.ftp.sh:8082/> (temporary)
	*	Other platforms: TODO

*	**SonarQube**: <http://grv87.ftp.sh:9000/>

*	**Artifactory**: <http://artifactory.fidata.org/>

*	**Modules repository**: <http://modules.fidata.org/> (TODO)

P.S. grv87.ftp.sh is the DDNS address of my home computer. It is
temporary decision. Please, don't abuse that. Also, although my PC is
usually switched-on 24/7, it is not
[highly available](http://en.wikipedia.org/wiki/High_availability). I
can have maintenance hours and power and network outages.


Additional reading
------------------

### Modular software
*	<http://qconlondon.com/dl/qcon-london-2013/slides/BaruchSadogursky_ManagingModularSoftwareForYourNuGetCAndJavaDevelopment.pdf>

### Comparison of binary artifacts repositories
*	<http://docs.codehaus.org/display/MAVENUSER/Maven+Repository+Manager+Feature+Matrix>
