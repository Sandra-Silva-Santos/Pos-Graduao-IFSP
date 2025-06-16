-- View: Percentual de presença por aluno e disciplina
CREATE VIEW percentual_presenca AS
SELECT 
    p.matricula_aluno,
    p.cod_disciplina,
    COUNT(*) AS total_aulas,
    SUM(CASE WHEN p.presente THEN 1 ELSE 0 END) AS aulas_presentes,
    ROUND((SUM(CASE WHEN p.presente THEN 1 ELSE 0 END)::DECIMAL / COUNT(*)) * 100, 2) AS percentual_presenca
FROM presencas p
GROUP BY p.matricula_aluno, p.cod_disciplina;

-- View: Histórico completo de aprovações/reprovações por aluno
CREATE VIEW historico_completo AS
SELECT 
    h.matricula_aluno,
    a.nome AS nome_aluno,
    d.nome AS nome_disciplina,
    h.ano_conclusao,
    h.semestre_conclusao,
    h.situacao
FROM historico_academico h
JOIN alunos a ON h.matricula_aluno = a.matricula
JOIN disciplinas d ON h.cod_disciplina = d.cod_disciplina;

-- View: Total de horas de atividades complementares por aluno
CREATE VIEW horas_atividades_complementares AS
SELECT 
    ac.matricula_aluno,
    a.nome AS nome_aluno,
    SUM(ac.horas) AS total_horas
FROM atividades_complementares ac
JOIN alunos a ON ac.matricula_aluno = a.matricula
GROUP BY ac.matricula_aluno, a.nome;