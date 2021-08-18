*** Settings ***
Library  SeleniumLibrary
Library  String

*** Variables ***
${BROWSER}    firefox
${URL}    http://prova.stefanini-jgr.com.br/teste/qa/


*** Keywords ***
##########################   SETUP E TEARDOWN  #################################
Abrir Navegador
  Open Browser    about:blank     ${BROWSER}
  Maximize Browser Window

Fechar Navegador
  Close Browser

################################## AÇÕES #######################################

Acessar a página home do site
  Go To   ${URL}
  Title Should Be   Cadastro de usuários

Preencher o campo nome completo
  ${PESSOA.sobrenome}  Generate Random String  7  [LOWER]
  Input Text   name  ${PESSOA.nome} ${PESSOA.sobrenome}

Preencher o campo nome incompleto
  Input Text   name  ${PESSOA.nome}

Preencher o campo e-mail válido
  ${PESSOA.email}  Generate Random String
  Input Text   email  ${PESSOA.email}@testando.com

Preencher o campo e-mail inválido
  ${PESSOA.email}  Generate Random String
  Input Text   email  ${PESSOA.email}.testando.com

Preencher o campo senha válida
  Input Text   password  ${PESSOA.senha}456ABC

Preencher o campo senha inválida
  Input Text   password  ${PESSOA.senha}

Excluir o usuário
  Wait Until Element Is Visible    id=removeUser2
  Click Element    id=removeUser2

################################## CONFERÊNCIAS ################################

Conferir se a página foi carregada
  Wait Until Page Contains Element    xpath=/html/body/div/div/div/div[2]/h2

Conferir se todos os elementos estão presentes
  Page Should Contain Element    id=name
  Page Should Contain Element    id=email
  Page Should Contain Element    id=password
  Page Should Contain Button     id=register
  Page Should Not Contain Image    xpath=/html/body/div/div/div/div[2]/h2[2]

Conferir se o usuário foi cadastrado
  Click Button    id=register
  Wait Until Element Is Visible    id=removeUser1
  Page Should Contain Element    id=tdUserId1

Conferir se os usuários estão sendo ordenados pelo ID
  Page Should Contain Element    id=tdUserId2

Conferir se o usuário não foi cadastrado
  Click Button    id=register
  Sleep    3s
  Page Should Not Contain    id=removeUser1

Conferir se o usuário foi excluído
  Page Should Not Contain Element    id=removeUser2
