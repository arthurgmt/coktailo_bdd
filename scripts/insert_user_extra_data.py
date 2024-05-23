import psycopg2
from psycopg2 import sql

def insert_user_extra_data(user_id, favorite_drinks, creation_date):
    try:
        connection = psycopg2.connect(user="your_user",
                                      password="your_password",
                                      host="your_host",
                                      port="your_port",
                                      database="user_extra_db")

        cursor = connection.cursor()
        insert_query = sql.SQL("""
            INSERT INTO user_extra (user_id, favorite_drinks, creation_date)
            VALUES (%s, %s, %s)
        """)
        cursor.execute(insert_query, (user_id, favorite_drinks, creation_date))
        connection.commit()
        print("Data inserted successfully")

    except (Exception, psycopg2.Error) as error:
        print("Error while inserting data", error)
    finally:
        if connection:
            cursor.close()
            connection.close()

# Example 
insert_user_extra_data(1, 'Mojito, Margarita', '2023-05-23')
