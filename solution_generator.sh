#!/bin/bash

# Verifica se foram fornecidos o nome do projeto e o caminho como argumentos
if [ $# -ne 2 ]; then
    echo "Uso: $0 <caminho_do_projeto> <nome_do_projeto>"
    exit 1
fi

# Caminho onde o projeto será criado
project_path=$1

# Nome do projeto a ser criado
project_name=$2

# Nome da solução
solution_name=$project_name

# Navega para o diretório principal onde a solução e os projetos serão criados
cd "$project_path" || exit

# Criar a solução
dotnet new sln -n $solution_name

# Função para criar projetos
create_project() {
    local project_path=$1
    local project_type=$2
    local project_name=$3

    echo "Criando projeto $project_name em $project_path"
    mkdir -p "$project_path"
    cd "$project_path"
    dotnet new $project_type -n $project_name
    cd ..
    echo "estou no diretorio" 
    pwd
    dotnet sln add "$project_path$project_name/$project_name.csproj"
}

# 1. Driving/API
create_project "$project_path/1. Driving/" webapi service.$project_name.Driving.API

# 2. Core/Application
create_project "$project_path/2. Core/" classlib service.$project_name.Core.Application

# 2. Core/Domain
create_project "$project_path/2. Core/" classlib service.$project_name.Core.Domain

# 3. Driven/API
create_project "$project_path/3. Driven/" classlib service.$project_name.Driven.Adapter.Data

# 4. Tests/Unit
create_project "$project_path/4. Tests/" xunit service.$project_name.Tests

echo "Projetos criados e adicionados à solução $solution_name com sucesso."
