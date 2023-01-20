project_id = "app-cloud-demos"

# VPC - start
network_name                           = "dev-qa-ppd-vpc"
routing_mode                           = "REGIONAL"
auto_create_subnetworks                = true
description                            = "creating test vpc"
delete_default_internet_gateway_routes = false
# VPC - end

subnets = [
  {
    subnet_name           = "dev-qa-ppd-subnet"
    subnet_ip             = "10.190.5.0/24"
    subnet_region         = "us-east4"
    subnet_private_access = "true"
    subnet_flow_logs      = "true"
  }
]


rules = [
  {
    name        = "outbound-deny"
    description = "outbound-deny"
    direction   = "EGRESS"
    priority    = 1000
    ranges      = ["0.0.0.0/0"]
    target_tags = [""]
    allow = [
      {
        protocol = "tcp"
        ports    = ["all"]
      }
    ]
  },

  {
    name        = "outgoing-test"
    description = "outgoing-test"
    direction   = "EGRESS"
    priority    = 1000
    ranges      = ["0.0.0.0/0"]
    target_tags = ["redhat-allow"]
    allow = [
      {
        protocol = "all"
        ports    = ["all"]
      }
    ]
  },

  {
    name        = "allow-dm-port"
    description = "allow-dm-port"
    direction   = "INGRESS"
    priority    = 1000
    ranges      = ["173.201.36.69"]
    target_tags = ["data-manager-5003"]
    allow = [
      {
        protocol = "tcp"
        ports    = ["5003", "5004"]
      }
    ]
  },

  {
    name        = "allow-iap"
    description = "allow-iap"
    direction   = "INGRESS"
    priority    = 1000
    ranges      = ["35.235.240.0/20"]
    target_tags = [""]
    allow = [
      {
        protocol = "tcp"
        ports    = ["808", "1433", "3389"]
      }
    ]
  },

  {
    name        = "allow-rg-dhisco"
    description = "allow-rg-dhisco"
    direction   = "INGRESS"
    priority    = 1000
    ranges      = ["8.40.219.0/24", "103.211.186.0/24", "103.211.187.0/24"]
    target_tags = [""]
    allow = [
      {
        protocol = "tcp"
        ports    = ["3389", "1433", "2222", "22"]
      }
    ]
  },

  {
    name        = "aws-lambda-allow"
    description = "aws-lambda-allow"
    direction   = "INGRESS"
    priority    = 1000
    ranges      = ["3.222.124.167", "54.205.255.97"]
    target_tags = ["aws-lambda"]
    allow = [
      {
        protocol = "tcp"
        ports    = ["1433"]
      }
    ]
  },

  {
    name        = "cassandra-ports"
    description = "cassandra-ports"
    direction   = "INGRESS"
    priority    = 1000
    ranges      = ["10.190.5.0/24", "8.40.219.0/24", "54.205.255.97"]
    target_tags = ["cas-ports"]
    allow = [
      {
        protocol = "tcp"
        ports    = ["7000", "7001", "7199", "9042", "9092", "2181", "9093"]
      }
    ]
  },

  {
    name        = "data-manager-5003"
    description = "data-manager-5003"
    direction   = "INGRESS"
    priority    = 1000
    ranges      = ["173.201.36.70", "173.201.36.71"]
    target_tags = ["data-manager-5003"]
    allow = [
      {
        protocol = "tcp"
        ports    = ["5003", "5004", "5008", "5030"]
      }
    ]
  },

  {
    name        = "data-manager-ppd"
    description = "data-manager-ppd"
    direction   = "INGRESS"
    priority    = 1000
    ranges      = ["34.85.227.110", "35.245.179.126", "35.199.3.190"]
    target_tags = ["data-manager-ppd"]
    allow = [
      {
        protocol = "tcp"
        ports    = ["5003", "5005"]
      }
    ]
  },

  {
    name        = "dev-qa-ppd-vpc-allow-https"
    description = "dev-qa-ppd-vpc-allow-https"
    direction   = "INGRESS"
    priority    = 1000
    ranges      = ["0.0.0.0/0"]
    target_tags = ["http-server"]
    allow = [
      {
        protocol = "tcp"
        ports    = ["443"]
      }
    ]
  },

  {
    name        = "http-allow"
    description = "http-allow"
    direction   = "INGRESS"
    priority    = 1000
    ranges      = ["0.0.0.0/0"]
    target_tags = ["http-server", "https-server"]
    allow = [
      {
        protocol = "tcp"
        ports    = ["443", "80"]
      }
    ]
  },

  {
    name        = "inbound-iap-allow"
    description = "inbound-iap-allow"
    direction   = "INGRESS"
    priority    = 1000
    ranges      = ["35.235.240.0/20", "137.83.192.0/18", "208.127.0.0/16", "34.100.64.0/19", "34.104.6.0/23", "165.1.128.0/17", "66.159.192.0/19", "134.238.0.0/16", "130.41.0.0/16", "34.99.0.0/16", "34.103.0.0/16", "34.100.112.0/20"]
    target_tags = [""]
    allow = [
      {
        protocol = "tcp"
        ports    = ["3389", "1433", "22", "2222"]
      }
    ]
  },


  {
    name        = "internal-allow"
    description = "internal-allow"
    direction   = "INGRESS"
    priority    = 1000
    ranges      = ["10.190.5.0/24"]
    target_tags = [""]
    allow = [
      {
        protocol = "all"
        ports    = ["all"]
      }
    ]
  },

  {
    name        = "kaf-ports"
    description = "kaf-ports"
    direction   = "INGRESS"
    priority    = 1000
    ranges      = ["8.40.219.0/24", "10.190.5.35", "10.190.5.2", "54.205.255.97", "35.236.230.185", "35.194.82.44"]
    target_tags = ["kaf-ports"]
    allow = [
      {
        protocol = "tcp"
        ports    = ["2181", "2182", "2183", "9091", "9092", "9093"]
      }
    ]
  },

  {
    name        = "octopus-deploy-10933"
    description = "octopus-deploy-10933"
    direction   = "INGRESS"
    priority    = 1000
    ranges      = ["45.136.148.28"]
    target_tags = [""]
    allow = [
      {
        protocol = "tcp"
        ports    = ["10933", "10943"]
      }
    ]
  },

  {
    name        = "pghapi-port"
    description = "pghapi-port"
    direction   = "INGRESS"
    priority    = 1000
    ranges      = ["10.190.5.18", "35.199.2.64"]
    target_tags = ["pghapi-port"]
    allow = [
      {
        protocol = "tcp"
        ports    = ["3042"]
      }
    ]
  },

  {
    name        = "sql-allow"
    description = "sql-allow"
    direction   = "INGRESS"
    priority    = 1000
    ranges      = ["35.199.2.64", "35.236.230.185", "137.83.192.0/18", "208.127.0.0/16", "34.100.64.0/19", "34.104.6.0/23", "165.1.128.0/17", "66.159.192.0/19", "134.238.0.0/16", "130.41.0.0/16", "34.99.0.0/16", "34.103.0.0/16", "34.100.112.0/20", "103.211.186.0/23", "35.226.110.55"]
    target_tags = ["sql-allow"]
    allow = [
      {
        protocol = "tcp"
        ports    = ["1433"]
      }
    ]
  },

  {
    name        = "ssh-allow"
    description = "ssh-allow"
    direction   = "INGRESS"
    priority    = 1000
    ranges      = ["8.40.219.0/24", "103.211.186.0/24", "103.211.187.0/24"]
    target_tags = ["ssh-allow"]
    allow = [
      {
        protocol = "tcp"
        ports    = ["22"]
      }
    ]
  }
]


#instance
instance_name = "hospi-qa-sqldb"
machine_type  = "custom-6-39936"
zone          = "us-east4-a"
labels = {
  application-name = "database"
}

tags                      = ["test", "vm"]
deletion_protection       = true
min_cpu_platform          = "Intel Broadwell"
allow_stopping_for_update = true
network                   = "dev-qa-ppd-vpc"
auto_delete               = false
device_name               = "hospi-qa-sql-db"
mode                      = "READ_WRITE"
size                      = "3000"
type                      = "pd-standard"
image                     = "projects/windows-cloud/global/images/windows-server-2022-dc-v20230111"
source_name               = "hospi-qa-sqldb-d"
email                     = "263010608613-compute@developer.gserviceaccount.com"
scopes                    = ["cloud-platform"]


