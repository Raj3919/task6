# task6
# 📌 SQL Subqueries Practice - Mini Library Management System

This project focuses on practicing **subqueries** in SQL using a relational schema built for a **Mini Library Management System**. The goal is to enhance your understanding of **scalar subqueries**, **correlated subqueries**, and **nested subqueries** within `SELECT`, `WHERE`, and `FROM` clauses.

---

## ✅ Objectives

- Use subqueries to extract nested or calculated data
- Implement scalar, correlated, and table-based subqueries
- Apply subqueries with `IN`, `EXISTS`, `=`, and more

---

## 🧩 Schema Used

This task builds on the existing `mini_library` schema containing:

- `Members`
- `Authors`
- `Books`
- `Borrow`
- `Returns`

Refer to the main library project for table creation and sample data.

---

## 🧪 Subquery Examples

### 🔹 1. Subquery in SELECT Clause  
**Show total fine paid by each member**

```sql
SELECT
    m.name AS member_name,
    (SELECT SUM(r.fine)
     FROM Returns r
     JOIN Borrow b ON r.borrow_id = b.borrow_id
     WHERE b.member_id = m.member_id) AS total_fine_paid
FROM Members m;
