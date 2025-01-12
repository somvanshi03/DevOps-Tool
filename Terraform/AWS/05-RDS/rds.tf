

resource "aws_db_instance" "my_db_instance" {
  # RDS Instance Configuration
  allocated_storage    = 20
  storage_type         = "gp2" 
  engine               = "mysql"  # You can change this to your preferred engine like "postgres", "oracle", etc.
  engine_version       = "8.0"  # Specify version depending on the engine
  instance_class       = "db.t3.micro"  # Choose the instance size according to your needs
  db_name              = "mydb"
  username             = "admin"
  password             = "mysecurepassword"  # Use a strong password or manage it using AWS Secrets Manager
  parameter_group_name = "default.mysql8.0"  # Choose an appropriate parameter group for the engine
  skip_final_snapshot  = true  # Set to false if you want to create a final snapshot on delete
  multi_az             = false  # Enable if you need a Multi-AZ setup for high availability
  publicly_accessible  = true  # Set to true if you want the instance to be publicly accessible
  backup_retention_period = 7  # Number of days to retain backups
  final_snapshot_identifier = "mydb-final-snapshot"  # Optional final snapshot when the DB is deleted

  tags = {
    Name = "MyDBInstance"
  }
}
