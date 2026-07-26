import random
from db_connection import connection, cursor

# ---------------------------------
# Fetch Orders
# ---------------------------------

cursor.execute("""
SELECT order_id
FROM orders
WHERE order_status = 'Completed'
""")

orders = cursor.fetchall()

# ---------------------------------
# Fetch Products
# ---------------------------------

cursor.execute("""
SELECT product_id, unit_price
FROM products
""")

products = cursor.fetchall()

# ---------------------------------
# SQL Query
# ---------------------------------

query = """
INSERT INTO order_items
(order_id, product_id, quantity, unit_price)
VALUES (%s, %s, %s, %s)
"""

order_items = []

# ---------------------------------
# Generate Order Items
# ---------------------------------

for order in orders:

    order_id = order[0]

    # Each order has 1–5 unique products
    number_of_products = random.randint(1, 5)

    selected_products = random.sample(products, number_of_products)

    for product in selected_products:

        product_id = product[0]
        unit_price = product[1]

        quantity = random.randint(1, 4)

        order_items.append(
            (
                order_id,
                product_id,
                quantity,
                unit_price
            )
        )

# ---------------------------------
# Insert into Database
# ---------------------------------

cursor.executemany(query, order_items)

connection.commit()

print(f"✅ {cursor.rowcount} order items inserted successfully!")

cursor.close()
connection.close()