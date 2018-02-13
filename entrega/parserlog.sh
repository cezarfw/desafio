#!/bin/bash
#
#
# Script que parseia o log de acesso do servidor Web que rode diariamente e envia por e-mail um 
# simples relatório, com a frequência das requisições e o respectivo código de resposta (ex:5 200);
#
#
# Autor: Cezar Augusto Roggia
# E-mail: cezarfw@gmail.com
#
#
# Data: 10/02/2018
#
#
#============================================================================================


#------------váriaveis---------#


#. Arquivo com o log de acesso .#
access_log="/var/log/nginx/access.log";

#. E-mail para notificação .#
email="cezarfw@gmail.com"


#-------------- código_função --------------#
DATA=$(grep `date +%d/` ${access_log});
ssmtp ${email} << CORPO_MENSAGEM
To: 	careers+f30iokxb@linxneemuchaordic.recruiterbox.com
From: desafiolinx@gmail.com
Subject: Dados

 Data: `date +%d/%b/%Y`
        Arquivo: ${access_log}
        Quantidade de requisicoes: $(echo "${DATA}" | wc -l)
        Requisicoes:
        ------------------------------------------------
        $(echo "${DATA}" | awk '{print $7,$9}' | sort | uniq -c | sort -nr)
        ------------------------------------------------
CORPO_MENSAGEM
