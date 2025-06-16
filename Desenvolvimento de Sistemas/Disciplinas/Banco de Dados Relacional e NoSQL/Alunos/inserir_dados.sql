-- Inserindo Cursos
INSERT INTO cursos (cod_curso, nome, qtde_semestres) VALUES
('C001', 'Engenharia de Software', 8),
('C002', 'Ciência da Computação', 8),
('C003', 'Administração', 6),
('C004', 'Direito', 10),
('C005', 'Medicina', 12);

-- Inserindo Alunos
INSERT INTO alunos (matricula, nome, data_nascimento, email) VALUES
('ALUNO001', 'João Silva', '2000-05-10', 'joaosilva@email.com'),
('ALUNO002', 'Maria Oliveira', '2001-03-15', 'mariaoliveira@email.com'),
('ALUNO003', 'Pedro Santos', '1999-07-22', 'pedrosantos@email.com'),
('ALUNO004', 'Ana Souza', '2002-09-01', 'anasouza@email.com'),
('ALUNO005', 'Carlos Lima', '2000-11-30', 'carloslima@email.com'),
('ALUNO006', 'Juliana Costa', '2001-04-18', 'julianacosta@email.com'),
('ALUNO007', 'Lucas Ferreira', '1998-12-05', 'lucasferreira@email.com'),
('ALUNO008', 'Mariana Rocha', '2003-06-20', 'marianarocha@email.com'),
('ALUNO009', 'Rafael Martins', '2000-02-14', 'rafaelmartins@email.com'),
('ALUNO010', 'Fernanda Almeida', '2002-08-25', 'fernandaalmeida@email.com');

-- Inserindo Turmas
INSERT INTO turmas (cod_turma, ano, cod_curso) VALUES
('TURMA01', 2024, 'C001'),
('TURMA02', 2024, 'C002'),
('TURMA03', 2024, 'C003'),
('TURMA04', 2024, 'C004'),
('TURMA05', 2024, 'C005');

-- Relacionando Alunos com Turmas
INSERT INTO alunos_turmas (matricula_aluno, cod_turma) VALUES
('ALUNO001', 'TURMA01'),
('ALUNO002', 'TURMA02'),
('ALUNO003', 'TURMA03'),
('ALUNO004', 'TURMA04'),
('ALUNO005', 'TURMA05'),
('ALUNO006', 'TURMA01'),
('ALUNO007', 'TURMA02'),
('ALUNO008', 'TURMA03'),
('ALUNO009', 'TURMA04'),
('ALUNO010', 'TURMA05');

-- Inserindo Professores
INSERT INTO professores (ni_professor, nome, email) VALUES
('PROF001', 'Dr. Paulo Ribeiro', 'pauloribeiro@email.com'),
('PROF002', 'Profa. Camila Fernandes', 'camilafernandes@email.com'),
('PROF003', 'Prof. Ricardo Mendes', 'ricardomendes@email.com'),
('PROF004', 'Dr. Luiz Carlos', 'luizcarlos@email.com'),
('PROF005', 'Profa. Ana Beatriz', 'anabeatriz@email.com');

-- Inserindo Disciplinas
INSERT INTO disciplinas (cod_disciplina, nome, carga_horaria, cod_curso) VALUES
('DISC001', 'Algoritmos e Programação', 80, 'C001'),
('DISC002', 'Banco de Dados', 60, 'C001'),
('DISC003', 'Estrutura de Dados', 80, 'C002'),
('DISC004', 'Sistemas Operacionais', 60, 'C002'),
('DISC005', 'Matemática Financeira', 60, 'C003'),
('DISC006', 'Introdução ao Direito', 80, 'C004'),
('DISC007', 'Anatomia Humana', 120, 'C005'),
('DISC008', 'História do Direito', 60, 'C004'),
('DISC009', 'Contabilidade Geral', 60, 'C003'),
('DISC010', 'Redes de Computadores', 80, 'C002');

-- Inserindo Especialidades dos Professores
INSERT INTO especialidades (cod_especialidade, descricao, ni_professor) VALUES
('ESP001', 'Desenvolvimento Web', 'PROF001'),
('ESP002', 'Banco de Dados Relacional', 'PROF001'),
('ESP003', 'Programação Orientada a Objetos', 'PROF002'),
('ESP004', 'Sistemas Distribuídos', 'PROF003'),
('ESP005', 'Direito Penal', 'PROF004'),
('ESP006', 'Direito Civil', 'PROF004'),
('ESP007', 'Fisiologia Humana', 'PROF005'),
('ESP008', 'Neurociência', 'PROF005'),
('ESP009', 'Teoria de Redes', 'PROF003'),
('ESP010', 'Metodologias Ágeis', 'PROF002');

