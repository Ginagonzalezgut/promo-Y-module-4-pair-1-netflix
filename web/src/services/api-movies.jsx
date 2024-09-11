// login

const getMoviesFromApi = (selectedGenre) => {
  console.log(selectedGenre.genre);
  // CAMBIA ESTE FETCH PARA QUE APUNTE A UN ENDPOINT DE TU SERVIDOR, PIENSA SI DEBE SER GET O POST, PIENSA QUÉ DATOS DEBES ENVIAR, ETC
  return fetch(`http://localhost:4000/movies?genre=${selectedGenre.genre}`)
    .then((response) => response.json())

    .then((data) => {
      console.log(data.movies);
      return data;
    });
};

const objToExport = {
  getMoviesFromApi: getMoviesFromApi,
};

export default objToExport;
