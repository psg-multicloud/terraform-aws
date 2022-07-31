variable "location" {
    description = "variavel que indica a região onde os recursos vão ser criados"
    type = string
    default = "East US"
}

variable "account_tier" {
    description = "Tier da Storage Account na Azure"
    type = string
    default = "Standard"  
}

variable "account_replication_type" {
    description = "Tipo de replicação de dados da storage account"
    type = string
    default = "LRS"
}