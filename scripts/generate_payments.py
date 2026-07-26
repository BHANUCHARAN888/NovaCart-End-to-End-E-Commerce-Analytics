from datetime import timedelta
import random
from db_connection import connection, cursor


# -----------------------------
# Fetch Orders
# -----------------------------

cursor.execute("""
SELECT order_id, order_date, order_status
FROM orders
""")

orders = cursor.fetchall()


# -----------------------------
# Insert Query
# -----------------------------

query = """
INSERT INTO payments
(order_id, payment_method, payment_status, payment_date)
VALUES (%s, %s, %s, %s)
"""


payment_methods = [
    "UPI",
    "UPI",
    "UPI",
    "UPI",
    "Credit Card",
    "Credit Card",
    "Debit Card",
    "Debit Card",
    "Net Banking",
    "Cash on Delivery"
]


payments = []


# -----------------------------
# Generate Payments
# -----------------------------

for order in orders:

    order_id = order[0]
    order_date = order[1]
    order_status = order[2]


    payment_method = random.choice(payment_methods)


    if order_status == "Completed":

        payment_status = "Success"

    elif order_status == "Pending":

        payment_status = random.choice(
            ["Pending", "Failed"]
        )

    else:

        payment_status = random.choice(
            ["Failed", "Pending"]
        )


    payment_date = order_date + timedelta(
        days=random.randint(0, 3)
    )


    payments.append(
        (
            order_id,
            payment_method,
            payment_status,
            payment_date
        )
    )


# -----------------------------
# Insert Data
# -----------------------------

cursor.executemany(query, payments)

connection.commit()


print(
    f"✅ {cursor.rowcount} payments inserted successfully!"
)


cursor.close()
connection.close()