puppet module for check-mk-agent
================================

check-mk-agent is a general purpose nagios-plugin for retrieving data.
This module will help you to setup and configure check-mk-agent and includes two exemplary (more to come ^_^) check_types. The whole integration really just makes senseif you use all of my modules. 

Basic usage
-----------

To install and configure check-mk-agent:

<pre>
	class {'check_mk_agent':
		xinetd_only_from => [ '192.168.0.1', '192.168.0.2', '192.168.0.3' ],
	}

</pre>

For all options see manifests/init.pp

check_type integration
======================

<pre>
	class {'check_mk_agent::check_types::kernel':
		items => {
			#
			# you can also omit warning/critical .. None is default
			# and means 'only collect data, do not send any alarms'
			#
			pgmajfault => { warning => 'None', critical => 'None' },
			pgpgin	   => { warning => 'None', critical => 'None' },
			pgpgout	   => { warning => 'None', critical => 'None' },
			pswpin	   => { warning => 'None', critical => 'None' },
			pswpout	   => { warning => 'None', critical => 'None' },
			processes  => { warning => 'None', critical => 'None' }
		}
	}
</pre>

or

<pre>
	class {'check_mk_agent::check_types::cpu_loads':
		warning	=> '1',
		critical => '2'
	}
</pre>

Caveats
-------

So far only the check_mk modules 'cpu.loads' and 'kernel' are implemented. More to come! :-)

TODOs
-----

* Make the pari_hash sizing more dynamic (currently statically set to 3)
* add a potential override for the environment detection

Copyright and License
---------------------

Copyright (C) 2012 Patrick Ringl <patrick_@freenet.de>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.


