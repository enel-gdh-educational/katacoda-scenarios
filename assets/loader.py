"""
---------
loader.py
---------

A minimal code to store data in MongoDB
"""
import csv
import json
from datetime import datetime
from pymongo import MongoClient


def load_orders():
    """Load orders sample data"""
    client = MongoClient('localhost', 27017)
    orders = client["orders"]

    # insert customers data
    customers = orders["customers"]

    with open('customers.csv') as csvfile:
        customers_data = csv.DictReader(csvfile)

    _ = customers.insert_many(customers_data)

    # insert items data
    items_ordered = orders["items_ordered"]

    with open('items_ordered.csv') as csvfile:
        items_ordered_data = csv.DictReader(csvfile)

    _ = items_ordered.insert_many(items_ordered_data)


def load_airbnb():
    """Load AirBnB sample data"""
    client = MongoClient('localhost', 27017)
    airbnb = client["airbnb"]
    sample_data = airbnb["sample_data"]

    with open("airbnb.json", "r") as f_in:
        data = json.load(f_in)

    for d in data:
        for key, val in d.items():
            if isinstance(val, dict):
                if "$date" in val.keys():
                    d[key] = datetime.fromtimestamp(val["$date"] / 1000)
                elif "$numberDecimal" in val.keys():
                    d[key] = val["$numberDecimal"]
        try:
            sample_data.insert(d)
        except:
            pass


def main():
    """The main script"""
    load_airbnb()
    load_orders()


if __name__ == "__main__":
    main()
    print("Done!")
