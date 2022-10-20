final criarBanco = [
  '''
    CREATE TABLE exercicio(
      id_exercicio INTEGER NOT NULL PRIMARY KEY,
      nome TEXT NOT NULL,
      peso DOUBLE NOT NULL,
      serie INT NOT NULL,
      repeticao INT NOT NULL,
      treino_id INTEGER NOT NULL,
      FOREIGN KEY(treino_id) REFERENCES treino(id_treino)
    )
  ''',
  '''CREATE TABLE treino (
          id_treino INTEGER NOT NULL PRIMARY KEY,
          ordem TEXT NOT NULL,
          nome TEXT NOT NULL
      )'''
];
