# ruby-acbrlib

## Rodando o script 
Copie o arquivo acbrlibnfse64.so para a pasta /sur/lib64
Execute: ruby test.rb

Resultado 
```
Inicialização da ACBrNFe bem-sucedida!
Configuração Resposta: 0
Configuração Log: 0
Configuração Log: 0
Configuração Log: 0
pointer 32768 
 **** Emitido com Erros: -10 -  ****
Finalizado ACBrNFe com sucesso
```

## Issue 1 
Como obter o valor do sResp? 
Parece ter um valor nele, mas não consigo ler. 
Nos logs aparece assim: ` SetRetorno(-10, Nenhum provedor selecionado) ` 
Mas não consigo que retorne a descrição da resposta. 
