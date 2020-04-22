```javascript
> db.item_ordered.aggregate([
    // first stage in the pipe
    {
        $lookup: {
            from: "customers",
            localField: "customerid",
            foreignField: "customerid",
            as: "joined"
        }
     },
    // second stage in the pipe
    {
        $unwind: "$joined"
    },
    // third stage in the pipe
    {
        $project: {"item": 0}
    }
])
```