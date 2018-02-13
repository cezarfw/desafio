#------------váriaveis---------#


#. Arquivo com o log de acesso .#
access_log="/var/log/nginx/access.log";

#. E-mail para notificação .#
email="cezarfw@gmail.com"


#-------------- código_função --------------#
DATA=$(grep `date +%d/` ${access_log});
ssmtp ${email} << CORPO_MENSAGEM
To: cezarfw@gmail.com
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
