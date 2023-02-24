library(duckdb)

# create a connection to an in-memory DuckDB database
conn <- dbConnect(duckdb())

folder_path <- '/path/to/folder'    # specify the path to the folder containing the CSV files
for (filename in list.files(folder_path)) {   # iterate over all files in the folder
  if (endsWith(filename, '.csv')) {   # if the file has a .csv extension
    table_name <- gsub('.csv$', '', filename)   # extract the table name by removing the .csv extension
    file_path <- file.path(folder_path, filename)   # construct the full path to the CSV file
    # execute a SQL query to create a table with the same name as the file (minus the .csv extension),
    # and insert the data from the CSV file into the table using the csv_auto() function
    dbExecute(conn, paste0('CREATE TABLE "', table_name, '" AS SELECT * FROM csv_auto(\'', file_path, '\')'))
  }
}

# close the connection to the DuckDB database
dbDisconnect(conn)
