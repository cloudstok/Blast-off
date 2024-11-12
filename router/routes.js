const { settleBet } = require('../module/bets/betController');
const  routes = require('express').Router()

routes.get('/' ,async (req ,res)=>{
    res.send({"msg" : "Testing Successfully for Aviator 3D 👍"})
});

routes.post('/settleBet', settleBet);

module.exports = {routes}