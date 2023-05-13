variable "cidr_blocks_list"
type = list(string)

cidr_blocks_list = ["10.0.0.0/24", "10.0.10.0/24"]

name = var.cidr_blocks_list[0]


variables "cidr_blocks"
    type = list(object({
        cidr_block = string
        name = string
    }))

cidr_blocks = [
    {cidr_block = ""}
]