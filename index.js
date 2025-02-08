require('dotenv').config();
const steps = require('./src/Steps');


exports.handler = async (event) => {

    /**CARGAR VARIABLES DE ENTORNO */

    const AMBIENTE = process.env.AMBIENTE;
    
    console.info("VARIABLES DE ENTORNO:");
    console.info("AMBIENTE:" + AMBIENTE);



    if (!event.body) {
        
        
        const response = {
            statusCode: 500,
            headers: { 'Content-Type': 'application/json' },
            body: '{"error":"No hay body"}',
        };
        return response;
    } else {
        
        steps.logging("AMBIENTE",AMBIENTE);
        return {
            headers: {
                'Content-Type': 'application/json'
            },
            statusCode: 200,
            body: JSON.stringify({'Ambiente':  AMBIENTE})
        };

    }
};




/****** TEST LOCAL ******/

/*
let resp = this.handler({
    "body": `{"nombre":"Juan","apellido":"Perez"}`}
);



resp.then((data) => {
    console.info("Respuesta del Lambda:" + JSON.stringify(data));
});   

*/
