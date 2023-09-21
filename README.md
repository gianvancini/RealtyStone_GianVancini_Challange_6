# Programa de Bolsas Compass - RealityStone QA - Challange 6

## Sobre o projeto

Neste projeto, Sprint 6 do programa de bolsas da Compass, foi executado um plano de testes para o site Parabank. Após o plano desenvolvido, foi feito os testes manuais seguindo o plano e relatado os bugs encontrados e melhorias a serem feitas. Por fim, foi feito a automação dos testes no site Parabank, utilizando dois navegadores, o Chrome e o Firefox.

## Objetivo

O objetivo do trabalho é desenvolver os conhecimentos adquiridos durante a trilha. Durante as sprints do programa de bolsas adquirimos conhecimentos sobre Git e GitHub, a liguagem Ruby, o framework Cucumber e as bibliotecas Capybara, Selenium WebDriver e SitePrism.

## Tecnologias utilizadas
- Git e GitHub
- Ruby
- Cucumber
- Capybara
- Selenium-webdriver 
- SitePrism

## Como executar o projeto

### Requisitos

Para executar o projeto e rodar os testes, é necessário ter instalado em sua máquina o Ruby.

### Passo a Passo

Dentro deste repositório há 3 pastas, contendo o mapa mental, o plano de testes e os testes automatizados. Então segue os passos para executar os testes:

- Clonar o repositório "RealtyStone_GianVancini_Challange_6" do GitHub
- Acessar a pasta "TestesAutomatizados" com o terminal de comandos
- Executar no terminal o comando:
```bash
    bundle install
```
- Os testes foram divididos em três grandes grupos, que são, as funcionalidades da home, as funcionalidades de register/login, e as funcionalidades do banco em si.
- Os testes também podem ser executados com o navegador Chrome ou Firefox, sendo "default" para o Chrome e "other" para o firefox.

Para executar os testes da home no chrome, deve ser digitado no terminal: 
```bash
    cucumber -p default --tags "not @ignore and @home"
```
Ou como citado acima, pode ser alterado a palavra "default" para "other"para rodar no Firefox.
A tag @ignore está ignorando alguns testes, devido há necessitar melhorias/validações no site para após fazer estes testes.

Para executar os testes de login/register no chrome, deve ser digitado no terminal: 
```bash
    cucumber -p default --tags "not @ignore and @account"
```

Para executar os testes das funcionalidades do banco, como transferencias, pagamentos, entre outras, deve ser digitado no terminal: 
```bash
    cucumber -p default --tags "not @ignore and @user"
```

Também podem ser executados todos os testes de uma vez só, digitando no terminal:
```bash
    cucumber -p default --tags "not @ignore and @regression"
```
Porém, o servidor do site Parabank parece ter problemas com muitas requisições em um curto intervalo de tempo. Se for executado os testes como foi dividido acima, é executado com sucesso, mas se executado um teste de regressão, o servidor retorna vários erros 503.

Dentro da pasta TestesAutomatizados > Features > Specs, podem ser visualizado as tags dos testes individuais, assim, pode ser executado qualquer teste individualmente, como por exemplo:
```bash
    cucumber -p default --tags "@valid_login"
```

## Resultados

Os resultados dos testes podem sem verificados nos anexos do plano de teste ou na planilha Parabank, ambos dentro da pasta [PlanoDeTeste](https://github.com/gianvancini/RealtyStone_GianVancini_Challange_6/tree/main/PlanoDeTeste) deste repositório. Também pode ser verificado as issues levantadas durante todo o processo, acessando o projeto dentro deste repositório, ou clicando [aqui](https://github.com/users/gianvancini/projects/3/).

## Autor

Gian Vancini

https://www.linkedin.com/in/gian-vancini
