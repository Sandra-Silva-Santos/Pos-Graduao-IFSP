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

