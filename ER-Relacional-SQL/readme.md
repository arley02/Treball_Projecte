# ENUNCIADO DE LA BASE DE DATOS


Per portar part de la gestió de l’hospital de Blanes sabem que :

* En l’hospital hi treballa personal mèdic (metges/metgesses), personal d’infermeria i personal vari (zeladors, administratius, conductors d’ambulàncies, etc. ). Dels personal mèdic ens interessarà guardar gran quantitat de informació referent als seus estudis, currículum, etc. La informació específica a guardar del personal d’infermeria serà diferent, però també caldrà guardar molta informació. Del personal vari solament ens interessen les seves dades personals i un atribut “tipus feina”.
* Cada membre del personal mèdic té una única especialitat i té assignades una o més persones d’infermeria. Els membres del personal d’infermeria están assignat a un únic metge/ssa o bé, són de planta d’hospital que no estan assignades a cap metge/ssa en particular.
* L’hospital està format per quatre plantes que les identifiquem amb el número de planta (primera, segona, tercera i quarta). A cada planta hi ha diferents habitacions i també pot haver-hi quiròfans. Els quiròfans disposen d’una gran quantitat d’aparells mèdics (respiradors, màquines d’oxigen, etc.). Cada aparell mèdic està assignat a un únic quiròfan i es vol saber quants en hi ha de cada un d’ells a cada quiròfan. Dins de cada planta els quiròfans ens venen identificat per número de quiròfan, el Q1, el Q2 ... i així successivament.
* Els pacients, d’entrada són atesos en una visita realitzada per un metge/ssa. Es possible que en visites posteriors aquest pacients siguin visitats per un altre metge/ssa. Per cada visita caldrà guardar el diagnòstic, així com els medicaments que li ha receptat, si és el cas.
* Es vol portar un control de les visites que els malalts fan a cada metge/ssa. Per això i per cada dia i per cada metge/ssa caldrà saber l’hora de visita de cada un dels seus pacients.
* També es vol portar un control de les reserves d’habitacions dels pacients que cal ingressar. Per això i per cada una de les habitacions es vol saber les reserves que té, és a dir dia previst de ingrés, dia previst de sortida i de quin pacient es tracta.
* Finalment es vol portar un control de cada un dels quiròfans i de les reserves previstes per fer-hi operacions. Per això i per a cada un dels quiròfans, es vol saber per cada dia i hora el metge que el té reservat i el pacient a qui s’operarà. No tots els pacients que són ingressats cal operar-los. Considereu que cada operació la fa un sol metge i que és assistit per varis membres del personal d’infermeria.

**
