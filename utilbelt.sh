#!/bin/bash

#++++++++++++++++++++++++++++#
#.....:: UtilBelt 1.0 ::.....#
#·····:: By SapecaSec ::·····#
#============================#
:;:;:;:;:;:;clear;:;:;:;:;:;:;


if [[ $UID != 0 ]]
then
	printf "\n\033[0;33m[!] Você precisa ser root para rodar esse script. Seu UID atual é: $UID\033[0m\n\n"
	exit
else
	printf "\n\n[+] Para rodar esse script, você precisa ter o Git instalado. Deseja instalar agora? [S/n]: "
	read optGit
	if [[ $optGit == "s" ]]
	then
		apt install git -y --fix-missing
		clear
	else
		exit
	fi

	printf "\n\n[*] Iniciando script UtilBelt 1.0 como o usuário $USER."

	while :
		do
			printf "\n\n[+] Insira o caminho do diretório para os arquivos serem gravados (vazio para home): " ; read pathBelt


			if [[ $pathBelt == "" ]]
			then
				printf "\n[*] Tudo certo. O diretório escolhido é $HOME."
				pathBelt=$HOME
				break
			fi


			if [[ -d $pathBelt ]]
			then
				printf "\n[*] Tudo certo. O diretório escolhido é $pathBelt."
				break
			else
				clear
				printf "\n[!] O diretório escolhido não existe. Escolha outro."
			fi
		done
fi


#============================#
:;:;:;:;:;:;clear;:;:;:;:;:;:;


while :
	do
		printf "\n\n+-+-+- Menu de instalações -+-+-+\n"

		if [[ $opt1 == true ]]
		then
			printf "\nVOCÊ ESCOLHEU A OPÇÃO 1. DESEJA INCLUIR MAIS ALGUMA? (CASO NÃO QUEIRA, DIGITE \"q\" PARA PROSSEGUIR COM A INSTALAÇÃO)"
		fi
		if [[ $opt2 == true ]]
		then
			printf "\nVOCÊ ESCOLHEU A OPÇÃO 2. DESEJA INCLUIR MAIS ALGUMA? (CASO NÃO QUEIRA, DIGITE \"q\" PARA PROSSEGUIR COM A INSTALAÇÃO)"
		fi
		if [[ $opt3 == true ]]
		then
			printf "\nVOCÊ ESCOLHEU A OPÇÃO 3. DESEJA INCLUIR MAIS ALGUMA? (CASO NÃO QUEIRA, DIGITE \"q\" PARA PROSSEGUIR COM A INSTALAÇÃO)"
		fi
		if [[ $opt4 == true ]]
		then
			printf "\nVOCÊ ESCOLHEU A OPÇÃO 4. DESEJA INCLUIR MAIS ALGUMA? (CASO NÃO QUEIRA, DIGITE \"q\" PARA PROSSEGUIR COM A INSTALAÇÃO)"
		fi

		if [[ $opt5 == true ]]
		then
			printf "\nVOCÊ ESCOLHEU A OPÇÃO 5. DESEJA INCLUIR MAIS ALGUMA? (CASO NÃO QUEIRA, DIGITE \"q\" PARA PROSSEGUIR COM A INSTALAÇÃO)"

		fi

		printf "\n\n[1] Aplicações do dia a dia (digite \"info 1\" para saber mais)."
		printf "\n[2] Aplicações para diversão/usos diversos (digite \"info 2\" para saber mais)."
		printf "\n[3] Ferramentas do Kali Linux (digite \"info 3\" para saber mais)."
		printf "\n[4] Outras diferentes aplicações para hacking (digite \"info 4\" para saber mais)."
		printf "\n[5] Todas opções acima.\n\n"

		echo -n "> " ; read optBelt

               #------------#

		if [[ $optBelt == "info 1"  ]]
		then
			less infosrc/1.txt
		fi

		if [[ $optBelt == "info 2" ]]
		then
			less infosrc/2.txt
		fi

		if [[ $optBelt == "info 3" ]]
		then
			less infosrc/3.txt
		fi


		if [[ $optBelt == "info 4" ]]
		then
			less infosrc/4.txt
		fi

               #------------#

		if [[ $optBelt == "1"  ]]
		then
			opt1=true
		fi

		if [[ $optBelt == "2" ]]
		then
			opt2=true
		fi

		if [[ $optBelt == "3" ]]
		then
			opt3=true
		fi

		if [[ $optBelt == "4" ]]
		then
			opt4=true
		fi

		if [[ $optBelt == "5" ]]
		then
			opt5=true
		fi

		#-----------#

		if [[ $optBelt == "q" ]]
		then
			break
		fi

		clear
	done


#============================#
:;:;:;:;:;:;clear;:;:;:;:;:;:;
:;:;:;:;:;string=();:;:;:;:;:;

for i in $(lscpu | grep Architecture)
do
	string+=($i)
done

bits=${string[1]}

if [[ $bits == "x86_64" ]]
then
	bits64=true
fi


