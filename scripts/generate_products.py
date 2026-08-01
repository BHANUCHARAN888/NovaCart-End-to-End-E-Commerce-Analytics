import random
from db_connection import connection, cursor

# -----------------------------
# Product Catalog
# -----------------------------

product_catalog = {
    "Electronics": {
        "Apple": [
            ("iPhone 16", 899, 1299),
            ("MacBook Air M3", 1099, 1599),
            ("AirPods Pro", 199, 299)
        ],
        "Samsung": [
            ("Galaxy S24", 799, 1199),
            ("Galaxy Buds 3", 99, 199),
            ("Galaxy Tab S9", 699, 999)
        ],
        "Sony": [
            ("WH-1000XM5 Headphones", 299, 449),
            ("PlayStation 5", 499, 699)
        ],
        "Dell": [
            ("Inspiron 15", 650, 1100),
            ("XPS 13", 999, 1499)
        ],
        "HP": [
            ("Pavilion 15", 650, 1000),
            ("Victus Gaming Laptop", 850, 1400)
        ],
        "Boat": [
            ("Airdopes 311", 25, 60),
            ("Stone Speaker", 40, 90)
        ]
    },

    "Fashion": {
        "Nike": [
            ("Running Shoes", 70, 180),
            ("Sports T-Shirt", 20, 60)
        ],
        "Adidas": [
            ("Sneakers", 70, 170),
            ("Track Pants", 35, 80)
        ],
        "Puma": [
            ("Casual Shoes", 60, 160),
            ("Hoodie", 30, 90)
        ]
    },

    "Home & Kitchen": {
        "Prestige": [
            ("Pressure Cooker", 40, 120),
            ("Non-Stick Pan", 25, 80)
        ],
        "Philips": [
            ("Mixer Grinder", 60, 150),
            ("Air Fryer", 90, 220)
        ]
    },

    "Grocery": {
        "India Gate": [
            ("Basmati Rice 5kg", 12, 25)
        ],
        "Fortune": [
            ("Sunflower Oil 1L", 3, 8)
        ],
        "Tata": [
            ("Tea 1kg", 5, 15),
            ("Salt 1kg", 1, 3)
        ]
    },

    "Accessories": {
        "Wildcraft": [
            ("Backpack", 20, 60)
        ],
        "Skybags": [
            ("Laptop Bag", 25, 70)
        ],
        "Noise": [
            ("Smart Watch", 35, 120)
        ]
    }
}

# -----------------------------
# SQL Query
# -----------------------------

query = """
INSERT INTO products
(product_name, category, brand, unit_price, stock_quantity)
VALUES (%s, %s, %s, %s, %s)
"""

products = []

# -----------------------------
# Generate Unique Products
# -----------------------------

for category, brands in product_catalog.items():
    for brand, product_list in brands.items():
        for product in product_list:

            product_name = product[0]
            min_price = product[1]
            max_price = product[2]

            unit_price = round(random.uniform(min_price, max_price), 2)
            stock_quantity = random.randint(20, 500)

            products.append(
                (
                    product_name,
                    category,
                    brand,
                    unit_price,
                    stock_quantity
                )
            )

# -----------------------------
# Insert Data
# -----------------------------

cursor.executemany(query, products)

connection.commit()

print(f"✅ {len(products)} unique products inserted successfully!")

cursor.close()
connection.close()