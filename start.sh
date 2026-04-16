#!/bin/bash

# 🌸🌿 FENRYS BOT V4 - SUA CONEXÃO SUAVE E ENCANTADORA 🌿🌸

# 💖 Função para exibir mensagens coloridas e harmoniosas
echo_color() {
    local color=$1
    local message=$2
    case $color in
        "pink") echo -e "\033[1;95m$message\033[0m" ;;  # Rosa suave
        "lilac") echo -e "\033[1;94m$message\033[0m" ;; # Lilás delicado
        "gold") echo -e "\033[1;93m$message\033[0m" ;;  # Dourado elegante
        "red") echo -e "\033[1;91m$message\033[0m" ;;   # Vermelho suave
        "green") echo -e "\033[1;92m$message\033[0m" ;; # Verde menta
        *) echo -e "$message" ;;
    esac
}

# 🌷 Efeito de carregamento delicado
loading_effect() {
    local message=${1:-"⏳ Carregando com carinho..."}
    echo -n "$message"
    for i in {1..3}; do
        echo -n " ✨"
        sleep 0.5
    done
    echo ""
}

# 🎀 Verificar se já está conectado
verificar_conexao() {
    if [ -f "/path/to/conexao_ativa.txt" ]; then
        return 0  # Conectado
    else
        return 1  # Não conectado
    fi
}

# 💕 Conectar ao Fenrys Bot
conectar() {
    local tipo_conexao=$1
    local parametro=$2
    echo_color "lilac" "🔗 Conectando via $tipo_conexao..."
    loading_effect "Criando vínculo mágico"
    
    if [ "$tipo_conexao" == "QR Code" ]; then
        echo_color "pink" "📸 Escaneie o QR Code com seu celular!"
    else
        echo_color "gold" "🔢 Insira o código gerado no dispositivo."
    fi
    
    node connect.js "$parametro"
}

# 🗑️ Limpar arquivos QR desnecessários
apagar_qr() {
    local dir="./arquivos/database/qr-code"
    if [ -d "$dir" ]; then
        rm -f "$dir"/*
        echo_color "green" "✅ Arquivos QR removidos com sucesso!"
    else
        echo_color "red" "❌ Diretório não encontrado!"
    fi
}

# 🌸 Apresentação do Fenrys Bot V4
while true; do
    if ! verificar_conexao; then
        clear
        echo_color "pink"  "****************************************************"
        echo_color "gold"  " 💕✨ Bem-vinda ao Fenrys Bot V4! ✨💕"
        echo_color "pink"  "****************************************************"
        echo ""
        echo_color "lilac" "🌿 Uma conexão delicada e poderosa para você! 🌿"
        echo ""

        # 🌷 Menu personalizado com numeração grande e destacada
        echo_color "gold"   "🔽 Escolha uma opção:"
        echo ""
        echo_color "pink"  "  1️⃣  Conectar via QR Code 📷"
        echo_color "pink"  "  2️⃣  Conectar via Código 🔢"
        echo_color "lilac" "  3️⃣  Instalar Dependências 🛠️"
        echo_color "lilac" "  4️⃣  Abrir Canal do YouTube 🎀"
        echo_color "gold"  "  5️⃣  Apagar arquivos QR 🗑️"
        echo_color "red"   "  6️⃣  Sair 🚪"
        echo ""

        # ⏳ Tempo para escolha
        read -t 15 -p "⌛ Escolha sua opção (tempo limite: 15s): " opcao
        echo ""

        # Conectar automaticamente se não escolher
        if [ -z "$opcao" ]; then
            echo_color "gold" "⏳ Tempo esgotado! Conectando automaticamente..."
            conectar "QR Code" "não"
        else
            case $opcao in
                1|1️⃣)
                    conectar "QR Code" "não"
                    ;;
                2|2️⃣)
                    conectar "Código" "sim"
                    ;;
                3|3️⃣)
                    echo_color "gold" "🌷 Instalando dependências..."
                    loading_effect "Ajustando tudo para você"
                    apt-get update -y
                    apt-get upgrade -y
                    apt install -y nodejs nodejs-lts ffmpeg wget git
                    echo_color "green" "✅ Prontinho! Agora execute 'sh start.sh' para conectar."
                    ;;
                4|4️⃣)
                    echo_color "lilac" "🎀 Abrindo canal do Fenrys no YouTube..."
                    xdg-open "https://youtube.com/@fenrys_bot" 2>/dev/null
                    ;;
                5|5️⃣)
                    apagar_qr
                    ;;
                6|6️⃣)
                    echo_color "red" "👋 Obrigada por usar o FENRYS BOT V4! Até logo! 🌿✨"
                    exit 0
                    ;;
                *)
                    echo_color "red" "❌ Ops! Opção inválida. Escolha um número entre 1 e 6."
                    ;;
            esac
        fi
    else
        echo_color "green" "🌸 Conexão já ativa! Iniciando Fenrys Bot..."
        loading_effect "Organizando tudo com carinho"
        node start.js
    fi

    # Reinício automático caso ocorra algum erro
    echo_color "red" "⚠️ Oops! Algo deu errado. Reiniciando em 5 segundos..."
    sleep 5
done
