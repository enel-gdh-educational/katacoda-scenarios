```
db.item_ordered.aggregate([
    {
        $lookup: {
            from: "customers",
            localField: "customerid",
            foreignField: "customerid",
            as: "joined"
        }
     },
    {
        $unwind: "$joined"
    },
    {
        $project: {"item": 0}
    }
])
```