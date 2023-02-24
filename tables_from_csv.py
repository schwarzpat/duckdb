import os           
import duckdb       

conn = duckdb.connect(database=':memory:', read_only=False)  # create a connection to an in-memory DuckDB database

folder_path = '/path/to/folder'    # specify the path to the folder containing the CSV files
for filename in os.listdir(folder_path):   # iterate over all files in the folder
    if filename.endswith('.csv'):   # if the file has a .csv extension
        table_name = os.path.splitext(filename)[0]   # extract the table name by removing the .csv extension
        file_path = os.path.join(folder_path, filename)   # construct the full path to the CSV file
        cursor = conn.cursor()   # create a cursor for the connection
        # execute a SQL query to create a table with the same name as the file (minus the .csv extension),
        # and insert the data from the CSV file into the table using the csv_auto() function
        cursor.execute(f'CREATE TABLE {table_name} AS SELECT * FROM read_csv_auto(\'{file_path}\')')
        
conn.close() 

