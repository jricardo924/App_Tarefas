# App_Tarefas
[![NPM](https://img.shields.io/npm/l/react)](https://github.com/jricardo924/APP-CEP/blob/main/LICENSE) 

# Sobre o projeto

O App-Tarefas é uma aplicação desenvolvida em Delphi Tokyo que visa demonstrar métodos, capacidade técnica e analítica para seleção de emprego em uma empresa da área de software



   A aplicação desenvolvida consiste em um serviço em Delphi projetado para gerenciar informações sobre tarefas. Este serviço oferece um conjunto abrangente de funcionalidades, incluindo a consulta e retorno da lista completa de tarefas, adição de novas tarefas, atualização do status de uma tarefa e remoção de tarefas existentes.

   Além dessas funcionalidades essenciais, a aplicação inclui um desafio SQL que utiliza um banco de dados SQL Server. Esse desafio envolve a implementação de consultas SQL no serviço para calcular e retornar estatísticas importantes, como o número total de tarefas, a média de prioridade das tarefas pendentes e a quantidade de tarefas concluídas nos últimos 7 dias.

   Para armazenar as informações das tarefas, a aplicação utiliza uma estrutura de dados eficiente, garantindo a integridade e acessibilidade dos dados. A implementação do serviço também considera a segurança na comunicação entre o serviço e a aplicação cliente, priorizando a confidencialidade e integridade dos dados transmitidos.

   Além do serviço, a aplicação inclui uma interface de usuário cliente desenvolvida em VCL, permitindo que os usuários interajam facilmente com o serviço para realizar operações como exibir a lista de tarefas, adicionar novas tarefas, atualizar o status das tarefas e remover tarefas existentes. A interface gráfica é projetada para ser amigável e intuitiva, proporcionando uma experiência de usuário agradável.

   A comunicação entre a aplicação cliente e o serviço é realizada exclusivamente por meio de chamadas REST, garantindo uma integração suave e eficiente. Não há persistência local de dados na aplicação cliente, garantindo que todas as operações sejam realizadas de forma segura e consistente, refletindo sempre o estado atual das tarefas armazenadas no banco de dados.


## Layout APP - Serviço
![Mobile 1](https://github.com/jricardo924/image/blob/main/Servico.jpg) 

## Layout APP - Cliente
![Mobile 1](https://github.com/jricardo924/image/blob/main/Cliente.jpg) 


# Tecnologias utilizadas
## Delphi
- Delphi Tokyo
- Aplicação em VCL (Cliente)
- Aplicação em Console Application (Servidor)
- Framework Horse
- Middleware de Autenticação simples em Horse
- Padrões de Projeto Factory
- RESTRequest4D para request na API REST
- System.JSON para manipulçao de JSON
    
## Banco de dados SQL Server
- SQL Server 2022 (64 bit)
- SQL Server Management Studio 20


# Como executar o projeto

## Aplicação
Pré-requisitos: Delphi Tokyo

```bash
# clonar repositório
git clone https://github.com/jricardo924/App-Tarefas
Clone para diretorio C:\

# entrar na pasta do projeto
cd C:\App-Tarefas

# executar o projeto Cliente
Abrir executavel na pasta C:\App-Tarefas\Aplicacao\Win32\Debug\App_Tarefas.exe

# executar o projeto Serviço
Abrir executavel na pasta C:\App-Tarefas\Aplicacao\Win32\Debug\App_Servico.exe

# Instalação do Horse
Abrir o Tools >> Options >> Delphi Options >> Library >> Library path: C:\App-Tarefas\Horse\horse-master\horse-master\src

# Instalação do RESTResquest4
Abrir o Tools >> Options >> Delphi Options >> Library >> Library path: C:\App-Tarefas\RESTRequest4Delphi-master\src

# Instalação do Horse.Jhonson
Abrir o Tools >> Options >> Delphi Options >> Library >> Library path: C:\App-Tarefas\jhonson-master\src


# SQL Server
Criar a tabela no master. Script de create:

CREATE TABLE Tarefas (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Titulo NVARCHAR(100),
    Descricao NVARCHAR(500), 
    Prioridade INT,
    Status NVARCHAR(50),
    Data_Criacao DATE,
    Data_Conclusao DATE
);

```



# Autor

José Ricardo Kinaip Soares

https://www.linkedin.com/in/wmazoni
