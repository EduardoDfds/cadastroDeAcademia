final criarBanco = [
  '''
    CREATE TABLE exercicio(
      id INTEGER NOT NULL PRIMARY KEY,
      nome TEXT NOT NULL,
      peso DOUBLE NOT NULL,
      serie INT NOT NULL,
      repeticao INT NOT NULL,
      grupoMuscular_id INTEGER NOT NULL,
      FOREIGN KEY(grupoMuscular_id) REFERENCES grupoMuscular(id)
    )
  ''',
  '''
    CREATE TABLE grupoMuscular(
      id INTEGER NOT NULL PRIMARY KEY,
      nome TEXT NOT NULL
    )
  ''',
];
