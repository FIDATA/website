﻿#!/usr/bin/env python3
# -*- coding, utf-8 -*-

# Python script to regenerate FIDATA Website whenever new commit is made
# Copyright © 2014  Basil Peace

# This file is part of code for generation of FIDATA Website.

# This work is licensed under the Creative Commons
# Attribution-ShareAlike 3.0 Unported License. A copy of this license is
# located in LICENSE.code.txt. If you haven't received that file,
# visit http://creativecommons.org/licenses/by-sa/3.0/ or send a letter
# to Creative Commons, 444 Castro Street, Suite 900, Mountain View,
# California, 94041, USA.

from subprocess import check_call, check_output, CalledProcessError
import sys
from shutil import which
#from os.path import getmtime
#from datetime import datetime, timedelta

print('Getting last commit message...', flush = True)
commitMsg = check_output(['git', 'log',
	'--max-count=1',
	'--pretty=%B',
]).decode()
print('Testing for tags in commit message...', flush = True)
delim = commitMsg.find(':')
commitTags = commitMsg[0:delim].split(',')
if not (commitMsg.startswith('Merge pull request') or 'CODE' in commitTags or 'CONTENT' in commitTags) or 'OUTPUT' in commitTags:
	exit(0)

# This code tries to find and run Ruby exec depending on platform
def runRubyExecutable(exec_name, args = [], cwd = None):
	exec_name = which(exec_name)
	if exec_name is None: # Nothing was found
		raise FileNotFoundError
	check_call([exec_name] + args, cwd = cwd)

#bundle_update_threshold = timedelta(days = 1)
#try:
#	need_bundle_update = (datetime.today() - datetime.fromtimestamp(getmtime('Gemfile.lock'))) > bundle_update_threshold
#except OSError:
#	need_bundle_update = True
#
#if need_bundle_update:
#print('Updating gems...', flush = True)
#runRubyExecutable('bundle', ['update'])

print('Running nanoc...\n', flush = True)
runRubyExecutable('nanoc', cwd = 'src')

print()
print('Adding changes to the index...', flush = True)
check_call(['git', 'add',
	'-A',
])

print('Commiting...', flush = True)
commitMsg = 'OUTPUT' + commitMsg[delim:]
try:
	commitRes = check_output(['git', 'commit',
		'-m', commitMsg,
	]).decode()
	print(commitRes, flush = True)
except CalledProcessError as e:
	commitRes = e.output.decode()
	print(commitRes, flush = True)
	if 'nothing to commit, working directory clean' in commitRes:
		exit(0)
	else:
		raise

print('Pushing...', flush = True)
check_call(['git', 'push',
	'--set-upstream', 'origin', 'master',
])

print('Done.', flush = True)
