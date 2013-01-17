---
title: Azzurra Services
kind: project
project_id: services
weight: 20
---

Azzurra IRC Services è un pacchetto completo di services IRC in stile DALnet
che fornisce servizi di registrazione e gestione di nick e canali, invio di
memo tra utenti, gestione centralizzata di autokill e Q:line/G:line e altre
funzioni per l'amministrazione di una rete IRC. 

 Originariamente basati su SirvNET Services di Trevor Klingbeil, i services di
 Azzurra sono stati riscritti per oltre il 90% dallo staff della rete,
 adattandoli al protocollo utilizzato dall'ircd di Azzurra e aggiungendo
 funzionalità non presenti nella versione originale. 

**Autori principali:** Gastaman, Shaka, Marco Mura (Wolf7), Mav  
**Hanno contribuito:** Daniel Dubois (int), Vincenzo Iozzo (snagg), Michele Vacca (Sonic)  
**Maintainer attuali:** Matteo Panella (morph)  
**Licenza:** GPLv2


Feature principali
------------------

* Registrazione e gestione di nickname e canali e relative liste di operatori
* Servizi di memorandum
* Controllo automatico cloni
* Gestione AKILL, QLINE, GLINE, ecc.
* Supporto nativo dell'usermode +x di Azzurra
* Supporto multi-lingua
* Protezione interna da flood e registrazioni di massa
* Autenticazione della email di registrazione del nickname necessaria in modo da
  poter garantire un sicuro recupero delle password di nick e canali
* Eliminazione automatica di quei nick registrati ma non autorizzati
* Flag AutoOP/AutoHalfOP/AutoVoice per i canali che permettono di assegnare lo status
  di operatore o di voice a tutti gli utenti del canale senza dover inserire mask
  generiche nelle liste xOP
* Protezioni contro desynch di rete
* Supporto Services Agents esterni
* News e welcome-message


$$$$(haml)= render('_downloads_partial')/$$$$

$$$$(haml)= render('_docs_partial')/$$$$


[DALnet]: http://www.dal.net/?page=Bahamut
[cgiirc]: http://cgiirc.org/
[Mibbit]: http://www.mibbit.com/
[qwebirc]: http://qwebirc.org/
[haproxy]: http://haproxy.1wt.eu/
[Stud]: https://github.com/bumptech/stud
