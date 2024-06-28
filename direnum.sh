#!/bin/bash

# CORES 

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
AZUL='\033[34m'
NC='\033[0m' # SEM COR


if [ "$1" == "" ]
then

	echo -e "${RED}-------------------------------------------------------${NC}"
	echo -e "${YELLOW}|-                     DIRENUM                       -|${NC}"
	echo -e "${RED}-------------------------------------------------------${NC}"
	echo -e "${YELLOW}|-                 Code By: Derived                  -|${NC}"
	echo -e "${YELLOW}|-                   Version: 1.1                    -|${NC}"
	echo -e "${RED}------------------------------------------------------${NC}"
	echo -e "${YELLOW}|- Modo de Uso: ./direnum.sh http://site.com.br     -|${NC}"
	echo -e "${YELLOW}|- Modo de Uso: ./direnum.sh http://site.com.br php -|${NC}"
	echo -e "${RED}-------------------------------------------------------${NC}"

else

	echo -e "${RED}-------------------------------------------------------${NC}"
	echo -e "${YELLOW}|-                    WEB RECON                      -|${NC}"
	echo -e "${RED}-------------------------------------------------------${NC}"
	echo -e "${YELLOW}|-                 Code By: Derived                  -|${NC}"
	echo -e "${YELLOW}|-                   Version: 1.0                    -|${NC}"
	echo -e "${RED}-------------------------------------------------------${NC}"

	sleep 2
	echo -e "${AZUL}[ + ] Buscando por Diretórios${NC}"
	echo -e "${RED}-------------------------------------------------------${NC}"

	# LÊ A WORDLIST
	for palavra in $(cat wordlist.lst)
	do
		# FAZ A REQUISIÇÃO E GUARDA O STATUS CODE NA VARIÁVEL RESPOSTA
		resposta=$(curl -s -H "User-Agent: DerivedTool" -o /dev/null -w "%{http_code}" $1/$palavra/)
		
		# SE O STATUS CODE FOR 200, O DIRETÓRIO FOI ENCONTRADO
		if [ $resposta == "200" ]
		then
			echo -e "${GREEN}Diretório encontrado:${NC} ${YELLOW}$1/$palavra${NC}"
		fi

	done

	# VALIDA SE USUARIO DIGITOU A EXTENSÃO
	if [ "$2" != "" ]
	then

		echo -e "${RED}-------------------------------------------------------${NC}"
		echo -e "${AZUL}[ + ] Buscando por Arquivos${NC}"
		echo -e "${RED}-------------------------------------------------------${NC}"

		# LÊ A WORDLIST
		for palavra in $(cat wordlist.lst)
		do
			# FAZ A REQUISIÇÃO E GUARDA O STATUS CODE NA VARIÁVEL resposta_arq
			resposta_arq=$(curl -s -H "User-Agent: DerivedTool" -o /dev/null -w "%{http_code}" $1/$palavra.$2)

			# SE O STATUS CODE FOR 200, O ARQUIVO FOI ENCONTRADO
			if [ $resposta_arq == "200" ]
			then

				echo -e "${GREEN}Arquivo Encontrado:${NC} ${YELLOW}$1/$palavra.$2${NC}"

			fi
		
		done

	fi

fi