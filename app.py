import mysql.connector
from flask import Flask, request, jsonify

app = Flask(__name__)

# Database connection settings
host = 'your_host_name'
database = 'your_database_name'
user = 'your_username'
password = 'your_password'

# Create a database connection
conn = mysql.connector.connect(host=host, database=database, user=user, password=password)

# Create a cursor object to execute queries
cursor = conn.cursor()

# Endpoint to update a specific student
@app.route('/students/<int:student_id>', methods=['PUT'])
def update_student(student_id):
    data = request.get_json()
    
    # Prepare the SQL query
    query = "UPDATE Person SET first_name = %s, last_name = %s, email = %s, age = %s WHERE id = %s"
    values = (data['first_name'], data['last_name'], data['email'], data['age'], student_id)
    
    # Execute the SQL query
    cursor.execute(query, values)
    conn.commit()
    
    return jsonify({'message': 'Student updated successfully'})

if __name__ == '__main__':
    app.run()
