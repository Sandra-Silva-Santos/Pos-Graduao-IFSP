-- 1️ Atualização da trigger para registrar UPDATE e DELETE em logs_produtos

-- Criar ou atualizar a função de log
CREATE OR REPLACE FUNCTION registrar_log_produto()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'UPDATE' THEN
        INSERT INTO logs_produtos (produto_id, operacao, data_operacao, dados_anteriores)
        VALUES (OLD.id, 'UPDATE', now(), row_to_json(OLD));
    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO logs_produtos (produto_id, operacao, data_operacao, dados_anteriores)
        VALUES (OLD.id, 'DELETE', now(), row_to_json(OLD));
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Criar ou substituir a trigger associada
DROP TRIGGER IF EXISTS trg_log_produtos ON produtos;

CREATE TRIGGER trg_log_produtos
AFTER UPDATE OR DELETE ON produtos
FOR EACH ROW
EXECUTE FUNCTION registrar_log_produto();


-- 2️ Criação de nova ROLE com boas práticas de segurança

-- Criar a nova ROLE com autenticação segura
CREATE ROLE auditor_controle LOGIN PASSWORD 'senha_secreta';

-- Permitir apenas conexão e leitura nos dados de auditoria
GRANT CONNECT ON DATABASE restaurante TO auditor_controle;
GRANT USAGE ON SCHEMA public TO auditor_controle;

-- Acesso de leitura somente à tabela de logs
GRANT SELECT ON logs_produtos TO auditor_controle;
