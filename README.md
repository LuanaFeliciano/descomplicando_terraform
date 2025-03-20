
## Autenticação com a AWS usando o Terraform

O Terraform requer credenciais da AWS para criar e gerenciar recursos na nuvem. Existem diferentes formas de fornecer essas credenciais ao Terraform. Abaixo, explicamos como exportar as credenciais da AWS como variáveis de ambiente ou usar um arquivo de credenciais.

### 1. Exportar variáveis de ambiente no Linux/Mac
Antes de executar qualquer comando Terraform, exporte as variáveis de ambiente no terminal:

```bash
export AWS_ACCESS_KEY_ID="your-access-key-id"
export AWS_SECRET_ACCESS_KEY="your-secret-access-key"
export AWS_DEFAULT_REGION="us-east-2"
```

## Comandos Terraform para Gerar, Aplicar e Destruir Planos


### 1. `terraform init -upgrade`
- **Descrição**: O comando `terraform init -upgrade` inicializa o diretório de trabalho, mas também força a atualização dos plugins e módulos para as versões mais recentes.
- **Uso**: Use quando precisar garantir que todos os provedores e módulos sejam atualizados para a versão mais recente disponível.
- **Exemplo**: Execute `terraform init -upgrade` para atualizar os plugins/provedores e módulos antes de executar outros comandos como `terraform plan` ou `terraform apply`.

### 2. `terraform plan -out plano`
- **Descrição**: Este comando gera um plano de execução e o salva no arquivo `plano`. O plano contém as mudanças propostas para a infraestrutura.
- **Uso**: Revise o plano antes de aplicar as mudanças.
- **Aplicação**: Após gerar o plano, execute `terraform apply plano` para aplicar as mudanças na infraestrutura.

### 3. `terraform plan -out plano -var-file=testing.tfvars`
- **Descrição**: Este comando gera um plano de execução e o salva no arquivo `plano`, carregando variáveis de um arquivo externo chamado `testing.tfvars`.
- **Uso**: Use quando precisar carregar um conjunto de variáveis específicas de um arquivo.
- **Aplicação**: Após gerar o plano, execute `terraform apply plano` para aplicar as mudanças na infraestrutura.

### 4. `terraform plan -out plano -var="image_id=ami-abc123"`
- **Descrição**: Este comando gera um plano de execução e o salva no arquivo `plano`, passando variáveis diretamente pela linha de comando.
- **Uso**: Use quando precisar passar variáveis rapidamente sem editar um arquivo `tfvars`.
- **Aplicação**: Após gerar o plano, execute `terraform apply plano` para aplicar as mudanças na infraestrutura.

### 5. `terraform apply`
- **Descrição**: Aplica as mudanças descritas no plano gerado ou na configuração atual do Terraform na infraestrutura.
- **Uso**: Use `terraform apply` após gerar um plano com `terraform plan`, ou execute diretamente para aplicar as configurações definidas.
- **Exemplo**: Após rodar `terraform plan -out plano`, execute `terraform apply plano` para aplicar as mudanças.

### 6. `terraform destroy`
- **Descrição**: Destrói todos os recursos gerenciados pelo Terraform, removendo-os da infraestrutura.
- **Uso**: Use quando você não precisar mais da infraestrutura criada ou quando quiser limpar os recursos provisionados.
- **Exemplo**: Execute `terraform destroy` para destruir todos os recursos ou `terraform destroy -auto-approve` para destruir sem confirmação interativa.




## Formas de Fornecer Variáveis no Terraform

O Terraform oferece várias maneiras de fornecer variáveis para a execução de seus comandos. Abaixo, explicamos como você pode configurar variáveis de diferentes fontes e como o Terraform irá carregá-las automaticamente.

### 1. **Arquivo `terraform.tfvars`**
O Terraform carrega automaticamente o arquivo `terraform.tfvars` (se presente no diretório de trabalho) para definir as variáveis. Esse é o método padrão de fornecer variáveis.

### 2. **Arquivos com sufixo `.auto.tfvars`**
Além do arquivo `terraform.tfvars`, o Terraform carrega automaticamente qualquer arquivo que termine com `.auto.tfvars`. Isso permite que você separe variáveis em diferentes arquivos de forma automatizada.

### 3. **Arquivos com sufixo `.tfvars`**
Você pode criar arquivos personalizados com qualquer nome seguido por .tfvars e carregá-los usando a flag `-var-file` nos comandos Terraform (por exemplo, `terraform plan -var-file="custom.tfvars"`). Esses arquivos não são carregados automaticamente, mas podemos especificá-los manualmente.



