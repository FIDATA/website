---
title: Trading
author: Basil Peace
copyright: Copyright © 2014  Basil Peace
---

Trading
=======

This page contains information that concerns development of the project
and can be useful for people not familiar with trading.

Approaches to trading
---------------------

*	Trading by intuition — is not interesting for us

*	Mechanical trading — the subject of our interest

	<table><thead>
		<tr>
			<td>Type of trading</td>
			<td>Implementation of TS</td>
			<td>Who analyses the market?</td>
			<td>Who makes decisions and enters into transactions?</td>
		</tr>
	</thead><tbody>
		<tr>
			<td>Manual mechanical trading</td>
			<td>Mechanical trading system</td>
			<td>Trader</td>
			<td>Trader</td>
		</tr>
		<tr>
			<td>Semiautomatic trading</td>
			<td>Adviser</td>
			<td>Machine</td>
			<td>Trader</td>
		</tr>
		<tr>
			<td>Fully automatic trading</td>
			<td>Robot</td>
			<td>Machine</td>
			<td>Machine</td>
		</tr>
	</tbody></table>

Scientific and empirical view on trading
----------------------------------------

*	Trading is the method of empirical test of hypotheses of specific
form.
*	In trading we test hypotheses about existence of outrunning
correlation between information known at some point of time and future
movements of prices of financial instruments.
*	Hypothesis is formulated in the form of trading system.
*	Hypothesis can't be proved  but can be rejected (criterion of
falsifiability).
*	Results of tests of hypothesis are expressed in monetary terms or in
percentage yields. So we have not only criterion for rejection of any
hypothesis but also numerical criteria for measuring of preference of
one hypothesis to another.
*	No number of successes proves trueness of hypothesis.
*	Unsuccessfulness of TS on historical data falsifies hypothesis.
*	Unsuccessfulness of TS on real data falsifies hypothesis.
Stop-losses and constant statistical quality control protect from
ruinous black swans.
*	Until hypothesis is falsified it is used for trading with a purpose
of falsifying.
*	After falsifying of a hypothesis a trader formulates a new one. New
hypothesis should succeed where the previous succeeded (work in the same
historical data) and where the previous failed. Usually new hypothesis
generalizes the previous including that as a special case. This can be
done by introduction of structural shift or introduction of
non-stationarity of variables supposed stationary before.

### Literature

1.	Karl Popper. *Objective Knowledge: An Evolutionary Approach*.
2.	Nassim Nicholas Taleb. *The Black Swan. The Impact of the Highly
Improbable*.

#### <a name="SQC_in_trading"></a>Statistical quality control in trading

1.	Andrew Kumiega, Benjamin Van Vliet. *Quality Money Management*.
2.	Andrew Kumiega, Ben Van Vliet. A Software Development Methodology
for Research and Prototyping in Financial Markets. URL:
<http://arxiv.org/abs/0803.0162>.
3.	Andrew Kumiega. Software project management for building high
frequency trading systems // Northwestern University, MSIT Tribune
Presentation. 2011, November 12. URL:
<https://www.infotech.northwestern.edu/KumiegaNorthwestern.ppt>.

Algorithm of trading
--------------------

![Algorithm of trading](<%= @items["/#{@item[:lang]}/images/algorithm_of_trading/"].path %>)

More precisely, work of trader is organized on spiral model. See more on
this topic in the literature about statistical quality control in
trading (the list is [above](#SQC_in_trading)).
