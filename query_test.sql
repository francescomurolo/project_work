--1. Storico prenotazioni di un passeggero
SELECT
p.id AS id_prenotazione,
p.data_ora AS data_ora_prenotazione,
COUNT(b.id) AS numero_biglietti,
pg.importo,
mp.nome AS metodo_pagamento
FROM prenotazioni p
JOIN biglietti b ON b.fk_prenotazione = p.id
JOIN pagamenti pg ON pg.fk_prenotazione = p.id
JOIN metodi_pagamento mp ON pg.fk_metodo = mp.id
WHERE p.fk_passeggero = 3
GROUP BY p.id, p.data_ora, pg.importo, mp.nome
ORDER BY p.data_ora DESC;

--2. Ricerca tratte da Milano a Roma
SELECT
t.id AS id_tratta,
t.nome AS nome_tratta,
mt.nome AS mezzo,
f_partenza.nome AS fermata_partenza,
f_arrivo.nome AS fermata_arrivo
FROM tratte t
JOIN mezzi_trasporto mt ON t.fk_mezzo = mt.id
JOIN composizioni c1 ON t.id = c1.fk_tratta
JOIN fermate f_partenza ON c1.fk_fermata = f_partenza.id
JOIN composizioni c2 ON t.id = c2.fk_tratta
JOIN fermate f_arrivo ON c2.fk_fermata = f_arrivo.id
WHERE f_partenza.nome = ‘Milano’
AND f_arrivo.nome = ‘Roma’
AND c1.ordine < c2.ordine
ORDER BY t.id;

--3. Calcolo dei posti liberi su una corsa
SELECT
c.id AS id_corsa,
t.nome AS tratta,
m.nome AS mezzo,
m.posti_disponibili,
COALESCE(COUNT(b.id), 0) AS posti_occupati,
m.posti_disponibili - COALESCE(COUNT(b.id), 0) AS posti_liberi
FROM Corse c
JOIN Tratte t ON c.fk_tratta = t.id
JOIN Mezzi_Trasporto m ON t.fk_mezzo = m.id
LEFT JOIN Biglietti b ON b.fk_corsa = c.id
LEFT JOIN Stati_Biglietto sb ON b.fk_stato = sb.id
WHERE c.id = 5 AND sb.nome = ‘valido’
GROUP BY c.id, t.nome, m.nome, m.posti_disponibili;

--4. Elenco dei cambi associati ad un biglietto
SELECT
b1.id AS biglietto_originale,
b2.id AS biglietto_sostitutivo,
b2.data_emissione,
sb.nome AS stato
FROM Biglietti b1
LEFT JOIN Biglietti b2 ON b2.fk_biglietto_sostituito = b1.id
LEFT JOIN Stati_Biglietto sb ON b2.fk_stato = sb.id
WHERE b1.id = 1;

--5. Verifica validità di un biglietto
SELECT
b.id,
sb.nome AS stato,
sb.descrizione
FROM Biglietti b
JOIN Stati_Biglietto sb ON b.fk_stato = sb.id
WHERE b.id = 4;

--6. Fermate associate a una tratta (ordinate)
SELECT
f.nome AS fermata,
c.ordine,
c.ora_arrivo,
c.ora_partenza
FROM Composizioni c
JOIN Fermate f ON c.fk_fermata = f.id
WHERE c.fk_tratta = 4
ORDER BY c.ordine ASC;

