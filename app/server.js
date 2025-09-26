
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;


app.get('/', (req, res) => {
res.send('Hola mundo desde github v4');
});


app.listen(port, () => {
console.log(`Servidor escuchando en puerto ${port}`);
});