# 💳 Pagamento Gateway


<div align="justify"> O **Pagamento Gateway** é uma aplicação web desenvolvida com **Ruby on Rails** e **Bootstrap**. Este sistema foi projetado para gerenciar e processar pagamentos de forma eficiente e segura, oferecendo uma experiência amigável para usuários finais e administradores. O projeto inclui autenticação para usuários e administradores, suporte a múltiplos métodos de pagamento (PIX, Boleto e Cartão de Crédito), e integração com o Mercado Pago para processamento de transações. </div>

### 💻 Sobre o projeto

---

<div align="justify"> O **Pagamento Gateway** permite que usuários realizem pagamentos por meio de diferentes métodos, enquanto administradores podem visualizar e gerenciar os pagamentos realizados. A interface intuitiva facilita a navegação e proporciona uma experiência prática e eficiente para todos os envolvidos. </div>


#### 👁️‍🗨️ Funcionalidades Principais

🔹 Usuário Final:

   - Realizar pagamentos utilizando PIX, Boleto Bancário ou Cartão de Crédito.
   - Receber confirmações de pagamento com detalhes sobre a transação.

🔹 Administração:

   - Visualizar e gerenciar pagamentos em uma interface dedicada.
   - Filtrar e pesquisar pagamentos por nome ou e-mail do pagador.
   - Paginador para gerenciar grandes volumes de pagamentos.

🔹 Integração com Mercado Pago:

   - Processamento seguro de pagamentos via API do Mercado Pago.
   - Suporte a geração de tokens para cartões de crédito.
   - Processamento de transações com validações de campos obrigatórios.

🔹 Autenticação Segura:

   - Notificações automáticas por e-mail com os detalhes do sorteado e sugestões de presentes.

🔹 Autenticação por Senha:

   - Controle de acesso utilizando Devise para usuários e administradores.
   - Modelos separados para autenticação de usuários e administradores.

#### 🛠 Tecnologias utilizadas

 🔹Frontend:
  - Bootstrap
  - Views customizadas para Devise

 🔹Backend:

  - Ruby on Rails
  - Devise (autenticação)
 
 🔹Banco de Dados:

  - SQLite (desenvolvimento)

 🔹Integração com APIs:

   - Mercado Pago

---

### 💡 Veja!

🔹 Video Demonstrativo:



https://github.com/user-attachments/assets/1daae171-8e00-4a62-bd27-cd55e2ab0ebb

---

### 🔧 Como Executar o Projeto

🔹 Pré-requisitos

 - Ruby 3.x instalado no sistema.
 - Bundler instalado.
 - Yarn instalados.

Passo a Passo

🔹 Clone o repositório ou faça o download do código.

```
git clone https://github.com/AngeloSouza1/pagamento-gateway.git
cd pagamento-gateway
```

🔹 Instale as dependências do projeto:

```
bundle install
yarn install
```

🔹 Configure as variáveis de ambiente:
 - Crie um arquivo .env na raiz do projeto com o seguinte conteúdo:

```
MERCADO_PAGO_ACCESS_TOKEN=seu_token_do_mercado_pago
```

🔹 Configure o banco de dados:
```
rails db:create db:migrate db:seed
```
 
🔹 Inicie o servidor Rails:
```
rails s
```
A aplicação estará disponível em http://localhost:3000.

---

### 🛠 Usuários de Demonstração

A aplicação inclui usuários pré-cadastrados no banco de dados para facilitar o teste:

🔹 **Admin**

  - E-mail: admin@example.com
  - Senha: password

🔹 **Usuário Comum**

   - E-mail: user@example.com
   - Senha: password

---


### 🛣️  Rotas do Sistema

Abaixo estão as principais rotas da aplicação:

**Rotas para Usuários**

🔹 **Página Inicial (Login de Usuário): /**
  - Mostra a tela de login para usuários comuns.
     

🔹 **Cadastro de Pagamento: /payments/new**
   -  Formulário para realizar um novo pagamento.
    
🔹 **Sucesso de Pagamento: /payments/success**
   -  Tela exibida após um pagamento bem-sucedido.

**Rotas para Administradores**

🔹 **Login de Administrador: /admins/sign_in**
   - Tela de login exclusiva para administradores.

🔹 **Lista de Pagamentos: /admin/payments**
   - Painel administrativo para consulta de pagamentos.

**Rotas para Devise**

🔹 **Registro de Usuários: /users/sign_up**
   - Permite que novos usuários se registrem.

🔹 **Esqueci Minha Senha: /users/password/new**
   - Página para recuperação de senha.

🔹 **Sair: /users/sign_out**
   - Permite que o usuário comum faça logout.
   
🔹 **Sair (Admin): /admins/sign_out**
    - Permite que o administrador faça logout.

---


### 🎨 Design da Interface

🔹 **Estilo Responsivo:** Desenvolvido com Bootstrap para uma interface moderna e responsiva.

🔹 **Validação de Formulários:** Mensagens de erro claras e dinâmicas para validações de entrada.

🔹 **Tabelas Dinâmicas:** Paginador integrado para facilitar a navegação de pagamentos no ambiente administrativo.

---

### 🤝🏻 Contribuição

Contribuições são bem-vindas! Se você quiser contribuir para o projeto, siga estas etapas:

🔹 Faça um fork do projeto.

🔹 Crie uma nova branch com a sua feature: git checkout -b minha-feature

🔹 Faça commit das suas alterações: git commit -m 'Adicionar nova feature'

🔹 Faça push para a branch: git push origin minha-feature

🔹 Envie um pull request.

---

### Licença

Este projeto é licenciado sob a MIT License.

---

### 📧 Contato

Para mais informações ou para relatar problemas, entre em contato:

  🔹  E-mail: angeloafdesouza@gmail.com

  🔹  GitHub: AngeloSouza1

---
<br>

**🚀Experimente o sistema e otimize suas transações financeiras!**
