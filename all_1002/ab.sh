#!/usr/bin/env bash

##########################################################################################
#                                                                                        #
# Script para realizar teste de carga e analisar quantas requisições a aplicação suporta #
#                                                                                        #
# Autor: Cezar Augusto Roggia                                                            #
# E-mail: cezarfw@gmail.com                                                              #
#                                                                                        #
#                                                                                        #
# Data: 10/02/2018                                                                       #
#                                                                                        #
##########################################################################################



SITE="http://localhost/"
OUTFILE="output.txt"
DIV="\n====================================================================\n"

# if the file doesnt exist, make it
touch $OUTFILE;

#echo "Iniciando analise: $SITE"

#echo "1 usuário simultâneo fazendo 100 acessos na página"


#========================= Primeira linha no arquivo uso > , após substituimos por >> para adicionarmos ======================#

echo "1 usuário simultâneo fazendo 100 requisições na página" > $OUTFILE

#============= Nova linha com espaço vazio para melhor visualização ==================

echo -e "" >> $OUTFILE
ab -l -r -n 100 -c 1 -k -H "Accept-Encoding: gzip, deflate" $SITE >> $OUTFILE

echo -e $DIV >> $OUTFILE

sleep 3

#echo "5 usuários simultâneos cada 10 hits na página"
echo "5 usuários simultâneos cada fazendo 10 requisições na página" >> $OUTFILE
echo "Esta é uma carga de 100 páginas por 5 usuários simultâneos diferentes, cada usuário está fazendo 10 cargas de páginas seqüenciais." >> $OUTFILE
echo "Isso representa uma carga máxima de um site que recebe cerca de 50 mil vezes mais visitas por mês." >> $OUTFILE
echo -e "" >> $OUTFILE
ab -l -r -n 50 -c 10 -k -H "Accept-Encoding: gzip, deflate" $SITE >> $OUTFILE

sleep 3

echo -e $DIV >> $OUTFILE

#echo "10 concurrent users each doing 10 page hits"
echo "10 usuários simultâneos, cada um fazendo 10 requisições na página" >> $OUTFILE
echo "Isso é 100 páginas carregadas por 10 usuários simultâneos diferentes, cada usuário está fazendo 10 cargas de páginas seqüenciais." >> $OUTFILE
echo "Aqui onde a carga começa a realmente testar o servidor web, já que 10 usuários simultâneos é uma carga relevante." >> $OUTFILE
echo -e "" >> $OUTFILE
ab -l -r -n 100 -c 10 -k -H "Accept-Encoding: gzip, deflate" $SITE >> $OUTFILE

sleep 3

echo -e $DIV >> $OUTFILE

#echo "30 usuários simultâneos, cada um fazendo 20 requisições na página"
echo "30 usuários simultâneos, cada um fazendo 20 requisições na página" >> $OUTFILE
echo "Esta é uma carga de 600 páginas por 30 usuários simultâneos diferentes, cada usuário está fazendo 20 cargas de páginas seqüenciais." >> $OUTFILE
echo -e "" >> $OUTFILE
ab -l -r -n 600 -c 30 -k -H "Accept-Encoding: gzip, deflate" $SITE >> $OUTFILE

sleep 3

echo -e $DIV >> $OUTFILE

echo "90 usuários simultâneos, cada um fazendo 30 requisições na página"
echo "90 usuários simultâneos, cada um fazendo 30 requisições na página" >> $OUTFILE
echo "Isto é 2700 páginas carregadas por 90 diferentes usuários simultâneos, cada usuário está fazendo 30 cargas de páginas seqüenciais." >> $OUTFILE
echo "Somente uma configuração do servidor WEB muito bem estruturada com sistema de cache será capaz de lidar com esse tipo de carga." >> $OUTFILE
echo -e "" >> $OUTFILE
ab -l -r -n 2700 -c 90 -k -H "Accept-Encoding: gzip, deflate" $SITE >> $OUTFILE

sleep 3

echo "Teste completo."
