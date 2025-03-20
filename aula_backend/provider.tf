terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

   backend "s3" {
    bucket = "descomplicando-terraform-luana-s3"
    key    = "backend-aula"
    region = "us-east-2"
  }
}

# Configuração do provedor AWS padrão
# Este provedor será usado por padrão para criar recursos na região us-east-2
provider "aws" {
  region = "us-east-2"
}

# Configuração de um provedor AWS adicional com um alias
# Esse alias permite criar recursos em uma região diferente (us-west-2)
provider "aws" {
  alias  = "west"  # O alias permite que esse provedor seja referenciado separadamente
  region = "us-west-2"
}

#O alias é usado para diferenciar múltiplas configurações do mesmo provedor
#Múltiplas contas no mesmo provedor (exemplo: uma conta para produção e outra para testes).