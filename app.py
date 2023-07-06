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
@app.route('/showsection/', methods=['GET'])
def show_section():
    query_params = request.args
    sid = query_params.get('sid')
    query =f''' SELECT class_no ,Course.name , Department.dname, Person.fname ,Person.lname FROM University.Section,Course, Instructor,Person , Department where Section.courseid = Course.id AND instructorid = Instructor.id AND Course.did = Department.did AND Instructor.id = Person.id AND Section.id  = {str(sid)} ;'''    
    cursor.execute(query)
    result = cursor.fetchall()
    return jsonify(result)
@app.route('/showexam/', methods=['GET'])
def show_exam():
    query_params = request.args
    sid = query_params.get('sid')
    query =f''' SELECT final_date , Course.name FROM Section , Section_Student , Course WHERE Section_Student.stid = {str(sid)} AND Section_Student.sectid = Section.id AND Section.courseid = Course.id;'''
    cursor.execute(query)
    result = cursor.fetchall()
    return jsonify(result)

@app.route('/deletesection/', methods=['DELETE'])
def delete_section():
    query_params = request.args
    sid = query_params.get('sid')
    sectid = query_params.get('sectid')
    query =f''' DELETE FROM Section_Student WHERE Section_Student.stid = "{sid}" AND Section_Student.sectid = "{sectid}";'''
    cursor.execute(query)
    conn.commit()
    return jsonify({'message': 'Section deleted successfully'})

if __name__ == '__main__':
    app.run()
