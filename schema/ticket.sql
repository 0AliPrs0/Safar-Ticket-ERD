CREATE TABLE Ticket (
    ticket_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    travel_id BIGINT NOT NULL,
    seat_number INT NOT NULL,
    FOREIGN KEY (travel_id) REFERENCES Travel(travel_id) ON DELETE CASCADE
);

SELECT 
    t.ticket_id,
    t.seat_number,
    tr.remaining_capacity,
    tr.departure_time,
    tr.destination,
    tr.transport_type,
    tr.travel_class
FROM 
    Ticket t
JOIN 
    Travel tr ON t.travel_id = tr.travel_id
ORDER BY 
    tr.departure_time ASC;

