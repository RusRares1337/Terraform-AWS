terraform {
	required_version = ">= 0.12"
	backend "s3" {
		bucket = "myapp-bucket"
		key = "myapp/state.tfstate"
		region = "eu-west-3"
	}	
}

provider "aws" {
    region = "eu-west-3"
}


resource "aws_vpc" "myapp-vpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
        Name: "${var.env_prefix}-vpc"
    }
}

resource "aws_s3_bucket" "bucket" {
  bucket = "myapp-bucket"
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

module "myapp-subnet" {
    source = "./modules/subnet"
    subnet_cidr_block = var.subnet_cidr_block
    avail_zone = var.avail_zone
    env_prefix = var.env_prefix
    vpc_id = aws_vpc.myapp-vpc.id
    default_route_table_id = aws_vpc.myapp-vpc.default_route_table_id
}


module "myapp-webserver" {
    source = "./modules/webserver"
    image_name = var.image_name
    vpc_id = aws_vpc.myapp-vpc.id
    my_ip = var.my_ip
    env_prefix = var.env_prefix
    public_key_location = var.public_key_location
    instance_type = var.instance_type
    subnet_id = module.myapp-subnet.subnet.id #module.moduleName.OuputNameOfThatModule.ID
    avail_zone = var.avail_zone
}
