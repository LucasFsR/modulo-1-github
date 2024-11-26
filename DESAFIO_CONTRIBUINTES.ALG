Algoritmo "desafio_contribuintes"


// Parametros:
// quantia: valor recebido como salário
// Efeito: retorna o imposto a ser pago sobre o salário

funcao impostoSobreSalario(quantia: real) : real


var

salarioMensal, imposto: real

inicio

salarioMensal <- quantia / 12

se (salarioMensal < 3000) entao
 imposto <- 0
senao
 se (salarioMensal >= 3000) e (salarioMensal < 5000) entao
  imposto <- quantia * 0.1
 senao
  imposto <- quantia * 0.2
 fimse
fimse

retorne imposto


fimfuncao


// Parametros:
// quantia: valor recebido como prestação de serviços
// Efeito: retorna o imposto a ser pago sobre prestação de serviços

funcao impostoSobreServicos(quantia: real) : real


var

imposto: real


inicio

se (quantia <= 0) entao
 imposto <- 0
senao
 imposto <- quantia * 0.15
fimse

retorne imposto

fimfuncao



// Parametros:
// quantia: valor recebido como ganho de capital
// Efeito: retorna o imposto a ser pago sobre ganhos de capital

funcao impostoSobreGC(quantia: real) : real


var

imposto: real


inicio

se (quantia <= 0) entao
 imposto <- 0
senao
 imposto <- quantia * 0.2
fimse

retorne imposto


fimfuncao



// Parametros:
// salario: valor recebido como salário
// servicos: valor recebido como prestação de serviços
// gc: valor recebido como ganho de capital
// Efeito: retorna o imposto bruto total a ser pago

funcao impostoBrutoTotal(salario: real; servicos: real; gc: real) : real


var

salarioMensal, imposto1, imposto2, imposto3, impostoFinal: real



inicio

salarioMensal <- salario / 12

se (salarioMensal < 3000) entao
 imposto1 <- 0
senao
 se (salarioMensal >= 3000) e (salarioMensal < 5000) entao
  imposto1 <- salario * 0.1
 senao
  imposto1 <- salario * 0.2
 fimse
fimse

se (servicos <= 0) entao
 imposto2 <- 0
senao
 imposto2 <- servicos * 0.15
fimse

se (gc <= 0) entao
 imposto3 <- 0
senao
 imposto3 <- gc * 0.2
fimse

impostoFinal <- imposto1 + imposto2 + imposto3

retorne impostoFinal



fimfuncao


// Parametros:
// salario: valor recebido como salário
// servicos: valor recebido como prestação de serviços
// gc: valor recebido como ganho de capital
// gastosMedicos: valor gasto com despesas médicas
// gastosEducacionais: valor gasto com despesas educacionais
// Efeito: retorna o valor que o contribuinte pode abater no seu imposto

funcao abatimento(salario: real; servicos: real; gc: real; gastosMedicos: real; gastosEducacionais: real) : real


var

salarioMensal, somaGastos, impostoFinal, imposto1, imposto2, imposto3, trintaPorcBruto: real

inicio

somaGastos <- gastosMedicos + gastosEducacionais
salarioMensal <- salario / 12

se (salarioMensal < 3000) entao
 imposto1 <- 0
senao
 se (salarioMensal >= 3000) e (salarioMensal < 5000) entao
  imposto1 <- salario * 0.1
 senao
  imposto1 <- salario * 0.2
 fimse
fimse

se (servicos <= 0) entao
 imposto2 <- 0
senao
 imposto2 <- servicos * 0.15
fimse

se (gc <= 0) entao
 imposto3 <- 0
senao
 imposto3 <- gc * 0.2
fimse

impostoFinal <- imposto1 + imposto2 + imposto3
trintaPorcBruto <- impostoFinal * 0.3

se somaGastos < trintaPorcBruto entao
 retorne somaGastos
senao
 retorne trintaPorcBruto
fimse


fimfuncao


Var

salarioAnual, prestacaoServAnual, capitalAnual, gastosMed, gastosEdu: real


Inicio

escreval("Digite os dados do contribuinte: ")
escreva("Renda anual com salario: ")
leia(salarioAnual)
escreva("Renda anual com prestacao de servico: ")
leia(prestacaoServAnual)
escreva("Renda anual com ganho de capital: ")
leia(capitalAnual)
escreva("Gastos medicos: ")
leia(gastosMed)
escreva("Gastos educacionais: ")
leia(gastosEdu)
escreval
escreval("RELATORIO: ")
escreva("Imposto sobre salario: ", impostoSobreSalario(salarioAnual):4:2)
escreval
escreva("Imposto sobre servicos: ", impostoSobreServicos(prestacaoServAnual):4:2)
escreval
escreva("Imposto sobre ganho de capital: ", impostoSobreGC(capitalAnual):4:2)
escreval
escreva("Imposto bruto total: ", impostoBrutoTotal(salarioAnual, prestacaoServAnual, capitalAnual):4:2)
escreval
escreva("Abatimento: ", abatimento(salarioAnual, prestacaoServAnual, capitalAnual, gastosMed, gastosEdu):4:2)
escreval
escreva("Imposto devido: ", impostoBrutoTotal(salarioAnual, prestacaoServAnual, capitalAnual) - abatimento(salarioAnual, prestacaoServAnual, capitalAnual, gastosMed, gastosEdu):4:2)


Fimalgoritmo