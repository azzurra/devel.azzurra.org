---
title: Bluebox
kind: project
project_id: bluebox
weight: 1
---

Bluebox, il nuovo ircd di Azzurra IRC Network, è un fork di [ircd-ratbox][ratbox] con modifiche
specifiche per l'uso su Azzurra (ad esempio cloaking degli host, halfop, ecc.).

L'ircd è attualmente in fase di sviluppo e sarà presto disponibile in testnet. 

**Autori principali:** Matteo Panella (morph), Fabrizio Lanotte (tsk)  
**Licenza:** GPLv2


Feature principali
------------------

* Possibilità di ricaricare i vari moduli senza dover riavviare l'intero processo
* Cloaking degli hostname
* Channel halfop (mode +h, prefix %)
* Supporto a SSL (client e server)
* Supporto a IPv6 (client e server, compreso il funzionamento dual-stack IPv4/IPv6)


Download
--------

Nessun download disponibile, è possibile ottenere i sorgenti dal [repository][git] del progetto.


$$$$(haml)= render('_docs_partial')/$$$$


[ratbox]: http://www.ircd-ratbox.org/
[git]: https://github.com/azzurra/bluebox
