import pandas as pd
import psycopg2

def load_data(csv_path: str = '../data/us_cities_states_counties.csv',
              db_name: str = "Payment_Card_Fraud_2025",
              db_user: str = "postgres",
              db_pass: str = "0515",
              db_host: str = "localhost",
              db_port: str = "5432") -> pd.DataFrame:
    """
    Loads and filters transaction data from a PostgreSQL database.
    It uses a local CSV file to filter for US locations only.
    """
    
    # --- Step 1: Get the list of US cities from the local file. ---
    try:
        us_cities_df = pd.read_csv(csv_path, sep='|', on_bad_lines='skip')
    except FileNotFoundError:
        print(f"Error: The file '{csv_path}' was not found. Please check the file path.")
        return pd.DataFrame() # Return an empty DataFrame on error

    us_cities_list = [city.strip().lower() for city in us_cities_df['City']]

    # --- Step 2: Build the SQL query using the cities list. ---
    formatted_cities = ", ".join([f"'{city}'" for city in us_cities_list])
    query = f"""
        SELECT *
        FROM transactions
        WHERE LOWER(TRIM(location)) IN ({formatted_cities});
    """

    # --- Step 3: Connect to the database and load the filtered dataset. ---
    conn = None
    try:
        conn = psycopg2.connect(dbname=db_name, user=db_user, password=db_pass, host=db_host, port=db_port)
        print("Successful connection to the database.")
        df_usa = pd.read_sql_query(query, conn)
        print("US data successfully loaded into a Pandas DataFrame.")
        print(f"Number of rows loaded: {df_usa.shape[0]}")
        return df_usa
    except Exception as e:
        print(f"An error occurred: {e}")
        return pd.DataFrame()
    finally:
        if conn:
            conn.close()
            print("Database connection closed.")

# The function can be called from a separate script to get the DataFrame.
# df = load_data()