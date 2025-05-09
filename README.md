# SETUPSec 🛡️

Script interativo para instalação rápida de ferramentas essenciais de **segurança ofensiva**, com foco em **Debian e Ubuntu**.

Desenvolvido para ajudar iniciantes e entusiastas a prepararem seu ambiente com ferramentas confiáveis de **pentest, sniffing, reconhecimento e engenharia social** — tudo via terminal e com explicações práticas de uso.

---

## ⚡ Instalação rápida

Execute diretamente no terminal:

```bash
curl -sSL (https://raw.githubusercontent.com/sudoIoti/SETUPSec/main/install.sh)
```

> ✅ Compatível com **Debian 11+** e **Ubuntu 20.04+**  
> ⚠️ Necessário rodar como **root** ou com permissões `sudo`

---

## 🛠️ Ferramentas disponíveis no menu

| Ferramenta          | Função principal                                |
|---------------------|--------------------------------------------------|
| **Nmap**            | Varredura e auditoria de redes                  |
| **Sn1per**          | Reconhecimento automatizado de alvos           |
| **Metasploit**      | Framework para exploração de vulnerabilidades   |
| **Wireshark (Tshark)** | Captura e análise de pacotes de rede (CLI)  |
| **SEToolkit**       | Simulações de ataques de engenharia social      |

Cada item do menu oferece:

- 📥 Instalação da ferramenta  
- 📘 Explicações e exemplos de uso  
- 💻 Comandos básicos prontos para executar

---

## 📋 Requisitos

- Distribuição baseada em **Debian** ou **Ubuntu**
- Acesso com `root` ou permissões via `sudo`
- Conexão com a internet

> O script também instala automaticamente dependências como `curl`, `git` e `sudo`, caso não estejam presentes.

---

## 🧠 Objetivo

O `SETUPSec` nasceu com o propósito de **economizar tempo** e tornar o aprendizado mais acessível — especialmente para quem está:

- Montando laboratórios locais de cibersegurança  
- Participando de **CTFs**  
- Estudando para certificações  
- Praticando em ambientes controlados

---

## 📁 Estrutura

```bash
SETUPSec/
└── install.sh     # Script principal com menu interativo
```

---

## 📜 Licença

Distribuído sob a licença [MIT](LICENSE).

---

## ✍️ Autor
**Ioti =)**
