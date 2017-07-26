DROP TABLE IF EXISTS pokemons          CASCADE;

CREATE TABLE pokemons (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  cp INTEGER,
  poke_type VARCHAR(255),
  img_url VARCHAR(512)
);
