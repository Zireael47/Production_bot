def request_sql(conn, query):
    with conn:
        cursor = conn.cursor()
        data = cursor.execute(query).fetchall()
        cursor.close()
        return data
