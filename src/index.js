const express = require("express");
const cors = require("cors");
const mysql = require("mysql2/promise");

// create and config server
const server = express();
server.use(cors());
server.use(express.json());

async function getDBConnection() {
  const connection = await mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "_121803099389$L&m",
    database: "netflix",
  });
  await connection.connect();
  return connection;
}

// init express aplication
const serverPort = 4000;
server.listen(serverPort, () => {
  console.log(`Server listening at http://localhost:${serverPort}`);
});

server.get("/movies", async function (req, res) {
  const connection = await getDBConnection();

  const squlQuery = "SELECT * FROM movies";
  const [moviesResult] = await connection.query(squlQuery);
  connection.end();

  res.status(200).json({
    success: true,
    movies: moviesResult,
  });
});

//creamos servidor de estaticos, añadimos al package.json la linea:
// "publish-react": "cd web && npm run build && cd .. && rm -rf ./src/public-react && mv ./web/dist ./src/public-react"

const staticServerPath = "src/public-react";
server.use(express.static(staticServerPath));
