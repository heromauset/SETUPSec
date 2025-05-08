#!/bin/bash
clear

echo -e "\e[1;36m"
echo "====================================="
echo "            SETUPSec v1.0        "
echo "             by Ioti =)          "
echo "====================================="
echo -e "\e[0m"
sleep 2

# Detectar distribuição
if [ -f /etc/os-release ]; then
    . /etc/os-release
    DISTRO=$ID
else
    echo "[ERRO] Não foi possível detectar a distribuição."
    exit 1
fi

# Função para instalar dependências obrigatórias
install_if_missing() {
    for pkg in "$@"; do
        if ! dpkg -s "$pkg" &>/dev/null; then
            echo "[INFO] Instalando dependência: $pkg"
            sudo apt install -y "$pkg" > /dev/null 2>&1
            if [ $? -ne 0 ]; then
                echo "[ERRO] Falha ao instalar $pkg."
                exit 1
            fi
        fi
    done
}

# Validar dependências mínimas para o script funcionar
REQUIRED_PACKAGES=(curl git sudo)
echo "[INFO] Verificando dependências básicas..."
install_if_missing "${REQUIRED_PACKAGES[@]}"

# Atualizar repositórios em segundo plano
sudo apt update -y > /dev/null 2>&1 && sudo apt upgrade -y > /dev/null 2>&1

# Submenu para cada ferramenta
ferramenta_menu() {
    local nome="$1"
    local instalar_cmd="$2"
    local aprender_text="$3"
    local executar_cmd="$4"

    while true; do
        clear
        echo -e "\e[1;33m[$nome]\e[0m"
        echo "1) Instalar"
        echo "2) Aprender a usar"
        echo "3) Executar comandos básicos"
        echo "4) Voltar"
        read -p "Escolha uma opção para $nome: " escolha

        case $escolha in
            1)
                eval "$instalar_cmd"
                echo "[OK] $nome instalado."
                read -p "Pressione Enter para continuar..."
                ;;
            2)
                clear
                echo "$aprender_text"
                read -p "Pressione Enter para continuar..."
                ;;
            3)
                eval "$executar_cmd"
                read -p "Pressione Enter para continuar..."
                ;;
            4)
                break
                ;;
            *)
                echo "[ERRO] Opção inválida."
                sleep 1
                ;;
        esac
    done
}

# Menu interativo
while true; do
    clear
    echo -e "\e[1;32m"
    echo "[ MENU DE INSTALAÇÃO - CyberSec Tools ]"
    echo -e "\e[0m"
    echo "1) Nmap"
    echo "2) Sn1per"
    echo "3) Metasploit Framework"
    echo "4) Wireshark (Tshark)"
    echo "5) SEToolkit"
    echo "6) Instalar todas"
    echo "7) Sair"
    read -p "Escolha uma opção: " opcao

    case $opcao in
        1)
            ferramenta_menu "Nmap" \
                "sudo apt install -y nmap > /dev/null 2>&1" \
                "Nmap é uma ferramenta poderosa para varredura e auditoria de redes.

Exemplos comuns:
  nmap 192.168.0.1             # Varredura simples de host
  nmap -sS 192.168.0.0/24       # Scan stealth de rede
  nmap -O 192.168.0.1           # Detectar sistema operacional
  nmap -sV 192.168.0.1          # Detectar versões de serviços

Dica: use -v (verbose) para mais detalhes na saída." \
                "nmap -v scanme.nmap.org"
            ;;
        2)
            ferramenta_menu "Sn1per" \
                "git clone https://github.com/1N3/Sn1per.git > /dev/null 2>&1 && cd Sn1per && bash install.sh > /dev/null 2>&1 && cd .." \
                "Sn1per é usado para realizar reconhecimento automático em alvos web e de rede.

Modos de uso:
  ./sniper domain.com           # Modo alvo simples
  ./sniper -t domain.com -m stealth # Varredura stealth

Modos disponíveis:
  normal, stealth, nuke, web, recon, full

Ele cria relatórios automaticamente no diretório sniper/" \
                "cd Sn1per && ./sniper"
            ;;
        3)
            ferramenta_menu "Metasploit Framework" \
                "curl https://raw.githubusercontent.com/rapid7/metasploit-framework/master/msfinstall | sudo bash > /dev/null 2>&1" \
                "Metasploit é usado para testes de penetração e exploração de vulnerabilidades.

Comandos comuns no msfconsole:
  search exploit               # Buscar exploits
  use exploit/windows/smb/ms17_010_eternalblue
  set RHOST 192.168.0.5        # Definir IP da vítima
  set PAYLOAD windows/meterpreter/reverse_tcp
  exploit                      # Executar o exploit

Dica: use 'help' dentro do msfconsole para mais comandos." \
                "msfconsole"
            ;;
        4)
            ferramenta_menu "Wireshark (Tshark)" \
                "sudo apt install -y tshark > /dev/null 2>&1" \
                "Wireshark (via tshark) permite capturar e analisar tráfego de rede sem interface gráfica.

Comandos úteis:
  tshark -i eth0               # Captura em tempo real
  tshark -r captura.pcap       # Ler arquivo .pcap
  tshark -Y 'http'             # Filtrar pacotes HTTP

Filtros úteis:
  ip.addr==192.168.0.1
  tcp.port==80" \
                "tshark -D"
            ;;
        5)
            ferramenta_menu "SEToolkit" \
                "git clone https://github.com/trustedsec/social-engineer-toolkit.git > /dev/null 2>&1 && cd social-engineer-toolkit && sudo apt install -y python3-pip > /dev/null 2>&1 && pip3 install -r requirements.txt > /dev/null 2>&1 && python3 setup.py install > /dev/null 2>&1 && cd .." \
                "SEToolkit é usado para simular ataques de engenharia social.

Menu principal:
  1) Spear-Phishing Attack
  2) Website Attack Vectors
  3) Infectious Media Generator

Para iniciar:
  sudo python3 setoolkit

Use as opções do menu para gerar links maliciosos, clonar páginas de login, etc.
Requer atenção ética e legal!" \
                "cd social-engineer-toolkit && sudo python3 setoolkit"
            ;;
        6)
            echo "[INFO] Instalando todas as ferramentas..."
            sudo apt install -y nmap wireshark tshark python3-pip > /dev/null 2>&1
            git clone https://github.com/1N3/Sn1per.git > /dev/null 2>&1
            cd Sn1per && bash install.sh > /dev/null 2>&1 && cd ..
            curl https://raw.githubusercontent.com/rapid7/metasploit-framework/master/msfinstall | sudo bash > /dev/null 2>&1
            git clone https://github.com/trustedsec/social-engineer-toolkit.git > /dev/null 2>&1
            cd social-engineer-toolkit
            pip3 install -r requirements.txt > /dev/null 2>&1
            python3 setup.py install > /dev/null 2>&1
            cd ..
            read -p "Todas as ferramentas foram instaladas. Pressione Enter para continuar..."
            ;;
        7)
            echo "[INFO] Saindo..."
            exit 0
            ;;
        *)
            echo "[ERRO] Opção inválida."
            sleep 2
            ;;
    esac

done
