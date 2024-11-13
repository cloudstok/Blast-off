const  routes = require('express').Router()

routes.get('/' ,async (req ,res)=>{
    res.send({"msg" : "Testing Successfully for Blast Offf 👍"})
});


module.exports = {routes}