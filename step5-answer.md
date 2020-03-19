```python
from pymongo import MongoClient

client = MongoClient('localhost', 27017)
airbnb = client["airbnb"]

sample = airbnb["sample_data"]

cursor = sample.find({
    
})
```