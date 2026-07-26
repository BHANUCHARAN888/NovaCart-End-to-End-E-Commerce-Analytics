from datetime import date
import random
from faker import Faker
from db_connection import connection, cursor

fake = Faker("en_IN")

NUM_ORDERS = 5000

query = """
INSERT INTO orders
(customer_id, order_date, order_status, total_amount)
VALUES (%s, %s, %s, %s)
"""

orders = []

status_choices = ["Completed", "Completed", "Completed",
                  "Completed", "Completed", "Completed",
                  "Completed", "Completed", "Pending",
                  "Cancelled"]

for _ in range(NUM_ORDERS):

    customer_id = random.randint(1, 500)

    order_date = fake.date_between(
        start_date=date(2024, 1, 1),
        end_date=date(2025, 12, 31)
    )

    order_status = random.choice(status_choices)

    total_amount = 0.00

    orders.append((
        customer_id,
        order_date,
        order_status,
        total_amount
    ))

cursor.executemany(query, orders)

connection.commit()

print(f"✅ {cursor.rowcount} orders inserted successfully!")

cursor.close()
connection.close()