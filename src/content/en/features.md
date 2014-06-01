---
title: Features
author: Basil Peace
copyright: Copyright © 2014  Basil Peace
---

Features
========

Usage of FIDATA at different stages of trading
----------------------------------------------

1.	**Data analysis**

	Software that is presently used at this stage:

	*	Spreadsheets (read Excel) — for elementary computations
	*	Software for technical analysis
	*	Statistical and mathematical software

	Data that can be analyzed:

	*	time series of prices of trading financial instruments
themselves

	*	other data affecting prices:

		*	prices of other financial instruments
		*	macroeconomic data on countries, regions and the world
		*	data about issuers

		and so on.

		Everything that helps better predict prices can be analyzed:
routes of migration of elephants, astrological data and so on.

	Some types of analysis (the list is not exhaustive):

	*	Technical analysis:

		*	Numerical
		*	Graphical
		*	Analysis of candlestick configuration

	*	Statistical analysis

	*	Regression analysis

	*	Evaluation of financial models (for determination of probability
distributions of future prices and/or fair prices)

	*	Construction of neural networks

	Deficiency of existing products is that they are bound to specific
methods of data analysis and/or specific types of data.

	FIDATA platform will have versatile architecture in that any data
can be analyzed by any method. Comparing to existing classes of software
FIDATA is statistical platform with built-in financial primitives and
features of technical analysis.

	This stage can produce output sets of data for usage in robot/TS:

	*	Regression model
	*	Neural network

	Obviously, problems of data analysis are demanded not only by
traders but also by scientists, economists, analysts.

