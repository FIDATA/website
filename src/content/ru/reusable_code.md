---
title: Переиспользуемый код
author: Basil Peace
copyright: Copyright © 2014  Basil Peace
---

Переиспользуемый код и используемые технологии
==============================================

1.	Сервер:

	1.	Сам сервер: [Apache httpd](http://httpd.apache.org/)

		Протокол: HTTPS.

		Дополнительные модули:

		*	Криптография:
[mod_nss](https://git.fedorahosted.org/cgit/mod_nss.git/tree/)
		*	Безопасность: [mod_security](http://www.modsecurity.org/)
		*	Интерфейс шлюза:
[mod_wsgi](http://code.google.com/p/modwsgi/)

	2.	Фреймворк для веб-служб: [Ladon](http://ladonize.org/)

		Протоколы: SOAP и JSON-WSP (выбирается в конфигурации).

		Описание в WSDL.

	3.	Подключение к базе данных:
[psycopg2](https://github.com/psycopg/psycopg2)

	4.	Объектно-реляционный маппер:
[SQLAlchemy](http://www.sqlalchemy.org/)

2.	Системы управления базами данных:

	1.	База метаданных: PostgreSQL

		Собирается с: CPython 3.4, NSS + nss_compat_ossl, ICU.

	2.	Колоночная БД: ??

		Первая идея была использовать
[MonetDB](https://www.monetdb.org/) и foreign data wrapper
[monetdb_fdw](https://github.com/snaga/monetdb_fdw), чтобы встроить её в
PostgreSQL. Недостатки:

		*	Лицензия MonetDB не совместима с GPL (это MPL 1.1 с выбором
применимого права). См.
[обсуждение](https://www.monetdb.org/pipermail/users-list/2014-January/007098.html).
		*	Не понятно, разделяют ли foreign data wrapperы память с
PostgreSQL, или копируют значения. Последнего следует избегать.

3.	Клиент:

	1.	Клиент для веб-службы: TODO

	2.	GUI:

		*	[PyQt](http://www.riverbankcomputing.co.uk/software/pyqt/)
		*	[QtAlchemy](http://qtalchemy.org/) ?

	3.	Построение графиков: [Matplotlib](http://matplotlib.org/)

4.	Криптографическая библиотека:
[Mozilla NSS](https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS)

	*	Лицензия OpenSSL не совместима с GPL
	*	NSS — одна из наиболее продвинутых криптографических библиотек
	*	NSS сертифицирована по FIPS 140-2
	*	Библиотека совместимости с OpenSSL:
[nss_compat_ossl](http://fedoraproject.org/wiki/Nss_compat_ossl)

	Сравнения криптографических библиотек:

	*	<http://curl.haxx.se/docs/ssl-compared.html>
	*	<http://en.wikipedia.org/wiki/Comparison_of_TLS_implementations>

5.	Передача временных рядов с сервера на клиент (для построения
графиков):

	*	Протоколы: [UDT](http://udt.sourceforge.net/) (по умолчанию) и
TCP (резервный)
	*	Сервер:
[GridFTP](http://toolkit.globus.org/toolkit/docs/latest-stable/gridftp/)

6.	Математическые, численные и статистические библиотеки:

	(список для начала)

	*	bottleneck
	*	blas/lapack/atlas implementation
	*	NumPy
	*	SciPy
	*	Pandas
	*	StatsModels
	*	Numexpr
	*	TA-Lib

7.	Общие библиотеки:

	*	zlib

	*	libxml2

	*	libxslt

	*	ICU

	*	Пакеты Python:

		*	six
		*	pytz
		*	python-dateutil

8.	Общая БД часовых поясов
