# ✈️ SafarTicket - Travel Reservation System

## 🌟 Overview
Welcome to **SafarTicket**, your ultimate companion for booking domestic travel tickets, including **trains**, **buses**, and **airplanes**. With SafarTicket, users can effortlessly find and book the best travel options in just a few clicks. Whether you're planning a quick getaway or a long journey, SafarTicket ensures a seamless and enjoyable booking experience.

## 🛠️ Technologies Used
- **Database:** MySQL
- **ERD Design:** [Lucidchart](https://lucid.app/documents/#/home)

## 📋 Database Schema
You can view the diagram via the link below:

[🔗 View ER Diagram](https://lucid.app/lucidchart/d58bbffb-0eed-4062-bd9c-fb75394c9f8e/edit?invitationId=inv_2a92ef1f-2e1d-4909-9176-9543f1d1c5b2&page=0_0#)

---

## 📖 Table of Contents 
- [📊 Tables](#-tables)  
- [🔗 Relationships](#-relationships)  
- [⚡️ Indexes](#-indexes)  
- [🚀 Usage](#-usage)  

---

## 📊 Tables

### 👥 User Management
- `user` → Stores authentication data (first_name, last_name, city, email, phone_number, password_hash, user_type, account_status, registration_date).   
- `report` → Logs user reports and admin responses. (user_id, ticket_id, report_category, report_text, status, report_time) 

### 🎫 Reservation & Ticketing
- `reservation` → Manages reservations (user_id, ticket_id, status, reservation_time, expiration_time).  
- `ticket` → Holds ticket details (travel_id, seat_number).  
- `payment` → Manages payment transactions (user_id, reservation_id, amount, payment_method, payment_status, payment_date).   

### 🚉 Travel Information
- `travel` → Store travel data (transport_type, departure, destination, departure_time, arrival_time, total_capacity, transport_company_id, travel_class, remaining_capacity, price, is_round_trip) 

### 🚗 Vehicles 
- `vehicleDetail` → Stores vehicle details (ticket_id, vehicle_type).  
- `busDetail` → Store specific details for each bus (bus_company, bus_type, facilities, seat_arrangement)
- `trainDetail` → Store specific details for each train (train_rating, private_cabin, facilities)
- `flightDetail` → Store specific details for each flight (airline_name, flight_class, stops, flight_number, origin_airport, facilities, destination_airport)   

---

## 🔗 Relationships

| Table | Related To |
|-----------|---------------|
| `report` | `user` (both user and admin), `ticket` |
| `reservation` | `user`, `ticket` |
| `ticket` |  `travel` |
| `payment` | `reservation`, `user`|
| `vehicleDetail` | `ticket`|
| `BusDetail` | `vehicleDetail` |
| `FlightDetail` | `vehicleDetail` |
| `TrainDetail` | `vehicleDetail` |

---

## ⚡️ Indexes

To enhance query performance, indexes are applied to:  

- ✅ `email`, `password_hash` → in `user` table  
- ✅ `departure`, `destination` → in `travel` table  

---

## 🚀 Usage

This database supports a full-featured travel reservation system, allowing users to:  
✔️ Book tickets  
✔️ Make payments  
✔️ Manage reservations  
✔️ Receive notifications  

---

### **Get Started Today!**
Whether you're planning a quick trip or a long journey, **SafarTicket** is your one-stop solution for all your travel needs. Start exploring and book your tickets now! 🎉
