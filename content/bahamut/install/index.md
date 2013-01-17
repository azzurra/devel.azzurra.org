---
title: "Bahamut - Guida all'installazione"
kind: documentation
project: bahamut
---

Questa guida spiega come compilare e installare Bahamut. Si presuppone che
l'utente sia in grado di saper utilizzare la shell di un sistema Unix/Linux.

La configurazione dell'ircd ed eventuali operazioni speciali (ad esempio,
configurazione di iptables/pf, impostazione di fdlimit, ecc.) esulano dallo
scopo di questa guida.


Requisiti di sistema
--------------------
{: #requirements}

* Sistema Operativo UNIX-like (testato su Linux e FreeBSD)
* GCC 4.4 o superiore
* OpenSSL 0.9.6 o superiore
* GNU Make


Configurazione dei sorgenti
---------------------------
{: #config}

Dopo aver estratto i sorgenti, entrate nella directory che li contiene e
digitate

    ./configure

oppure

    ./configure --disable-encryption

se non avete OpenSSL installato (non sarete in grado di usare i link cifrati
tra server).

Se configure non riscontra errori, verrà eseguito automaticamente lo script di
configurazione. Lo script vi porrà una serie di domande, proponendo tra
parentesi quadre i valori di default. Premete Invio senza scrivere nulla per
accettarli.

    What are the maximum File Descriptors that the IRCD can use?
    [1024] ->

Indicate il massimo numero di file descriptor disponibili per l'ircd. *Questo
valore non può superare il valore di* `ulimit -n`*, altrimenti l'ircd non si
avvierà!*

    What are the maximum number of Users you
    intend to allow on your IRC server?
    Note that you can now change this number
    on the fly with with /set command.
    [1000] ->

Indicate il numero massimo di *client* che possono connettersi all'ircd.
Il valore può essere modificato dinamicamente usando /set. 

    What is the maximum connection buffer amount?
    Note, this CANNOT exceed the number of file descriptors
    minus the maximum clients.
    [24] ->

Accettate il valore di default oppure impostatelo al numero di fd
disponibili meno il numero massimo di client.

    Do you want an IPv6 Server ?
    [No] ->

Rispondete Yes se volete compilare il supporto per IPv6, vi verrà chiesto
immediatamente che separatore utilizzare per i campi in ircd.conf al
posto di `:`.

Se non è stato disabilitato SSL durante configure, vi verrà posta la
seguente domanda:

    Do you want an SSL Server ? (needs OpenSSL 0.9.6 installed)
    [Yes] ->

Rispondete No se volete disabilitare il supporto per OpenSSL per i client.

    Verifying your system endianness for SHA1 . . done

    What directory are all the server configuration files in ?
    [/tmp/devel/bahamut/] ->

Inserite il percorso assoluto dove risiederà l'ircd aggiungendo una slash
finale.

    Would you like to compile as a HUB?
    [No] ->

Rispondete Yes se volete compilare l'ircd come HUB. In caso contrario non
sarà possibile connettersi a più di un server.

    Would you like to encrypt oper passwords in O:lines?
    [No] ->

Rispondete Yes per cifrare le password delle O:line utilizzando `crypt()`.
**Si consiglia di abilitare questa opzione per gli ircd di produzione.**

Se nella directory di destinazione non è presente `ircd.cloak` vi verrà
chiesto se volete generare una chiave per il cloaking degli host:

    Would you like me to generate a random cloak key (1024 bits) ?
    [Yes] ->

Rispondete Yes *solo ed esclusivamente* se non fate parte di una rete IRC
già esistente, altrimenti al termine della procedura di installazione
copiate nella directory di destinazione il file `ircd.cloak` che vi è stato
inviato dagli amministratori della rete.

Se avete abilitato il supporto per OpenSSL e nella directory di destinazione
non sono presenti certificato e chiave, vi verranno poste una serie di domande
per generare un certificato self-signed.


{: #build}
Compilazione e installazione
----------------------------

A questo punto potete compilare l'ircd utilizzando

    make

oppure

    gmake

su Solaris o altri sistemi operativi il cui make di default non è GNU Make.

Se non ci sono errori di compilazione, potete installare l'ircd utilizzando

    make install

o

    gmake install

a seconda del vostro sistema operativo.

Congratulazioni, avete appena compilato ed installato Bahamut Azzurra!
