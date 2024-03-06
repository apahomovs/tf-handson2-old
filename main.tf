# THIS IS ROOT MAIN FILE TO CALL MODULES:
module "dev_vpc" {
    source = "./vpc_module"
    cidr_block = "10.0.0.0/24"
    vpc_tag = "dev_vpc"
}
module "dev_subnet" {
  source = "./subnets_module"
  for_each = {
    "public_subnet1a" = ["10.0.0.0/26", "us-east-1a", "true", "public_1a"]
    "private_subnet1a" = ["10.0.0.64/26", "us-east-1a", "false", "private_1a"]
    "public_subnet1b" = ["10.0.0.128/26", "us-east-1b", "true", "public_1b"]
    "private_subnet1b" = ["10.0.0.192/26", "us-east-1b", "false", "private_1b"]
  }
  vpc_id = module.dev_vpc.vpc_id
  cidr_block = each.value[0]
  availability_zone = each.value[1]
  map_public_ip_on_launch = each.value[2]
  subnet_tag = each.value[3]
}
module "dev_igw"
  source = "./igw_module"
  vpc_id = module.dev_vpc.vpc.id
  igw_tag = "dev_igw"
  create_attach_igw =
  vpc_tag = "dev_vpc"
module "nat_gateway"
  source = "./nat_gw_module"
  subnet_id =
  natgw_tag =
module "route_tables"
  source = "./rtb_module"
  vpc_id = module.dev_vpc.vpc.id
  gateway_id =
  nat_gateway_id =
  subnets =
