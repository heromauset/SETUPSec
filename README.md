# SETUPSec 🛡️

Script interativo para instalação rápida de ferramentas essenciais de **segurança ofensiva**, com foco em **Debian e Ubuntu**.

Desenvolvido para ajudar iniciantes e entusiastas a prepararem seu ambiente com ferramentas confiáveis de **pentest, sniffing, reconhecimento e engenharia social** — tudo via terminal e com explicações práticas de uso.

---

## ⚡ Instalação rápida

Execute diretamente no terminal:

```bash
curl -sSL https://raw.githubusercontent.com/sudoIoti/SETUPSec/main/install.sh | bash
✅ Compatível com Debian 11+ e Ubuntu 20.04+
⚠️ Necessário rodar como root ou com permissões sudo

🛠️ Ferramentas disponíveis no menu
Ferramenta	Função principal
Nmap	Varredura e auditoria de redes
Sn1per	Reconhecimento automatizado de alvos
Metasploit	Framework para exploração de vulnerabilidades
Wireshark (Tshark)	Captura e análise de pacotes de rede (CLI)
SEToolkit	Ataques de engenharia social simulados

Cada item no menu oferece opções para:

📥 Instalar a ferramenta

📘 Ver explicações e exemplos práticos

💻 Rodar comandos básicos

📋 Requisitos
Distribuição baseada em Debian ou Ubuntu

Acesso root/sudo

Conexão com a internet

O script também verifica e instala automaticamente dependências básicas como curl, git e sudo.

🧠 Objetivo
O SETUPSec nasceu com o propósito de economizar tempo e tornar o aprendizado mais acessível, especialmente para quem está montando laboratórios locais de cibersegurança, participando de CTFs, estudando para certificações ou praticando em ambientes controlados.

📁 Estrutura
bash
Copiar
Editar
SETUPSec/
└── install.sh     # Script principal com menu interativo
📜 Licença
Distribuído sob a licença MIT.

✍️ Autor
Desenvolvido por @sudoIoti (Maurício)
Marca: Ioti =)
