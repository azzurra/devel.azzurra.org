---
title: "Azzurra Services - Changelog"
kind: documentation
project: services
---

2.2.2
-----

Released on 2010/07/14

* Updated TLD list
* Fixed MODE +o bounce from opless services agents
* Prevent SRAs from keeping chanop in empty registered channels
* Fixed a crashbug in `channels.c:handle_masscmds()`
* Fixed some memory access errors detected by valgrind
* Services now build properly with gcc 4
* Fixed a non-critical buffer overflow in `chan_handle_SJOIN` (thanks to Koper)
* Static Services Master entry is rebuilt upon nick registration if it gets lost
* Removed invalid `Date:` header generation in outgoing mails
* Fixed access MODE handling
* Fixed "drop with authcode 0" bug
* SPAM moved from RootServ to OperServ
* OperServ SPAM actions are now logged
* Fixed channel last_used time reset
* Blacklist now supports usernames with wildcards
* Restored full support for non-blocking blacklist entries
* Reserved channel handling has been fixed
* All chanmodes are now supported (even +j)
* Fixed a nasty memleak in `LIST_DEL_IPv6_USER`
* The infamous IPv6 clone detector has been fixed for good
* Various cosmetic fixes in helpfiles and langfiles


2.2.1
-----

Unreleased internal version (sources lost in space)


2.2.0
-----

Released sometime during 2005-2006 (erroneously marked as version 2.2.3)

* Fixed clone v6 function
* Added chanserv sendcode function for helpop+
* Added chanserv find usable on every list in a channel
* Added chanserv explist on every list in a channel
* Fixed a segfault in rootserv lang reload
* Reduced the high-predicibility of the authentication codes
