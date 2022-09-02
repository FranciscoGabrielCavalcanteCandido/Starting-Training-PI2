final criar_banco = [
  '''CREATE TABLE treino (
          id INTEGER PRIMERY KEY,
          ordem INT NOT NULL,
          status TEXT NOT NULL,
          nome TEXT NOT NULL
      )''',
  '''
        CREAT TABLE personal(
          id INTEGER PRIMERY KEY,
          nome TEXT NOT NULL,
          cpf TEXT NOT NULL,
          telefone TEXT NOT NULL,
          dataNascimento TEXT NOT NULL,
          endereco TEXT,
          status TEXT NOT NULL,
          senha TEXT NOT NULL,
          permissao TEXT NOT NULL,
          cref TEXT NOT NULL,
          validadeCref TEXT NOT NULL
      )''',
  '''
        CREAT TABLE aluno(
          id INTEGER PRIMERY KEY,
          nome TEXT NOT NULL,
          cpf TEXT NOT NULL,
          telefone TEXT NOT NULL,
          dataNascimento TEXT NOT NULL,
          endereco TEXT NOT NULL,
          status TEXT NOT NULL,
          senha TEXT NOT NULL,
          permissao TEXT NOT NULL,
          frequencia INT,
          personal_id int NOT NULL,
          FOREIGN KEY (personal_id) REFERENCES personal(id)
      )''',
  '''
        CREAT TABLE exercicio(
          id INTEGER PRIMERY KEY,
          nome TEXT NOT NULL,
          peso TEXT NOT NULL,
          serie TEXT NOT NULL,
          categoria TEXT NOT NULL,
          tipo_exercicio TEXT NOT NULL,
          repeticao TEXT NOT NULL,
          treino_id INTEGER NOT NULL,
          FOREIGN KEY (treino_id) REFERENCES treino(id)
      )''',
  '''
        CREATE TABLE medida(
          id INTEGER PRIMERY KEY,
          altura DOUBLE NOT NULL,
          pesoKg DOUBLE NOT NULL,
          cintura DOUBLE NOT NULL,
          braco DOUBLE NOT NULL,
          quadril DOUBLE NOT NULL,
          perna DOUBLE NOT NULL,
          data_Avaliacao TEXT NOT NULL,
          imc DOUBLE,
          aluno_id INTEGER NOT NULL,
          FOREIGN KEY (aluno_id) REFERENCES aluno(id)
        )''',
];
