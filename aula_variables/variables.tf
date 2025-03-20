#terraform plan -var="image_id=ami-new-example" -var="ambientes={dev = 't3.medium', prod = 't3.large'}"


# Variável para definir o ID da imagem AMI
variable "image_id" {
  type        = string
  description = "ID da imagem AMI a ser usada para criar a instância"
  default     = "ami-example"

  validation {
    condition     = can(regex("^ami-", var.image_id))  # garantindo que o ID comece com ami
    error_message = "O 'image_id' deve ser um ID de AMI válido, começando com 'ami-'"
  }
  sensitive = true
}

#O sensitive o Terraform não imprime o valor dela no terminal ou em logs durante o processo de execução


# Variável para mapear os tipos de instância por ambiente
variable "ambientes" {
  type        = map(string)
  description = "Mapa contendo os tipos de instância para os ambientes 'dev' e 'prod'"
  default = {
    dev  = "t2.micro"
    prod = "t3.micro"
  }

  validation {
    condition = alltrue([
      contains(["t2.micro", "t3.micro", "t3.medium", "t2.medium"], var.ambientes["dev"]),
      contains(["t2.micro", "t3.micro", "t3.medium", "t2.medium"], var.ambientes["prod"])
    ])
    error_message = "Os tipos de instância 'dev' e 'prod' devem ser um dos seguintes: t2.micro, t3.micro, t3.medium, t2.medium"
  }
}

