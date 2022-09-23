final criarBanco = [
  '''CREATE TABLE treino (
          id INTEGER PRIMERY KEY,
          ordem INT NOT NULL,
          status TEXT NOT NULL,
          nome TEXT NOT NULL
      )''',
  '''
        CREATE TABLE personal(
          id INTEGER PRIMERY KEY ,
          nome TEXT NOT NULL,
          cpf TEXT NOT NULL,
          telefone TEXT NOT NULL,
          dataNascimento TEXT NOT NULL,
          endereco TEXT,
          status TEXT NOT NULL,
          senha TEXT NOT NULL,
          permissao TEXT NOT NULL,
          cref TEXT NOT NULL,
          validadeCref INT NOT NULL
      )''',
  '''INSERT INTO personal (id,nome, cpf, telefone, dataNascimento, endereco,
         status, senha, permissao, cref, validadeCref) 
        VALUES (1,"chico","111","44","20/07","rua 1","ativo","123","persoal","123","07/2028")''',
  '''
        CREATE TABLE aluno(
          id INTEGER PRIMERY KEY,
          nome TEXT NOT NULL,
          cpf TEXT NOT NULL,
          telefone TEXT NOT NULL,
          dataNascimento TEXT NOT NULL,
          endereco TEXT NOT NULL,
          status TEXT NOT NULL,
          senha TEXT NOT NULL,
          permissao TEXT NOT NULL,
          frequencia INT
      )''',
  '''
        CREATE TABLE exercicio(
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
        )'''
];
