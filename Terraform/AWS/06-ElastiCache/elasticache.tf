
resource "aws_elasticache_subnet_group" "my_subnet_group" {
  name       = "my-subnet-group"
  subnet_ids = ["subnet-12345678", "subnet-23456789"]  # Provide the subnet IDs for the VPC

  tags = {
    Name = "my-elasticache-subnet-group"
  }
}

resource "aws_elasticache_cluster" "my_redis_cluster" {
  cluster_id           = "my-redis-cluster"
  engine               = "redis"  # Engine can be "redis" or "memcached"
  engine_version       = "6.x"  # Specify the Redis version
  node_type            = "cache.t3.micro"  # Choose the instance type
  num_cache_nodes      = 1  # Number of nodes for the cluster (for Redis cluster mode)
  subnet_group_name    = aws_elasticache_subnet_group.my_subnet_group.name
  security_group_ids   = ["sg-12345678"]  # Provide the security group IDs
  maintenance_window   = "sun:05:00-sun:09:00"  # Specify the maintenance window
  snapshot_retention_limit = 5  # How many days to retain snapshots
  port                 = 6379  # Default Redis port

  tags = {
    Name = "MyRedisCluster"
  }

  # Optional: Enable automatic backups for the Redis cluster
  snapshot_window = "05:00-09:00"  # Preferred backup window
}