-- Relacionando Professores com Disciplinas
INSERT INTO professores_disciplinas (ni_professor, cod_disciplina) VALUES
('PROF001', 'DISC001'),
('PROF001', 'DISC002'),
('PROF002', 'DISC003'),
('PROF003', 'DISC004'),
('PROF004', 'DISC006'),
('PROF005', 'DISC007'),
('PROF005', 'DISC008'),
('PROF003', 'DISC010'),
('PROF002', 'DISC009'),
('PROF004', 'DISC005');

-- Inserindo Notas
INSERT INTO notas (matricula_aluno, cod_disciplina, cod_turma, nota, ano, semestre) VALUES
('ALUNO001', 'DISC001', 'TURMA01', 8.5, 2024, 1),
('ALUNO001', 'DISC002', 'TURMA01', 6.0, 2024, 1),
('ALUNO002', 'DISC003', 'TURMA02', 9.0, 2024, 1),
('ALUNO002', 'DISC004', 'TURMA02', 7.5, 2024, 1),
('ALUNO003', 'DISC005', 'TURMA03', 5.0, 2024, 1),
('ALUNO003', 'DISC009', 'TURMA03', 7.0, 2024, 1),
('ALUNO004', 'DISC006', 'TURMA04', 8.0, 2024, 1),
('ALUNO004', 'DISC008', 'TURMA04', 6.5, 2024, 1),
('ALUNO005', 'DISC007', 'TURMA05', 9.5, 2024, 1),
('ALUNO005', 'DISC007', 'TURMA05', 9.0, 2024, 2);

-- Inserindo Presenças
INSERT INTO presencas (matricula_aluno, cod_disciplina, cod_turma, data_aula, presente) VALUES
('ALUNO001', 'DISC001', 'TURMA01', '2024-03-01', TRUE),
('ALUNO001', 'DISC001', 'TURMA01', '2024-03-05', FALSE),
('ALUNO001', 'DISC001', 'TURMA01', '2024-03-08', TRUE),
('ALUNO002', 'DISC003', 'TURMA02', '2024-03-02', TRUE),
('ALUNO002', 'DISC003', 'TURMA02', '2024-03-06', TRUE),
('ALUNO003', 'DISC005', 'TURMA03', '2024-03-03', FALSE),
('ALUNO003', 'DISC005', 'TURMA03', '2024-03-07', TRUE),
('ALUNO004', 'DISC006', 'TURMA04', '2024-03-04', TRUE),
('ALUNO004', 'DISC006', 'TURMA04', '2024-03-09', TRUE),
('ALUNO005', 'DISC007', 'TURMA05', '2024-03-10', TRUE);

-- Inserindo Histórico Acadêmico
INSERT INTO historico_academico (matricula_aluno, cod_disciplina, ano_conclusao, semestre_conclusao, situacao) VALUES
('ALUNO001', 'DISC001', 2024, 1, 'Aprovado'),
('ALUNO001', 'DISC002', 2024, 1, 'Reprovado'),
('ALUNO002', 'DISC003', 2024, 1, 'Aprovado'),
('ALUNO002', 'DISC004', 2024, 1, 'Aprovado'),
('ALUNO003', 'DISC005', 2024, 1, 'Reprovado'),
('ALUNO003', 'DISC009', 2024, 1, 'Aprovado'),
('ALUNO004', 'DISC006', 2024, 1, 'Aprovado'),
('ALUNO004', 'DISC008', 2024, 1, 'Reprovado'),
('ALUNO005', 'DISC007', 2024, 1, 'Aprovado'),
('ALUNO005', 'DISC007', 2024, 2, 'Aprovado');

-- Inserindo Atividades Complementares
INSERT INTO atividades_complementares (matricula_aluno, descricao, horas, data_inicio, data_fim, tipo) VALUES
('ALUNO001', 'Participação em evento de tecnologia', 20.0, '2024-03-01', '2024-03-05', 'Evento'),
('ALUNO001', 'Monitoria da disciplina de Banco de Dados', 30.0, '2024-02-10', '2024-06-10', 'Monitoria'),
('ALUNO002', 'Estágio supervisionado em TI', 120.0, '2024-01-10', '2024-06-30', 'Estágio'),
('ALUNO002', 'Voluntário em ONG local', 15.0, '2024-04-01', '2024-04-15', 'Voluntariado'),
('ALUNO003', 'Projeto de extensão universitária', 40.0, '2024-03-15', '2024-06-15', 'Extensão'),
('ALUNO003', 'Palestra sobre carreira profissional', 5.0, '2024-05-01', '2024-05-01', 'Evento'),
('ALUNO004', 'Curso de Python online', 25.0, '2024-02-01', '2024-02-28', 'Curso'),
('ALUNO004', 'Participação em hackathon', 10.0, '2024-04-20', '2024-04-22', 'Evento'),
('ALUNO005', 'Iniciação científica', 60.0, '2024-03-01', '2024-06-30', 'Pesquisa'),
('ALUNO005', 'Curso de Liderança', 18.0, '2024-05-10', '2024-05-20', 'Curso');