variable "cidr_blocks_list"
type = list(string)

cidr_blocks_list = ["10.0.0.0/24", "10.0.10.0/24"]

name = var.cidr_blocks_list[0]
cidr_block = var.cidr_blocks_list[1]

-----------------------------------------

variables "cidr_blocks"
    type = list(object({
        cidr_block = string
        name = string
    }))

cidr_blocks = [
    {cidr_block = "10.0.0.10/24", name = "dev-vpc"}
    {cidr_block = "10.0.10.0/16", name = "dev-subnet"}
    ]


name0 = var.cidr_blocks[0].name
cidr_block0 = var.cidr_blocks[0].cidr_block
name1 = var.cidr_blocks[1].name
cidr_block1 = var.cidr_blocks[1].cidr_block

-----------------------------------------------
