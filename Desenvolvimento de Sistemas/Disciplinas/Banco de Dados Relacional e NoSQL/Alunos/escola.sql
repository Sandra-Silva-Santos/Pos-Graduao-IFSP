-- Tabela Alunos
CREATE TABLE alunos (
    matricula VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Tabela Cursos
CREATE TABLE cursos (
    cod_curso VARCHAR(10) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    qtde_semestres INT NOT NULL
);

-- Tabela Turmas
CREATE TABLE turmas (
    cod_turma VARCHAR(10) PRIMARY KEY,
    ano INT NOT NULL,
    cod_curso VARCHAR(10),
    FOREIGN KEY (cod_curso) REFERENCES cursos(cod_curso)
);

-- Tabela Professores
CREATE TABLE professores (
    ni_professor VARCHAR(10) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Tabela Disciplinas
CREATE TABLE disciplinas (
    cod_disciplina VARCHAR(10) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    carga_horaria INT NOT NULL,
    cod_curso VARCHAR(10),
    FOREIGN KEY (cod_curso) REFERENCES cursos(cod_curso)
);

-- Tabela Especialidades
CREATE TABLE especialidades (
    cod_especialidade VARCHAR(10) PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL,
    ni_professor VARCHAR(10),
    FOREIGN KEY (ni_professor) REFERENCES professores(ni_professor)
);

-- Tabela Alunos_Turmas
CREATE TABLE alunos_turmas (
    matricula_aluno VARCHAR(50),
    cod_turma VARCHAR(10),
    PRIMARY KEY (matricula_aluno, cod_turma),
    FOREIGN KEY (matricula_aluno) REFERENCES alunos(matricula),
    FOREIGN KEY (cod_turma) REFERENCES turmas(cod_turma)
);

-- Tabela Professores_Disciplinas
CREATE TABLE professores_disciplinas (
    ni_professor VARCHAR(10),
    cod_disciplina VARCHAR(10),
    PRIMARY KEY (ni_professor, cod_disciplina),
    FOREIGN KEY (ni_professor) REFERENCES professores(ni_professor),
    FOREIGN KEY (cod_disciplina) REFERENCES disciplinas(cod_disciplina)
);

-- Tabela Notas
CREATE TABLE notas (
    matricula_aluno VARCHAR(50),
    cod_disciplina VARCHAR(10),
    cod_turma VARCHAR(10),
    nota DECIMAL(5,2),
    ano INT NOT NULL,
    semestre INT NOT NULL,
    PRIMARY KEY (matricula_aluno, cod_disciplina, cod_turma, ano, semestre),
    FOREIGN KEY (matricula_aluno) REFERENCES alunos(matricula),
    FOREIGN KEY (cod_disciplina) REFERENCES disciplinas(cod_disciplina),
    FOREIGN KEY (cod_turma) REFERENCES turmas(cod_turma)
);

-- Nova tabela: Presenças
CREATE TABLE presencas (
    id_presenca SERIAL PRIMARY KEY,
    matricula_aluno VARCHAR(50),
    cod_disciplina VARCHAR(10),
    cod_turma VARCHAR(10),
    data_aula DATE NOT NULL,
    presente BOOLEAN NOT NULL,
    FOREIGN KEY (matricula_aluno) REFERENCES alunos(matricula),
    FOREIGN KEY (cod_disciplina) REFERENCES disciplinas(cod_disciplina),
    FOREIGN KEY (cod_turma) REFERENCES turmas(cod_turma)
);

-- Nova tabela: Histórico Acadêmico
CREATE TABLE historico_academico (
    id_historico SERIAL PRIMARY KEY,
    matricula_aluno VARCHAR(50),
    cod_disciplina VARCHAR(10),
    ano_conclusao INT NOT NULL,
    semestre_conclusao INT NOT NULL,
    situacao VARCHAR(10) NOT NULL CHECK (situacao IN ('Aprovado', 'Reprovado')),
    FOREIGN KEY (matricula_aluno) REFERENCES alunos(matricula),
    FOREIGN KEY (cod_disciplina) REFERENCES disciplinas(cod_disciplina)
);

-- Nova tabela: Atividades Complementares
CREATE TABLE atividades_complementares (
    id_atividade SERIAL PRIMARY KEY,
    matricula_aluno VARCHAR(50),
    descricao TEXT NOT NULL,
    horas DECIMAL(5,2) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    tipo VARCHAR(100),
    FOREIGN KEY (matricula_aluno) REFERENCES alunos(matricula)
);