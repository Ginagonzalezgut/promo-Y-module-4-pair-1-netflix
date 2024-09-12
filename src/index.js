const express = require("express");
const cors = require("cors");
const mysql = require("mysql2/promise");

// create and config server
const server = express();
server.use(cors());
server.use(express.json());

server.set("view engine", "ejs");

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

  // const squlQuery = "SELECT * FROM movies";
  // const [moviesResult] = await connection.query(squlQuery);

  const genreFilterParam = req.query.genre;
  // const sqlFilterGenre = "SELECT * FROM movies WHERE genre = ?";
  // const [resultFilterGender] = await connection.query(sqlFilterGenre, [
  //   genreFilterParam,
  // ]);
  let sqlQuery;
  let queryParams = [];

  if (genreFilterParam) {
    // Si hay un filtro de género, haz la consulta con el WHERE
    sqlQuery = "SELECT * FROM movies WHERE genre = ?";
    queryParams = [genreFilterParam]; // El valor del filtro
  } else {
    // Si no hay filtro, selecciona todas las películas
    sqlQuery = "SELECT * FROM movies";
  }

  // Ejecuta la consulta SQL (con o sin filtro de género)
  const [result] = await connection.query(sqlQuery, queryParams);

  connection.end();

  res.status(200).json({
    success: true,
    movies: result,
  });
});

//creamos servidor de estaticos, añadimos al package.json la linea:
// "publish-react": "cd web && npm run build && cd .. && rm -rf ./src/public-react && mv ./web/dist ./src/public-react"

server.get("/movie/:movieId", async (req, res) => {
  const connection = await getDBConnection();

  const query = "SELECT * FROM movies WHERE idMovies = ?";
  const [result] = await connection.query(query, [req.params.movieId]);
  console.log(result);
  connection.end();

  res.render("movies", { movie: result[0] });
});

const staticServerPath = "src/public-react";
server.use(express.static(staticServerPath));
