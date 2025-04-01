
-- Inserimento Passeggeri
INSERT INTO Passeggeri (nome, cognome, data_nascita, telefono, email) VALUES
('Luca', 'Rossi', '1990-04-12', '3201234567', 'l.rossi@email.com'),
('Anna', 'Bianchi', '1985-11-25', '3456789123', 'a.bianchi@email.com'),
('Marco', 'Verdi', '1993-07-21', '3391122334', 'm.verdi@mail.com'),
('Giulia', 'Neri', '1998-05-15', '3487788990', 'giulia.neri@mail.com'),
('Elena', 'Russo', '1982-03-02', '3312244667', 'elena.russo@mail.com');

-- Inserimento Metodi di Pagamento
INSERT INTO Metodi_Pagamento (nome, descrizione) VALUES
('Carta di credito', 'Pagamento tramite carta bancaria'),
('PayPal', 'Pagamento tramite account PayPal');

-- Inserimento Stati Biglietto
INSERT INTO Stati_Biglietto (nome, descrizione) VALUES
('valido', 'Biglietto utilizzabile per viaggiare'),
('annullato', 'Biglietto non più valido'),
('sostituito', 'Biglietto sostituito da un altro');

-- Inserimento Mezzi di Trasporto
INSERT INTO Mezzi_Trasporto (nome, codice, posti_disponibili) VALUES
('Bus Interregionale', 'BUS001', 50),
('Treno Regionale', 'TR001', 200);

-- Inserimento Fermate
INSERT INTO Fermate (nome) VALUES
('Milano'),
('Bologna'),
('Firenze'),
('Roma'),
('Parma'),
('Reggio Emilia'),
('Napoli'),
('Torino'),
('Venezia');

-- Inserimento Tratte
INSERT INTO Tratte (nome, durata, fk_mezzo) VALUES
('Milano - Roma via Bologna e Firenze', INTERVAL '4 hours 30 minutes', 2),
('Milano - Bologna Diretto', INTERVAL '2 hours', 1),
('Torino - Napoli via Parma, Bologna, Roma', INTERVAL '7 hours 30 minutes', 2),
('Venezia - Firenze via Bologna', INTERVAL '3 hours 15 minutes', 2);

-- Inserimento Composizioni
INSERT INTO Composizioni (fk_tratta, fk_fermata, ordine, ora_arrivo, ora_partenza) VALUES
(1, 1, 1, NULL, '08:00:00'),
(1, 2, 2, '09:30:00', '09:35:00'),
(1, 3, 3, '10:50:00', '10:55:00'),
(1, 4, 4, '12:30:00', NULL),
(2, 1, 1, NULL, '07:00:00'),
(2, 2, 2, '08:45:00', NULL),
(3, 8, 1, NULL, '06:00:00'),
(3, 5, 2, '07:45:00', '07:50:00'),
(3, 2, 3, '09:00:00', '09:05:00'),
(3, 4, 4, '11:10:00', '11:15:00'),
(3, 7, 5, '13:30:00', NULL),
(4, 9, 1, NULL, '08:15:00'),
(4, 2, 2, '10:00:00', '10:05:00'),
(4, 3, 3, '11:30:00', NULL);

-- Inserimento Corse
INSERT INTO Corse (fk_tratta, data) VALUES
(1, '2025-04-10'),
(1, '2025-04-12'),
(2, '2025-04-11'),
(2, '2025-04-13'),
(3, '2025-04-17'),
(4, '2025-04-19');

-- Inserimento Prenotazioni
INSERT INTO Prenotazioni (fk_passeggero, data_ora) VALUES
(1, '2025-04-01 10:23:00'),
(2, '2025-04-02 14:45:00'),
(3, '2025-04-03 09:00:00'),
(4, '2025-04-04 15:45:00'),
(5, '2025-04-05 11:20:00');

-- Inserimento Pagamenti
INSERT INTO Pagamenti (importo, data_ora, fk_prenotazione, fk_metodo) VALUES
(35.50, '2025-04-01 10:25:00', 1, 1),
(62.00, '2025-04-02 14:47:00', 2, 2),
(45.00, '2025-04-03 09:05:00', 3, 1),
(80.00, '2025-04-04 15:50:00', 4, 2),
(22.50, '2025-04-05 11:25:00', 5, 1);

-- Inserimento Biglietti
INSERT INTO Biglietti (data_emissione, fk_stato, fk_prenotazione, fk_corsa, fk_biglietto_sostituito) VALUES
('2025-04-01', 1, 1, 1, NULL),
('2025-04-02', 1, 2, 3, NULL),
('2025-04-03', 1, 3, 2, NULL),
('2025-04-04', 3, 3, 4, 3),
('2025-04-05', 3, 3, 5, 4),
('2025-04-06', 1, 4, 6, NULL),
('2025-04-07', 2, 5, 1, NULL);
