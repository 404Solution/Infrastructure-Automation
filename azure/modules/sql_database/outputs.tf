output "sql_server_id" {
  value = azurerm_mssql_server.main.id
}

output "sql_database_id" {
  value = azurerm_mssql_database.main.id
}
