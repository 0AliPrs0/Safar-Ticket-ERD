CREATE TABLE VehicleDetail (
    vehicle_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    ticket_id BIGINT NOT NULL,
    vehicle_type ENUM('train', 'flight', 'bus') NOT NULL,
    FOREIGN KEY (ticket_id) REFERENCES Ticket(ticket_id) ON DELETE CASCADE
);
