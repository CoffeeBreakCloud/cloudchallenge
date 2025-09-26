
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;


app.get('/', (req, res) => {
res.send('Hola mundo desde github actions v2, Test case 1');
});


app.listen(port, () => {
console.log(`Servidor escuchando en puerto ${port}`);
});