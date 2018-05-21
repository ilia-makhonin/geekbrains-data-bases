db.students.find();

db.students.find({name: {$regex: "Jen"}});

db.students.find({"_id": {$gt: 6.0, $lt: 20.0}});

db.students.insert({"_id": 1001.0, "name": "Bill Gates", "scores": [
    {"score": 32.356354, "type": "exam"},
    {"score": 17.759784, "type": "quiz"},
    {"score": 26.987547, "type": "homework"},
    ]
});
    
db.users.find();

db.users.find({"address.street": "Douglas Extension"});

db.users.find({username: {$in: ["Bret", "Samantha", "Elwyn.Skiles"]}});

db.users.find({"company.name": {$ne: "Yost and Sons"}});

db.users.update(
    {"username": "Moriah.Stanton"}, 
    {$set: {"phone": "025-648-3875"}}
);