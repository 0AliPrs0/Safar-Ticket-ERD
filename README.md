# 🚀 SafarTicket - Travel Reservation System

## 📖 Overview
Welcome to **SafarTicket**, a comprehensive platform for booking domestic travel tickets, including **trains**, **buses**, and **airplanes**. With SafarTicket, users can easily find and book the best travel options in just a few clicks.

## 🛠️ Technologies Used
- **Database:** MySQL
- **ERD Design:** [Lucidchart](https://lucid.app/documents/#/home)

## 📋 Database Schema
You can view the diagram via the link below:

[🔗 View ER Diagram](https://lucid.app/lucidchart/d58bbffb-0eed-4062-bd9c-fb75394c9f8e/edit?invitationId=inv_2a92ef1f-2e1d-4909-9176-9543f1d1c5b2&page=0_0#)

---

## 📖 Table of Contents 
- [🗄 Tables](#-tables)  
- [🔗 Relationships](#-relationships)  
- [⚡️ Indexes](#-indexes)  
- [🚀 Usage](#-usage)  

---

## 🗄 Tables

### 👤 User Management
- `user` → Stores authentication data (first_name,last_name, city, email, phone_number, password_hash, user_type, account_status, registration_data).   
- `report` → Logs user reports and admin responses. (user_id, ticket_id, report_category, report_text, status, report_time) 

### 🎟 Reservation & Ticketing
- `reservation` → Manages reservations (user_id, ticket_id, status, reservation_time, expiration_time).  
- `ticket` → Holds ticket details (travel_id, seat_number).  
- `payment` → Manages payment transactions (user_id, reservation_id, amount, payment_method, payment_status, payment_date).   

### 🚏 Travel Information
- `travel` → Store travel data (transport_type, departure, destination, depature_time, arival_time, total_capacity, transport_company_id, travel_class, remaining_capacity, price, is_round_trip) 

### 🚍 Vehicles 
- `vehicleDetail` → Stores vehicle details (ticket_id, vehicle_type).  
- `bus, train, airplane` → Store specific details for each vehicle type.  

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