2.	**Development of TS**

	Two approaches:

	*	writing of code
	*	graphical development (for example,
[TSLab](<%= @items["/en/existing_products/"].path %>#TSLab))

	Code is written in both general-purpose languages (C++, C#, Python
and so on) and specialized languages. More info at
[Languages for development of robots and TS](<%= @items["/#{@item[:lang]}/DSL/"].path %>).

	As much as it will be possible, FIDATA will support both coding of
TS and graphical development.

	Thanks to modular architecture platform will be able to support
several languages.

	Libraries provided by FIDATA platform for development of robots:

	*	receiving of any data (if there are providers)
	*	trading, placing orders
	*	computation of indices showing dynamics (revenues and so on),
indicators of technical analysis, numerical characteristics of empirical
distributions in a moving window, moving separation of mixtures
	*	usage of estimated regression models and adjustment
	*	usage of trained neural networks and additional training
	*	usage of fuzzy logic
	*	analysis of non-numeric data
	*	usage of prepared expert system
	*	statistical quality control

3.	**Testing and optimization of robot/TS**

	How it will be organized in FIDATA:

	1.	Compilation of the code into executable file.

		The compiled robot is the ready, self-sufficient program that
can be immediately run for real work on the market.

		Besides code the robot has input set of data (parameters) and
settings for connection to the trade organizer.

	2.	Launch of the compiled code on the server.

	3. Testing on historical data:

		1.	The robot subscribes for data and indices.

		2.	The server computes values of indices on the entire test
sample on GPU (here calculated values can be cached and/or saved back to
DB).

		3.	The platform intercepts calls to functions of receiving data
and substitute model time, historical data and computed values of
indices.

		4.	The platform intercepts calls to trading functions and
keeps accounting of portfolio balances by instruments (including
currencies) and accounts of income-expense.

	4.	Testing on online data:

		1.	Platform intercepts only calls to trading functions.

		2.	Data are received from read data provider.

			Details of architecture are
[still under the question](<%= @items["/#{@item[:lang]}/architecture/"].path %>#problem_online_data)).

		3.	Data analysis is performed (primarily) without using GPU.

	5.	Simulation modeling.

		Platform is able to perform some set of artificial tests to
examine behavior of the robot/TS in some hypothetical scenario (e.g.
in sharp collapse of the market).

	6.	Analysis of results.

		Platform compute indicators of behavior of TS during time,
analyzes their probability distributions (it's required for statistical
quality control).

		Client receives and displays results of analysis in numerical
and graphical forms.

	7.	TS optimization.

		Platform searches for optimal values of parameters for
optimization of some target function (average yield, its variance and
so on).

	8.	Report generation.

		For a given template platform can generate beautiful report for
presentation to potential investors.

	Performance of trading system on historical data is more important
than on online data.

4.	**Trading**

	Manual and machine trading base on the same code.

	*	Access to trading:

		*	There are
[existing trade terminals](<%= @items["/en/existing_products/"].path %>#trading_terminals)

		*	Various exchanges, brokers and dealing centers provide
access to trading via various terminals.

		*	Targets for the first stage: MetaTrader, QUIK.

		*	Some client libraries exist in the project
[StockSharp](<%= @items['/en/existing_products/'].path %>#StockSharp).
They are written in C# and released under GPLv3. We can port them.

		*	For terminals with closed source we have to do reverse
engineering and make own open implementation of client.

		*	Development of own server side for trade organizer
[is not our task](<%= @items["/#{@item[:lang]}/requirements/"].path %>#no_trade_organization).

	*	Analysis of online data (computation and plotting of indicators
in real time) is performed the same way as analysis of online data in
robots.


Features of the platform
------------------------

This is the maximum program, not everything will be available right
away.

*	Receiving data:

	*	receiving real data from providers

	*	import of data from existing formats

*	Storage of time series and provenance

*	Storage, viewing and editing objects of metadata:

	*	updateable DB of stock exchanges, financial instruments, data
providers and so on

	*	storage of user objects

	*	translation of names to user's language

*	Transformation and computation of time series:

	*	gluing time series

	*	aggregation of moment time series into interval, enlargement of
timeframe

	*	computation of indices showing dynamics (revenues and so on),
indicators of technical analysis, numerical characteristics of empirical
distributions in a moving window, moving separation of mixtures

	*	computation of values of stock indices by known algorithms

*	Data analysis:

	*	graphical analysis

		*	various charts:

			*	linear
			*	equivolume
			*	bars (HLC, OHLC, OC)
			*	candlesticks
			*	renko
			*	kagi
			*	point and figure
			*	volume and equivolume candlesticks
			*	three line breaks

			(in sum, all known types including exotic)

		*	methods of graphical analysis:

			*	lines, levels, channels
			*	levels of Fibonacci, arcs of Fibonacci

			and so on

	*	statistical analysis (of any data)

		*	tests of statistical hypotheses

		*	fitting probability distributions

		*	correlation analysis

		*	component analysis

		*	factor analysis

		*	multidimensional classification (cluster analysis,
discriminant analysis)

	*	econometrical analysis

		*	building of econometrical models (regression analysis) and
assessment of their quality

		*	tests for prerequisites of econometrical analysis

		*	analysis of panel data

	*	analysis of macroeconomic data

		*	SNA

		*	statistical groups by M.49

	*	engineering neural networks

	*	estimation of pricing models of financial instruments

		*	binomial, trinomial trees

		*	CAPM

		*	Black-Scholes model

		*	models of interest rates

		(in sum, all known models will exist)

	*	estimation of models of order book

	*	analysis of non-numeric data (for example, linguistic —
newsfeed, names of companies, tickers)

	*	development of expert system

	*	(probably) spreadsheets

*	Development of TS:

	*	editing TS (graphical form + code)

	*	compilation of TS

*	Testing and optimization of TS

	*	accounting by portfolio

	*	testing and optimization of TS on historical data

	*	testing and optimization of TS on real data

	*	training neural networks

	*	usage of genetic algorithms during optimization

	*	simulation modeling, quote generation, support of hardware RNGs

*	Receiving results of data analysis and testing TS

	*	viewing

	*	generation of reports by templates

*	Trading in manual mode

	*	receiving real data

	*	displaying charts and indicators of TA

	*	usage of advisers

	*	trading terminal
