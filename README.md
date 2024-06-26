# App_Tarefas
[![NPM](https://img.shields.io/npm/l/react)](https://github.com/jricardo924/App_Tarefas/blob/main/LICENSE) 



# Sobre o projeto

O App-Tarefas é uma aplicação desenvolvida em Delphi Tokyo que visa demonstrar métodos, capacidade técnica e analítica no desenvolvimento de uma aplicação cliente e outra de serviço com framework horse.


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
- Aplicação em Console Application (Serviço)
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
cd c:\
git clone https://github.com/jricardo924/App-Tarefas

# entrar na pasta do projeto
cd C:\App-Tarefas

# Instalação do Horse
No Delphi abrir o Tools >> Options >> Delphi Options >> Library >> Library path: C:\App-Tarefas\Componentes\Horse\horse-master\horse-master\src

# Instalação do RESTResquest4
No Delphi abrir o Tools >> Options >> Delphi Options >> Library >> Library path: C:\App-Tarefas\Componentes\RESTRequest4Delphi-master\src

# Instalação do Horse.Jhonson
No Delphi abrir o Tools >> Options >> Delphi Options >> Library >> Library path: C:\App-Tarefas\Componentes\jhonson-master\src

# executar o projeto Cliente
Abrir executavel na pasta C:\App-Tarefas\Aplicacao\Win32\Debug\App_Tarefas.exe

# executar o projeto Serviço
Abrir executavel na pasta C:\App-Tarefas\Aplicacao\Win32\Debug\App_Servico.exe

# SQL Server

<< Setar o arquivo de conexão com o banco (SQL Server) >>
Abrir o arquivo em C:\App-Tarefas\Servico\Conexao DB\StringConexao.txt
   Exemplo: "Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=master;Data Source=NomeMaquina"


# Criar a tabela no schema master. 

# Estrutura de Dados para Tarefas

Tabela: Tarefas

Id: INT, PRIMARY KEY, IDENTITY(1,1)
Identificador único para cada tarefa, com incremento automático.
Titulo: NVARCHAR(100)
Título da tarefa, com um limite de 100 caracteres.
Descricao: NVARCHAR(500)
Descrição detalhada da tarefa, com um limite de 500 caracteres.
Prioridade: INT
Nível de prioridade da tarefa (por exemplo, 1 para baixa, 2 para média, 3 para alta).
Status: NVARCHAR(50)
Status atual da tarefa (por exemplo, "Pendente", "Em Progresso", "Concluído").
Data_Criacao: DATE
Data em que a tarefa foi criada.
Data_Conclusao: DATE
Data em que a tarefa foi concluída.

# Script de create:

  **ATENÇÃO** Não é necessario criar a tabela, foi desenvolvido um metodo para criar a tabela na primeira consulta, caso não exista.

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

https://www.linkedin.com/in/ricardo-soares-384a4a94
