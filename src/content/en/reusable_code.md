---
title: Reusable code
author: Basil Peace
copyright: Copyright © 2014  Basil Peace
---

Reusable code and used technologies
===================================

1.	Server:

	1.	Server itself: [Apache httpd](http://httpd.apache.org/)

		Protocol: HTTPS.

		Additional modules:

		*	Cryptography:
[mod_nss](https://git.fedorahosted.org/cgit/mod_nss.git/tree/)
		*	Security: [mod_security](http://www.modsecurity.org/)
		*	Gateway Interface:
[mod_wsgi](http://code.google.com/p/modwsgi/)

	2.	Webservice framework: [Ladon](http://ladonize.org/)

		Protocols: SOAP and JSON-WSP (chosen in configuration).

		Description in WSDL.

	3.	Database connection:
[psycopg2](https://github.com/psycopg/psycopg2)

	4.	Object relational mapper:
[SQLAlchemy](http://www.sqlalchemy.org/)

2.	Database management systems:

	1.	Database of metadata: PostgreSQL

		It's built with: CPython 3.4, NSS + nss_compat_ossl, ICU.

	2.	Column-oriented database: ??

		First idea was to use [MonetDB](https://www.monetdb.org/) and
foreign data wrapper [monetdb_fdw](https://github.com/snaga/monetdb_fdw)
to embed that into PostgreSQL. Flaws:

		*	License of MonetDB is not compatible with GPL (it is
MPL 1.1 with a choice of law). See
[discussion](https://www.monetdb.org/pipermail/users-list/2014-January/007098.html).
		*	It is not clear whether foreign data wrappers share memory
with PostgreSQL or copies values. The latter should be avoided.

3.	Client:

	1.	Webservice client: TODO

	2.	GUI:

		*	[PyQt](http://www.riverbankcomputing.co.uk/software/pyqt/)
		*	[QtAlchemy](http://qtalchemy.org/) ?

	3.	Plotting: [Matplotlib](http://matplotlib.org/)

4.	Cryptographic library:
[Mozilla NSS](https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS)

	*	License of OpenSSL is incompatible with GPL
	*	NSS is one the most featured cryptographic library
	*	NSS is FIPS 140-2 certified
	*	OpenSSL compatibility library:
[nss_compat_ossl](http://fedoraproject.org/wiki/Nss_compat_ossl)

	Comparisons of cryptographic libraries:

	*	<http://curl.haxx.se/docs/ssl-compared.html>
	*	<http://en.wikipedia.org/wiki/Comparison_of_TLS_implementations>

5.	Sending of time series from the server to the client (for plotting):

	*	Protocols: [UDT](http://udt.sourceforge.net/) (by default) and
TCP (reserved)
	*	Server:
[GridFTP](http://toolkit.globus.org/toolkit/docs/latest-stable/gridftp/)

6.	Mathematical, numerical and statistical libraries:

	(list is for the beginning)

	*	bottleneck
	*	blas/lapack/atlas implementation
	*	NumPy
	*	SciPy
	*	Pandas
	*	StatsModels
	*	Numexpr
	*	TA-Lib

7.	Common libraries:

	*	zlib

	*	libxml2

	*	libxslt

	*	ICU

	*	Python packages:

		*	six
		*	pytz
		*	python-dateutil

8.	Common timezone database
