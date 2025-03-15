CREATE TABLE User (
    user_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone_number VARCHAR(20) UNIQUE,
    user_type ENUM('customer', 'support', 'admin') NOT NULL,
    city VARCHAR(100),
    password_hash VARCHAR(255) NOT NULL,
    registration_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    account_status ENUM('active', 'inactive') NOT NULL DEFAULT 'active',
    CHECK (email IS NOT NULL OR phone_number IS NOT NULL),
    CHECK (email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$' OR email IS NULL),
    CHECK (phone_number REGEXP '^[0-9]{10,15}$' OR phone_number IS NULL)
);

CREATE INDEX email_pass_idx 
ON User (email, password_hash);

INSERT INTO User 
VALUES (1, 'Ali', 'Prs', 'test@test.com', 09032948208,
 'customer', 'Ardebil', '11f0f5d8293fd1d996210e49d4642dadb6c1463ff9c47c888d45d4a1fb47eb6a',
 '2024-10-4 13:10:19', 'active');

INSERT INTO User 
VALUES (2, 'Mehdi', 'Salman', 'test2@test2.com', 09938634069,
 'customer', 'Tehran', '71a5f574ff500816cea8b3d5fd8555dbee7493773f04870217a111984c0fc13f',
 '2024-10-4 13:20:39', 'active');

SELECT * FROM user 
WHERE  first_name = 'Ali';

SELECT * FROM user 
WHERE  phone_number = '9938634069';
