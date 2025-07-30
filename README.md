# 📦 UTM Airline Database

A fully normalized PostgreSQL database system designed for a fictional airline booking platform, modeling real-world operations like flight scheduling, staff licensing, ticketing, and receipts.

---

## 🚀 Features

* ✈️ **Flight & Scheduling System**: Accurately models recurring flights, scheduled aircraft, and airport logistics using composite keys and time-based scheduling.
* 👥 **Customer & Staff Profiles**: Captures dynamic airline staff roles and customer loyalty tiers with constraints and enforced relationships.
* 💳 **Transactional Ticketing & Receipts**: Simulates real-world scenarios including multi-ticket purchases, seat assignment, and baggage inclusion using normalized join logic.

---

## 🧱 Tech Stack

| Language | Tools & Libraries    | Infrastructure        |
| -------- | -------------------- | --------------------- |
| SQL      | PostgreSQL, Draw\.io | MCS PostgreSQL Server |

---

## 🔍 Project Overview

This project was developed for the CSC343H5 database systems course at the University of Toronto Mississauga. It was a solo assignment focused on the complete design and implementation of a robust airline database.

* **Modeled after**: Real-world airline operations, with layered relationships between airlines, airplanes, airports, customers, flights, tickets, and staff.
* **Architecture**:

  * ER Diagram created using Chen's Notation in Draw\.io
  * Converted into normalized PostgreSQL schema via DDL
  * Additional logic provided through INSERT, DELETE, and JOIN queries
* **Design decisions**:

  * Used composite keys to uniquely identify scheduled flights
  * Applied CHECK constraints to enforce roles, status tiers, and data validity
  * Reflected role-specific behavior, such as licensing only for managers/pilots

---

## 📊 Performance & Benchmarks

> *Not performance-tested in terms of throughput, but key schema design and logical robustness were demonstrated:*

* ✅ All foreign key dependencies respected and properly sequenced in DDL
* ✅ Insert logic included real-time capture of auto-generated keys using CTE + RETURNING
* ✅ Clean multi-table join approach for resolving data queries from receipts to flights

---

## 📸 Screenshots / Demo

### ERD Snapshot
![UTM Airline ERD](https://github.com/Dam-Sam/UTM-travel/blob/main/Entity%20Relation%20Diagram.png?raw=true)

---

## 🧠 What I Learned

* Became confident with **Chen’s ERD Notation** and how to translate it to SQL DDL
* Learned to handle **composite primary keys**, **many-to-many relationships**, and **cascading deletes**
* Practiced using **PostgreSQL-specific features** like `RETURNING` and `WITH` clauses to manage foreign key dependencies during inserts
* Understood the importance of **data normalization**, role constraints, and designing for **real-world ambiguity**

---

## 🏁 How to Run Locally

```bash
# run the DDL script in PostgreSQL CLI
psql -U your_user -d your_db

# in the prompt
\i a1.ddl
```

> Assumes PostgreSQL is installed. You can also load the schema using PgAdmin or any GUI SQL client.

---

## 🤝 Collaboration & Credits

This project was completed individually as part of **CSC343H5: Introduction to Databases**.

* Assignment by: University of Toronto Mississauga Faculty
* Draw\.io used for ER diagram creation
* PostgreSQL used for relational schema and execution

---
