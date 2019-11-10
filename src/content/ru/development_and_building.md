---
title: Разработка и сборка
author: Basil Peace
copyright: Copyright © 2014  Basil Peace
---

Разработка и сборка
===================

Язык(и) программирования
------------------------

*	Я предлагаю написать бо́льшую часть проекта на Python 3.
*	Так как Python сам по себе достаточно относительно медленный,
критические части (а лучше весь код) надо компилировать, транслировать
или конвертировать в C/C++. См. ниже
[список динамических компиляторов для Python](#PythonCompilers).
*	Проект будет включать некоторую часть кода на C/C++.

Выбор языка — важный и спорный вопрос для разработчиков. Мне поступали
предложения относительно других языков. В отличие от остального сайта,
здесь я приведу подробную аргументацию выбора Python.

**Аргументы "ЗА" Python**:

*	Высокоуровневый язык программирования общего назначения.
*	Открытая реализация.
*	Активно поддерживается и развивается.
*	Равномерно поддерживается на всех популярных десктопных платформах.
*	Активно развивается как язык для научных вычислений.
*	Существует большое количество готовых модулей для финансовых и
научных вычислений, которые можно переиспользовать. Официальный
репозиторий:
[https://pypi.python.org/](https://pypi.python.org/)(:target="_blank").
*	Я изучал вопрос подробно и уверен, что все необходимые нам вещи
возможно реализовать на Python с некоторой долей С/С++.
*	Процедурный язык PL/Python встроен в PostgreSQL. Это может упростить
переиспользование кода.

**Почему Python 3**:

*	Python 3 работает с UTF-8 по умолчанию, что убирает любые проблемы с
кодировками.
*	Большинство пакетов уже портированы на Python 3.


### Рассматривавшиеся альтернативы

Я также рассматривал следующие языки в качестве основного:

*	**C# или другой язык для .NET**

	**Недостатки**:

	*	Закрытость оригинальной реализации и риск патентного
преследования других реализаций

		См. подробнее
[http://www.fsf.org/news/dont-depend-on-mono](http://www.fsf.org/news/dont-depend-on-mono)(:target="_blank").

	*	Риски портируемости

		Хотя существуют проекты
[Portable.NET](http://www.gnu.org/software/dotgnu/pnet.html)(:target="_blank") и
[Mono](http://www.mono-project.com/)(:target="_blank"), нет никаких гарантий, что они
поддерживают все необходимые возможности и 100%-совместимы с
оригинальной реализацией. Например,
[WPF в Mono не реализован и не будет](http://www.mono-project.com/WPF)(:target="_blank").
Поскольку .NET не является свободной платформой, гарантий, что эти
проекты будут развиваться в будущем, так же нет.

		Mono даёт возможность разрабатывать в том числе и под Windows,
но это не избавляет от проблемы №1.

	*	Не самая высокая производительность

		.NET является прослойкой между кодом и процессором, и потому
реализация какого-либо алгоритма на C# будет всегда проигрывать
реализации того же алгоритма на C/С++. Проигрыш, однако, не очень
существенен.
См., например,
[http://www.codeproject.com/Articles/212856/Head-to-head-benchmark-Csharp-vs-NET](http://www.codeproject.com/Articles/212856/Head-to-head-benchmark-Csharp-vs-NET)(:target="_blank").

	**Преимущества**:

	*	Готовые пакеты: [http://www.nuget.org/](http://www.nuget.org/)(:target="_blank").

		По моему ощущению, библиотек для финансовых и научных вычислений
меньше, чем под Python.

	*	Существует готовый активно развивающийся проект
[StockSharp](<%= @items['/en/existing_products/'].path %>#StockSharp). Он
написан на C# и выпускает бесплатную (не самую последнюю) версию под
GPLv3. Он не удовлетворяет всем
[требованиям](<%= @items["/#{@item[:lang]}/requirements/"].path %>), но
мы можем переиспользовать многие куски из него.

	*	Если мы захотим поддерживать F# для написания роботов/ТС,
платформа .NET нам понадобится.

	**Решения**:

	1.	Не разрабатывать ничего под платформу .NET.
	2.	Первое время можно подключать к Python готовые модули под .NET.
	3.	Брать код из проектов под .NET и портировать его под Python.

*	**Java**

	**Преимущества**:

	*	Простота портируемости
	*	Наличие нескольких готовых продуктов для технического анализа,
написанных на Java
	*	Скорость разработки, доступность высокоуровневых абстракций для
многих операций. Например,
[GMP](http://www.eclipse.org/modeling/gmp/)(:target="_blank") — для создания графических
редакторов

	**Недостатки** (я сужу с точки зрения пользователя Windows. Под
GNU/Linux ситуация может быть лучше):

	*	Низкая производительность и большое потребление памяти

		*	Я использую несколько серверных продуктов, написанных на
Java: CollabNet Subversion Edge, Artifactory, SonarQube, Jenkins. Я не
удовлетворён ни их производительностью, ни их потреблением памяти.
		*	Java, как и .NET, — прослойка, замедляющая выполнение кода.

	*	Меньшая безопасность для конечного пользователя

		Антивирусы и брандмауэры, по очевидным причинам, плохо работают
с кодом Java (большинство вообще никак). У меня есть опыт заражения
вирусом через Java. Использование Java поставило бы под угрозу
пользователей продукта и создало бы им неудобства.

	*	Для работы с GPU нам всё ещё необходимы нативные бинарники

	*	(Личное предубеждение, не аргумент) Я не люблю Java и вряд ли
захотел бы участвовать в Java-проекте.

	**Выводы**:

	1.	Возможно, есть смысл использовать Java на клиенте. Но точно не
на сервере.

	**Решения**:

	1.	Первое время можно подключать к Python готовые модули на Java.
	2.	Брать код из проектов на Java и портировать его под Python.

*	**Object Pascal** (в реализации Free Pascal)

	Язык достаточно низкого уровня, сравнимый с C/C++, а не с Pythonом.

	**Преимущества**:

	*	Широчайший список нативно поддерживаемых аппаратных и
программных платформ

	*	Возможность использования библиотек на C

	*	Есть готовые реализации нейронных сетей и некоторых численных
алгоритмов

	**Недостатки**:

	*	Pascal — умирающий язык

	*	Free Pascal развивается неактивно. Исправления багов происходят
со значительной задержкой

	*	Готовые высокоуровневые библиотеки для финансов и математики —
не известны

*	**Erlang**

	(предлагался одним комментатором)

	*	Не знаком с этим языком подробно. Не представляю, в каком месте
проекта его можно было бы использовать.
	*	Лицензия (Erlang Public License) несовместима с GPL.


### Вспомогательные языки

Python не является единственным языком для финансового и научного ПО.
Так как мы планируем переиспользовать код из других проектов, то это
могут быть проекты и на других языках.

*	**R**

	**Сходства с Python**:

	*	Активно используется в научном сообществе
	*	Официальный репозиторий пакетов:
[http://cran.r-project.org/](http://cran.r-project.org/)(:target="_blank").

	**Отличия от Python**:

	*	Python — язык общего назначения, R — язык для статистической
обработки данных
		На R нельзя написать полноценное приложение, и нет многих
возможностей по анализу данных помимо статистического.
	*	Качество графиков, построенных в Python (через
[Matplotlib](<%= @items["/en/existing_products/"].path %>#Matplotlib)),
превосходит R
	*	R (по моему мнению) имеет более сложный синтаксис, чем Python
	*	Создание собственных пакетов сложнее, чем в Python

*	**Perl**

	**Преимущества**:

	*	Официальный репозиторий пакетов: [http://www.cpan.org/](http://cran.r-project.org/)(:target="_blank"). Есть
некоторое количество модулей для финансовых вычислений.

	**Недостатки**:

	*	Нет готовой свободной нативной реализации под Windows
		*	[В декабре 2013 года ActiveState сделала ActivePerl несвободной](http://adpgtech.blogspot.ru/2013/12/activestate-make-activeperl-non-free.html)(:target="_blank").
		*	Strarberry Perl собирается GCC
		*	Возможно
[собрать самостоятельно](http://habrahabr.ru/post/78034/)(:target="_blank")

**Решения для перечисленных языков**:

1.	В зависимости от конкретной задачи:

	*	Подключать к Python готовые модули на других языках, или
	*	Портировать код на Python


### Модульная архитектура

Модульная архитектура позволяет писать различные модули на разных
языках, сравнивать реализации по скорости, выпиливать одни реализации и
вставлять другие. Так что выбор языков может быть неокончательным.


### Взаимодействие между языками, динамические компиляторы

Элементы сгруппированы по основному (вызывающему) языку. Список
предназначен для первого знакомства и не исчерпывающий.

*	**Python**

	Более полные списки:

	*	[https://wiki.python.org/moin/IntegratingPythonWithOtherLanguages](https://wiki.python.org/moin/IntegratingPythonWithOtherLanguages)(:target="_blank")
	*	[http://web.archive.org/web/20071108024137/http://www.thinkware.se/cgi-bin/thinki.cgi/UsingPythonWithOtherLanguages](http://web.archive.org/web/20071108024137/http://www.thinkware.se/cgi-bin/thinki.cgi/UsingPythonWithOtherLanguages)(:target="_blank")

	*	<a name="PythonCompilers"></a>компиляторы

		*	[Cython](http://cython.org/)(:target="_blank")
		*	<a name="PyPy"></a>[PyPy](http://pypy.org/)(:target="_blank") — альтернативная
реализация языка Python (2.7 и 3.2) с динамическим компилятором
		*	[Psyco](http://psyco.sourceforge.net/)(:target="_blank") — сейчас не
обслуживается и умер. Предлагает взглянуть на [PyPy](#PyPy)
		*	[Pymothoa](http://code.google.com/p/pymothoa/)(:target="_blank") — неактивен,
потому что автор объединил свои силы с командой [Numba](#Numba)
		*	<a name="Numba"></a>[Numba](https://github.com/numba/numba)(:target="_blank")
— динамический компилятор Python, использующий [LLVM](#LLVM) и
осведомлённый о NumPy
		*	Py2C: [1](https://code.google.com/p/py2c/)(:target="_blank"),
[2](https://github.com/pradyun/Py2C)(:target="_blank") — транслятор (конвертер) с Python
на чистый C/C++

		Всё ещё в разработке и, к сожалению,
[не будет справляться с внешними модулями в ближайшем будущем](https://groups.google.com/forum/#!topic/py2c-discussion/5YOy4m7T-ks)(:target="_blank").

	*	[LLVM](#LLVM)

		*	llvmpy: [1](http://www.llvmpy.org/)(:target="_blank"),
[2](https://github.com/llvmpy/llvmpy)(:target="_blank") — Python-связка для [LLVM](#LLVM).
Форк/обновление [llvm-py](#llvm-py)
		*	<a name="llvm-py"></a>
[Llvm-py](http://www.mdevan.org/llvm-py/)(:target="_blank") — Python-связка для
[LLVM](#LLVM). Неактивна

	*	C

		*	[CFFI](https://cffi.readthedocs.org/)(:target="_blank") — Foreign Function
Interface для Python, вызывающего код на C

	*	R

		*	[RPy](http://rpy.sourceforge.net/)(:target="_blank")

	*	Java

		*	[JPE](http://jpe.sourceforge.net/)(:target="_blank") — доступ из Java к
нативным расширениям Python, и подключение Java для разработчиков на
Python
		*	[JPype](http://jpype.sourceforge.net/)(:target="_blank")
		*	[PyJava](https://github.com/remram44/pyjava)(:target="_blank") — расширение на
C, использующее [JNI](#JNI)
		*	[javabridge](https://pypi.python.org/pypi/javabridge)(:target="_blank") —
обёртка для [JNI](#JNI) на Python

	*	.NET

		*	[PythonNet](http://pythonnet.sourceforge.net/)(:target="_blank")

	*	Perl

		*	PyPerl: [1](https://wiki.python.org/moin/PyPerl)(:target="_blank"),
[2](http://en.wikibooks.org/wiki/Python_Programming/Extending_with_Perl)(:target="_blank")
и последующие ссылки

*	**R**

	*	C++

		*	[Rcpp](http://cran.r-project.org/web/packages/Rcpp/)(:target="_blank")

	*	Python

		*	[rPython](http://cran.r-project.org/web/packages/rPython/)(:target="_blank")

	*	Java

		*	<a name="rJava"></a>[rJava](http://rforge.net/rJava/)(:target="_blank")

*	**Java**

	*	Python

		*	[Jython](http://www.jython.org/)(:target="_blank") — Python для платформы Java
			Не поддерживает Python 3.
		*	[JyNI](http://jyni.org/)(:target="_blank") — Jython Native Interface.
Позволяет Jython использовать нативные расширения CPython, такие как
NumPy или SciPy
		*	[JPE](http://jpe.sourceforge.net/)(:target="_blank") — доступ из Java к
нативным расширениям Python, и подключение Java для разработчиков на
Python
		*	[Jepp](http://jepp.sourceforge.net/)(:target="_blank")

	*	R

		*	[JRI](http://rforge.net/JRI/)(:target="_blank"), сейчас это часть
[rJava](#rJava)

*	**.NET**

	*	Python

		*	IronPython: [1](http://ironpython.net/)(:target="_blank"),
[2](https://ironpython.codeplex.com/)(:target="_blank") — реализация Python 2.6 для .NET.

			Не поддерживает Python 3.

*	**PostgreSQL**

	*	Python

		*	[PL/Python](http://www.postgresql.org/docs/9.3/static/plpython.html)(:target="_blank")
(включён)
		*	[pg-python (aka PL/Py)](http://python.projects.pgfoundry.org/backend/)(:target="_blank")

	*	Perl

		*	[PL/Perl](http://www.postgresql.org/docs/9.3/static/plperl.html)(:target="_blank")
(включён)

	*	TCL

		*	[PL/TCL](http://www.postgresql.org/docs/9.3/static/pltcl.html)(:target="_blank")
(включён)

	*	R

		*	[PL/R](http://www.joeconway.com/plr/)(:target="_blank")

	*	Java

		*	[PL/Java](http://pljava.projects.pgfoundry.org/)(:target="_blank")

	*	Ruby

		*	PL/Ruby: [1](http://rubyforge.org/projects/plruby/)(:target="_blank"),
[2](https://github.com/knu/postgresql-plruby)(:target="_blank")

	*	PHP

		*	[PL/PHP](http://www.commandprompt.com/community/plphp/)(:target="_blank")

	*	sh

		*	[PL/sh](https://github.com/petere/plsh)(:target="_blank")

*	**Perl**

	*	The Perl Compiler: [1](http://www.perl-compiler.org/)(:target="_blank"),
[2](https://code.google.com/p/perl-compiler/)(:target="_blank") — компилирует в C или
платформо-совместимый байткод

	*	Python

		*	[Inline::Python](http://search.cpan.org/dist/Inline-Python/)(:target="_blank")

*	**Lua**

	*	C

		*	[LuaJIT’s FFI](http://luajit.org/ext_ffi.html)(:target="_blank") — позволяет
вызывать внешние функции на C и использовать структуры данных C из
чистого кода Lua

*	[**SWIG**](http://www.swig.org/)(:target="_blank") — соединяет программы, написанные на C,
с множеством высокоуровневым языков программирования

	Поддерживаемые языки: Tcl, Python, Perl, Java (incl. Android), Ruby,
PHP, Ocaml, C#, Modula-3, Lua, CLISP, Common Lisp with UFFI, R, Octave,
Go, D и др.

	Известна своей медлительностью.

*	<a name="LLVM"></a>[**LLVM**](http://llvm.org/)(:target="_blank") — коллекция модульных и
переиспользуемых технологий для компиляторов и инструментариев

*	<a name="JNI"></a>
[**Java Native Interface (JNI)**](http://ru.wikipedia.org/wiki/Java_Native_Interface)(:target="_blank")

*	[**Python Native Interface**](http://jpype.sourceforge.net/pni.html)(:target="_blank")
(проект)


Исходный код
------------

*	**Система управления версиями**: Git

*	**Хостинг исходного кода**: [GitHub](https://github.com/)(:target="_blank")

	Организация FIDATA на GitHub: <https://github.com/FIDATA/>

Многие сторонние библиотеки, которые нам понадобятся, уже хостятся на
GitHub. Для них просто делаем форки. Некоторые уже сделаны.

Другие проекты могут использовать другие системы управления версиями
(Mercurial, Bazaar, Subversion, CVS). Для них необходимо создать форки
на GitHub.

Для всех форков необходима периодическая синхронизация с исходным
репозиторием.


Процесс сборки и организация кода
---------------------------------

![Процесс сборки](<%= @items["/#{@item[:lang]}/images/building_process/"].path %>)

Мы будем использовать системы сборки, спроектированные для Java, для
не-Java проектов. Чтобы не возникало путаницы, я использую такую
терминологию:

*	**Артефакт** — один или несколько файлов, которые требуются для
компиляции кода из другого репозитория. Артефакты предназначены только
для разработчиков.
	Для С/С++ артефактом будет скомпилированная библиотека вместе с
заголовочными и объектными файлами.

	Артефакты классифицируются по версии, компилятору, целевой
платформе, использованным при компиляции опциям и др. Для некоторых
модулей необходимы артефакты исходного кода.

*	**Модуль** — один или несколько файлов, предназначенных для
развёртывания на компьютере конечного пользователя.
	В основном модули содержат исполняемые файлы и файлы данных.

	Модуль может создаваться из одного или нескольких артефактов.

	Описание модулей, как и описание артефактов, включает в себя список
зависимостей.

	Модули классифицируются по версии и целевой платформе.

Артефакты и модули должны быть достаточно большими, чтобы чрезмерно не
увеличивать их количество, и достаточно маленькими, чтобы точно
удовлетворять зависимостям.

**Репозитории**, в основном, создаются по модулям.


Сборка
------

![Система сборки](<%= @items["/#{@item[:lang]}/images/build_system/"].path %>)

1.	**Сервер непрерывной интеграции**: [Jenkins](http://jenkins-ci.org/)(:target="_blank")

2.	**Основная система сборки**: [Maven](http://maven.apache.org/)(:target="_blank") либо
[Gradle](http://www.gradle.org/)(:target="_blank"). Все остальные задачи запускаются
из-под неё.

	Первоначально я планировал Maven. Однако, несколько модулей я уже
начал под Gradle.

3.	**Для проектов на C/C++**:

	1.	Система сборки: CMake

	2.	<a name="C_CPP_compiler"></a>Компилятор:

		Первоначальный план был таким:

		*	Windows — Visual C++ 2013 (MSVC 12.0)
		*	GNU/Linux — GCC (наиболее свежая стабильная версия 4.9.0)

		Так как платформа сама
[должна иметь возможности для компиляции кода](<%= @items["/#{@item[:lang]}/architecture/"].path %>#problem_compilation),
стоит рассмотреть и другие компиляторы. Я присматриваюсь к
[clang](http://clang.llvm.org/)(:target="_blank"). Это кроссплатформенный компилятор,
совместимый с GCC и сравнимый с ним по скорости. clang также бинарно
совместим с MSVC 2012 (11.0). Он является частью проекта [LLVM](#LLVM),
который так же имеет интерфейсы и для Pythonа.

4.	**Сборка документации**:

	*	Python: TODO
	*	TeX: LuaLaTex + Latexmk
	*	Конвертация между форматами:
[pandoc](http://johnmacfarlane.net/pandoc/)(:target="_blank")

5.	**Unit testing**:

	*	Python: TODO
	*	C/C++: TODO
	*	PostgreSQL:
		*	[Epic](http://epictest.org/)(:target="_blank")

6.	**Проверка качества кода**:

	*	[SonarQube](http://www.sonarqube.org/)(:target="_blank")
	*	Тесты на соответствие PEP 8
	*	[Clang Static Analyzer](http://clang-analyzer.llvm.org/)(:target="_blank")

7.	**Хранилище бинарных артефактов**:
[Artifactory](http://www.jfrog.com/home/v_artifactory_opensource_overview)(:target="_blank")

8.	**Создание модулей**:
[Qt Installer Framework](http://qt-project.org/wiki/Qt-Installer-Framework)(:target="_blank")

9.	**Хранилище модулей**: файловый хостинг с http, ftp, sshd


Интегрированная среда разработки
--------------------------------

Я предпочитаю:

*	Eclipse — для общей разработки

	В [этом репозитории](https://github.com/FIDATA/dev-toolkit) есть
ссылки на кастомизированную конфигурацию Eclipse и дополнительные
плагины.

*	[Eric](http://eric-ide.python-projects.org/)(:target="_blank") — для Python + Qt


Форматы документации
--------------------

*	многостраничный и одностраничный HTML — для размещения на сайте
*	CHM — для Windows
*	PDF
*	MarkDown — для GitHub
*	GNU/Linux: TODO
*	OS X: TODO


Ссылки для разработчиков
------------------------

*	**Официальный сайт**: <http://fidata.org/>

	На официальном сайте:

	*	описание и официальная документация проекта
	*	официальная документация модулей (компилируется и сохраняется в
ветки gh-pages)

	На GitHub Wiki (TODO):

	*	документация для разработчиков
	*	заметки, мысли, идеи

*	**Баг-трекер**:

	*	Открытый: GitHub
	*	Закрытый (если будет необходим):
[Mantis](http://grv87.ftp.sh/bugs/)

*	**Инсталляции Jenkins**:

	*	Ubuntu: <http://jenkins-ubuntu.fidata.org/>
	*	Windows 7 x64: <http://grv87.ftp.sh:8082/> (временная)
	*	Другие платформы: TODO

*	**SonarQube**: <http://grv87.ftp.sh:9000/>

*	**Artifactory**: <http://artifactory.fidata.org/>

*	**Хранилище модулей**: <http://modules.fidata.org/> (TODO)

P.S. grv87.ftp.sh — DDNS-адрес моего домашнего компьютера. Это временное
решение. Пожалуйста, не злоупотребляйте этим. Также, хотя мой ПК обычно
включён 24/7, он не
[высоко доступен](http://ru.wikipedia.org/wiki/%D0%92%D1%8B%D1%81%D0%BE%D0%BA%D0%B0%D1%8F_%D0%B4%D0%BE%D1%81%D1%82%D1%83%D0%BF%D0%BD%D0%BE%D1%81%D1%82%D1%8C)(:target="_blank").
У меня могут быть часы обслуживания и перебои в подаче электроэнергии и
работе сети.


Дополнительное чтение
---------------------

### Модульное ПО
*	[http://qconlondon.com/dl/qcon-london-2013/slides/BaruchSadogursky_ManagingModularSoftwareForYourNuGetCAndJavaDevelopment.pdf](http://qconlondon.com/dl/qcon-london-2013/slides/BaruchSadogursky_ManagingModularSoftwareForYourNuGetCAndJavaDevelopment.pdf)(:target="_blank")

### Сравнение хранилищ бинарных артефактов
*	[http://docs.codehaus.org/display/MAVENUSER/Maven+Repository+Manager+Feature+Matrix](http://docs.codehaus.org/display/MAVENUSER/Maven+Repository+Manager+Feature+Matrix)(:target="_blank")
