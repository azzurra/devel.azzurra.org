---
title: Bahamut Azzurra
kind: project
project_id: bahamut
weight: 10
---

Basato su Bahamut 1.4.34 di [DALnet][], Bahamut Azzurra 4.6e rappresenta
l'ultima evoluzione dell'ircd in uso su Azzurra IRC Network da oltre 8 anni.

**Autori principali:** Marcello Barnaba (vjt), Fabrizio Lanotte (tsk), Daniel Dubois (int)  
**Hanno contribuito:** Gastaman, Shaka  
**Maintainer attuali:** Matteo Panella (morph)  
**Licenza:** GPLv2


Feature principali
------------------

* Cloaking degli hostname
* Channel halfop (mode +h, prefix %)
* Supporto a SSL e IPv6 (solo per connessioni da client)
* Activity logging
* Filtro antispam
* SHUN
* Hostmasking per gli help operator
* Spoofing degli host tramite WEBIRC (supportato da [CGI:IRC][cgiirc], [Mibbit][] e [qwebirc][])
* Supporto per [HAProxy 1.5][haproxy] e [Stud][]

$$$$(haml)= render('_downloads_partial')/$$$$

$$$$(haml)= render('_docs_partial')/$$$$


[DALnet]: http://www.dal.net/?page=Bahamut
[cgiirc]: http://cgiirc.org/
[Mibbit]: http://www.mibbit.com/
[qwebirc]: http://qwebirc.org/
[haproxy]: http://haproxy.1wt.eu/
[Stud]: https://github.com/bumptech/stud