if [[ $opt5 == true ]]
then

	if [[ $bits64 == true ]]
	then
		apt install snapd flatpak wine64 php golang-go python3 python-is-python3 python3-pip ruby-full ftp smbclient curl tor perl -y --fix-missing
	else
		apt install snapd flatpak wine32 php golang-go python3 python-is-python3 python3-pip ruby-full ftp smbclient curl tor perl -y --fix-missing
	fi

	service snapd start              ;
	snap install neofetch            ;
	snap install telegram-desktop    ;
	snap install discord             ;
	service snapd stop               ;

	wget https://www.torproject.org/dist/torbrowser/11.0.10/tor-browser-linux64-11.0.10_en-US.tar.xz -O $pathBelt/tor.tar.xz
	tar -xf $pathBelt/tor.tar.xz
	rm $pathBelt/tor.tar.xz wget-log 2>/dev/null

	apt install cmatrix cowsay aview fortune sl espeak figlet -y --fix-missing

	echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" >> /etc/apt/sources.list
	echo "deb-src http://http.kali.org/kali kali-rolling main non-free contrib" >> /etc/apt/sources.list

	apt install metasploit-framework wafw00f ffuf wfuzz rkhunter gobuster burpsuite wireshark exploit-db nikto sqlmap nmap wpscan hydra beef fcrackzip john enum4linux exiftool dnsenum -y --fix-missing

	wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh -O $pathBelt/linpeas.sh

	wget https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_amd64.gz -O $pathBelt/chisel.gz
	gunzip $pathBelt//chisel.gz

	cd $pathBelt ; git clone https://github.com/radareorg/radare2
	chmod +x $pathBelt/radare2/sys/install.sh
	$pathBelt/radare2/sys/install.sh

	wget https://www.trapkit.de/tools/checksec/checksec.sh -O $pathBelt/checksec.sh
	chmod +x $pathBelt/checksec.sh

	wget https://github.com/openwall/john/raw/bleeding-jumbo/run/ssh2john.py -O $pathBelt/ssh2john.py
	chmod +x $pathBelt/ssh2john.py

	wget https://dl.pstmn.io/download/latest/linux64 -O $pathBelt/postman.tar.gz
	tar -xzf $pathBelt/postman.tar.gz ; rm $pathBelt/postman.tar.gz

	wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz -O $pathBelt/ngrok.tar.gz
	tar -xzf $pathBelt/ngrok.tar.gz ; rm $pathBelt/ngrok.tar.gz


	clear

	printf "\n\n[*] Instalação completa."
	exit
fi


if [[ $opt1 == true ]]
then
	if [[ $bits64 == true ]]
	then
		apt install snapd flatpak wine64 php golang-go python3 python-is-python3 python3-pip ruby-full ftp smbclient curl tor perl -y --fix-missing
	else
		apt install snapd flatpak wine32 php golang-go python3 python-is-python3 python3-pip ruby-full ftp smbclient curl tor perl -y --fix-missing
	fi

	service snapd start              ;
	snap install neofetch            ;
	snap install telegram-desktop    ;
	snap install discord             ;
	service snapd stop               ;

	wget https://www.torproject.org/dist/torbrowser/11.0.10/tor-browser-linux64-11.0.10_en-US.tar.xz -O $pathBelt/tor.tar.xz
	tar -xf $pathBelt/tor.tar.xz
	rm $pathBelt/tor.tar.xz wget-log 2>/dev/null

fi

if [[ $opt2 == true ]]
then
	apt install cmatrix cowsay aview fortune sl espeak figlet -y --fix-missing
fi

if [[ $opt3 == true ]]
then
	echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" >> /etc/apt/sources.list
	echo "deb-src http://http.kali.org/kali kali-rolling main non-free contrib" >> /etc/apt/sources.list

	apt install metasploit-framework wafw00f ffuf wfuzz rkhunter gobuster burpsuite wireshark exploit-db nikto sqlmap nmap wpscan hydra beef fcrackzip john enum4linux exiftool dnsenum -y --fix-missing
fi

if [[ $opt4 == true ]]
then
	wget https://github.com/carlospolop/PEASS-ng/releases/latest/download/linpeas.sh -O $pathBelt/linpeas.sh
	chmod +x $pathBelt/linpeas.sh

	wget https://github.com/jpillora/chisel/releases/download/v1.7.7/chisel_1.7.7_linux_amd64.gz -O $pathBelt/chisel.gz
	gunzip $pathBelt/chisel.gz ; chmod +x $pathBelt/chisel

	cd $pathBelt ; git clone https://github.com/radareorg/radare2
	chmod +x $pathBelt/radare2/sys/install.sh
	$pathBelt/radare2/sys/install.sh

	wget https://www.trapkit.de/tools/checksec/checksec.sh -O $pathBelt/checksec.sh
	chmod +x $pathBelt/checksec.sh

	wget https://github.com/openwall/john/raw/bleeding-jumbo/run/ssh2john.py -O $pathBelt/ssh2john.py
	chmod +x $pathBelt/ssh2john.py

	wget https://dl.pstmn.io/download/latest/linux64 -O $pathBelt/postman.tar.gz
	tar -xzf $pathBelt/postman.tar.gz ; rm $pathBelt/postman.tar.gz
	

	wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz -O $pathBelt/ngrok.tar.gz
	tar -xzf $pathBelt/ngrok.tar.gz ; rm $pathBelt/ngrok.tar.gz
	chmod +x $pathBelt/ngrok
fi


#============================#
:;:;:;:;:;:;clear;:;:;:;:;:;:;

printf "\n\n[*] Instalação completa."
exit
