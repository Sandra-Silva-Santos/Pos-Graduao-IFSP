# Mini Aplicação Web

## Páginas
- **Login (/login)**: acesso livre; campos de usuário e senha.
- **Cadastro (/cadastro)**: apenas administradores; cadastro de novos usuários.
- **Administradores (/administradores)**: restrito a administradores; mensagem e logout.
- **Usuários (/usuarios)**: restrito a usuários comuns; mensagem e logout.

## Regras de Acesso
- Não autenticados → sem acesso às páginas restritas.
- Administradores → acesso a `/cadastro` e `/administradores`; bloqueio em `/usuarios`.
- Usuários comuns → acesso a `/usuarios`; bloqueio em `/cadastro` e `/administradores`.

## Segurança
- **Injeção**: consultas parametrizadas, validação/sanitização.
- **CSRF**: tokens e cookies `SameSite`.
- **Controle de acesso**: baseado em papéis, negação por padrão.
- **Sessões**: regenerar ID após login, expiração por inatividade.
- **Senhas**: hash seguro (Argon2, yescrypt).
- **Erros**: mensagens genéricas, sem detalhes técnicos.
- **Centralização**: módulo único para segurança.

## Testes
1. Usuário não autenticado → acesso negado às páginas restritas.
2. Login administrador → acesso permitido a `/cadastro` e `/administradores`; negado em `/usuarios`.
3. Administrador cadastra novo admin e usuário comum.
4. Logout administrador.
5. Login usuário comum → acesso permitido a `/usuarios`; negado em `/cadastro` e `/administradores`.
6. Logout usuário comum.

## Evidências
- Ponto único de segurança.
- Mecanismos contra injeção, CSRF, controle de acesso, sessões, erros.
- Hashes de senhas armazenados.




## Instalação

1. Clone o repositório para sua máquina local:
    ```bash
    git clone <URL_DO_REPOSITORIO> 
    ```    
2. Crie um ambiente virtual de acordo com seu Sistema Operacional (opcional, mas recomendado):
    ```bash
    python -m venv venv
    ```
3. Ative o ambiente virtual:
    ```bash 
    # Para Windows
    venv\Scripts\activate
    
    # Para Linux/Mac
    source venv/bin/activate
    ```

3. Instale os pacotes necessários:
    ```bash
    pip install -r requirements.txt
    ```

## Como Iniciar

1. Execute a aplicação:
    ```bash
    python app.py
    ```

2. Acesse a aplicação no navegador através do endereço:
    ```bash
    https://127.0.0.1:5000/login
    ```
