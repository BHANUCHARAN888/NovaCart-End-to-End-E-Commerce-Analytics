from faker import Faker
from datetime import date
import random
from db_connection import connection, cursor

fake = Faker("en_IN")

NUM_CUSTOMERS = 500

cities_states = [
    ("Hyderabad", "Telangana"),
    ("Bengaluru", "Karnataka"),
    ("Chennai", "Tamil Nadu"),
    ("Mumbai", "Maharashtra"),
    ("Delhi", "Delhi"),
    ("Pune", "Maharashtra"),
    ("Kolkata", "West Bengal"),
    ("Visakhapatnam", "Andhra Pradesh"),
    ("Vijayawada", "Andhra Pradesh"),
    ("Kochi", "Kerala"),
    ("Jaipur", "Rajasthan"),
    ("Ahmedabad", "Gujarat")
]

query = """
INSERT INTO customers
(first_name, last_name, email, phone, city, state, signup_date)
VALUES (%s, %s, %s, %s, %s, %s, %s)
"""

customers = []

for _ in range(NUM_CUSTOMERS):

    first_name = fake.first_name()
    last_name = fake.last_name()
    email = fake.unique.email()
    phone = fake.msisdn()[:10]

    city, state = random.choice(cities_states)

    signup_date = fake.date_between(
        start_date=date(2024, 1, 1),
        end_date=date(2025, 12, 31)
    )

    customers.append((
        first_name,
        last_name,
        email,
        phone,
        city,
        state,
        signup_date
    ))

cursor.executemany(query, customers)
connection.commit()

print(f"✅ {cursor.rowcount} customers inserted successfully!")

cursor.close()
connection.close()