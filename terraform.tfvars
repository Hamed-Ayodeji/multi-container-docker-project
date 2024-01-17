web_app_image = "my_web_app:latest"
db_image = "mysql:latest"
images = ["my_web_app:latest", "mysql:latest"]
app_names = ["my_web_app", "my_db"]
project_name = "k-test"
mysql_config = {
  MYSQL_ROOT_PASSWORD = "password"
  MYSQL_DATABASE      = "my_database"
  MYSQL_USER          = "user"
  MYSQL_PASSWORD      = "user_password"
}