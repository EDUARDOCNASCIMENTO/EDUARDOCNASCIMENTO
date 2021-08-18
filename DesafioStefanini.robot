*** Settings ***
Resource  ../Resources/Resource.robot
Test SETUP  Abrir Navegador
Test TEARDOWN  Fechar Navegador

*** Variables ***
${URL}    http://prova.stefanini-jgr.com.br/teste/qa/
${BROWSER}    firefox
&{PESSOA}  nome=Carlos  sobrenome=None  email=None   senha=123

*** Test Case ***
Cenário 01: Verificar página
  Dado que estou na página home do site
  Quando a página estiver carregada
  Então todos os elementos devem estar presentes

Cenário 02: Cadastrar um novo usuário sem preencher o nome
  Dado que estou na página home do site
  Quando eu preencher os campos sem preencher o "Nome" e clicar em Cadastrar
  Então o usuário não deve ser cadastrado

Cenário 03: Cadastrar um novo usuário sem preencher o e-mail
  Dado que estou na página home do site
  Quando eu preencher os campos sem preencher o "E-mail" e clicar em Cadastrar
  Então o usuário não deve ser cadastrado

Cenário 04: Cadastrar um novo usuário sem preencher a senha
  Dado que estou na página home do site
  Quando eu preencher os campos sem preencher a senha e clicar em Cadastrar
  Então o usuário não deve ser cadastrado

Cenário 05: Cadastrar um novo usuário sem preencher nenhum campo
  Dado que estou na página home do site
  Então o usuário não deve ser cadastrado

Cenário 06: Cadastrar um novo usuário sem preencher o nome completo
  Dado que estou na página home do site
  Quando eu preencher os campos sem preencher o nome completo
  Então o usuário não deve ser cadastrado

Cenário 07: Cadastrar um usuário com e-mail inválido
  Dado que estou na página home do site
  Quando eu preencher os campos com um e-mail inválido
  Então o usuário não deve ser cadastrado

Cenário 08: Cadastrar um usuário com senha inválida
  Dado que estou na página home do site
  Quando eu preencher os campos com uma senha inválida
  Então o usuário não deve ser cadastrado

Cenário 09: Cadastrar um novo usuário
  Dado que estou na página home do site
  Quando eu preencher os campos obrigatórios e clicar em Cadastrar
  Então o usuário deve ser cadastrado

Cenário 10: Cadastrar dois novos usuários
  Dado que estou na página home do site
  Quando eu preencher os campos obrigatórios e clicar em Cadastrar
  Então o usuário deve ser cadastrado
  E preencher novamente os campos obrigatórios e clicar em Cadastrar
  Então o segundo usuário deve ser cadastrado

Cenário 11: Excluir um dos usuários sem interferir no ID
  Dado que estou na página home do site
  Quando eu preencher os campos obrigatórios e clicar em Cadastrar
  Então o usuário deve ser cadastrado
  E preencher novamente os campos obrigatórios e clicar em Cadastrar
  Então o segundo usuário deve ser cadastrado
  E clicar no botão excluir
  Então o segundo usuário deve ser excluído

*** Keywords ***

Dado que estou na página home do site
    Acessar a página home do site

Quando a página estiver carregada
    Conferir se a página foi carregada

Então todos os elementos devem estar presentes
    Conferir se todos os elementos estão presentes

Quando eu preencher os campos obrigatórios e clicar em Cadastrar
    Preencher o campo nome completo
    Preencher o campo e-mail válido
    Preencher o campo senha válida

E preencher novamente os campos obrigatórios e clicar em Cadastrar
  Preencher o campo nome completo
  Preencher o campo e-mail válido
  Preencher o campo senha válida

Então o usuário deve ser cadastrado
  Conferir se o usuário foi cadastrado

Então o segundo usuário deve ser cadastrado
  Conferir se o usuário foi cadastrado
  Conferir se os usuários estão sendo ordenados pelo ID

Quando eu preencher os campos sem preencher o "Nome" e clicar em Cadastrar
  Preencher o campo e-mail válido
  Preencher o campo senha válida

Quando eu preencher os campos sem preencher o "E-mail" e clicar em Cadastrar
  Preencher o campo nome completo
  Preencher o campo senha válida

Quando eu preencher os campos sem preencher a senha e clicar em Cadastrar
  Preencher o campo nome completo
  Preencher o campo e-mail válido

Quando eu preencher os campos sem preencher o nome completo
  Preencher o campo nome incompleto
  Preencher o campo senha válida
  Preencher o campo e-mail válido

Quando eu preencher os campos com um e-mail inválido
  Preencher o campo nome completo
  Preencher o campo e-mail inválido
  Preencher o campo senha válida

Quando eu preencher os campos com uma senha inválida
  Preencher o campo nome completo
  Preencher o campo e-mail válido
  Preencher o campo senha inválida

Então o usuário não deve ser cadastrado
  Conferir se o usuário não foi cadastrado

E clicar no botão excluir
  Excluir o usuário

Então o segundo usuário deve ser excluído
  Conferir se o usuário foi excluído
