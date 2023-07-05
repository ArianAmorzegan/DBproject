import mysql.connector
from flask import Flask, request, jsonify

app = Flask(__name__)
app.debug = True
# Database connection settings
host = 'localhost'
database = 'University'
user = 'root'
password = '1234'

# Create a database connection
conn = mysql.connector.connect(host=host, database=database, user=user, password=password)

# Create a cursor object to execute queries
cursor = conn.cursor()

# Endpoint to update a specific student
@app.route('/students/', methods=['PUT'])
def update_student():
    print("hi")
    data = request.get_json()
    print(data)
    # Prepare the SQL query
    id = data['id']
    for i in data:
        column = i
        value = data[i]
        if column == 'id':
            continue
        query = f"UPDATE Person SET {column} = '{value}' WHERE id = {id}"

        cursor.execute(query)
        conn.commit()
    
    return jsonify({'message': 'Student updated successfully'})

if __name__ == '__main__':
    app.run()
