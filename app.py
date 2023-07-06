import datetime
import random
import mysql.connector
from flask import Flask, request, jsonify

app = Flask(__name__)
app.debug = True
# Database connection settings
host = "localhost"
database = "kir2"
user = "root"
password = "mmr21081379"

# Create a database connection
conn = mysql.connector.connect(
    host=host, database=database, user=user, password=password
)

# Create a cursor object to execute queries
cursor = conn.cursor()

start_choose_delete = datetime.datetime(2023, 7, 5, 23, 59, 59)
end_choose_delete = datetime.datetime(2023, 7, 12, 23, 59, 59)


@app.route("/food_reserve/", methods=["GET"])
def reserve_food():
    query_params = request.args
    student_id = query_params.get("sid")
    food_id = query_params.get("fid")
    query = "INSERT INTO food_reserve (fid, sid) VALUES (%s, %s)"
    values = (food_id, student_id)
    cursor.execute(query, values)
    conn.commit()
    return jsonify({"message": "Food reserved successfully"})


@app.route("/food_delete/", methods=["GET"])
def delete_food():
    query_params = request.args
    student_id = query_params.get("sid")
    food_id = query_params.get("fid")
    query = f""" DELETE FROM food_reserve WHERE food_reserve.fid = "{food_id}" AND food_reserve.sid = "{student_id}";"""
    cursor.execute(query)
    conn.commit()
    return jsonify({"message": "Food reservation deleted successfully"})


@app.route("/choose_section/", methods=["GET"])
def choose_section():
    if (
        datetime.datetime.now() > start_choose_delete
        and datetime.datetime.now() < end_choose_delete
    ):
        query_params = request.args
        student_id = query_params.get("stid")
        sec_id = query_params.get("secid")
        sem_id = query_params.get("semid")
        query = f"INSERT INTO section_student (id, sectid, semstuid, status, Score, stid) VALUES({str(random.randint(0, 99))}, {str(sec_id)}, {str(sem_id)}, 0, NULL, {str(student_id)})"
        cursor.execute(query)
        conn.commit()
        return jsonify({"message": "chose section succesfuly"})
    else:
        return jsonify({"message": "ridi hanooz vaghtesh nist"})


@app.route("/delete_section/", methods=["GET"])
def delete_section_mamad():
    if (
        datetime.datetime.now() > start_choose_delete
        and datetime.datetime.now() < end_choose_delete
    ):
        query_params = request.args
        student_id = query_params.get("stid")
        sec_id = query_params.get("secid")
        sem_id = query_params.get("semid")
        query = f"DELETE FROM section_student WHERE section_student.stid = {str(student_id)} AND section_student.sectid = {str(sec_id)} AND section_student.semstuid = {str(sem_id)}"
        cursor.execute(query)
        conn.commit()
        return jsonify({"message": "delete section succesfuly"})
    else:
        return jsonify({"message": "ridi hanooz vaghtesh nist"})


# Endpoint to update a specific student
@app.route("/students/", methods=["PUT"])
def update_student():
    print("hi")
    data = request.get_json()
    print(data)
    # Prepare the SQL query
    id = data["id"]
    for i in data:
        column = i
        value = data[i]
        if column == "id":
            continue
        query = f"UPDATE Person SET {column} = '{value}' WHERE id = {id}"

        cursor.execute(query)
        conn.commit()

    return jsonify({"message": "Student updated successfully"})


@app.route("/showsection/", methods=["GET"])
def show_section():
    query_params = request.args
    sid = query_params.get("sid")
    query = f""" SELECT class_no ,Course.name , Department.dname, Person.fname ,Person.lname FROM University.Section,Course, Instructor,Person , Department where Section.courseid = Course.id AND instructorid = Instructor.id AND Course.did = Department.did AND Instructor.id = Person.id AND Section.id  = {str(sid)} ;"""
    cursor.execute(query)
    result = cursor.fetchall()
    return jsonify(result)


@app.route("/showexam/", methods=["GET"])
def show_exam():
    query_params = request.args
    sid = query_params.get("sid")
    query = f""" SELECT final_date , Course.name FROM Section , Section_Student , Course WHERE Section_Student.stid = {str(sid)} AND Section_Student.sectid = Section.id AND Section.courseid = Course.id;"""
    cursor.execute(query)
    result = cursor.fetchall()
    return jsonify(result)


@app.route("/deletesection/", methods=["DELETE"])
def delete_section():
    query_params = request.args
    sid = query_params.get("sid")
    sectid = query_params.get("sectid")
    query = f""" DELETE FROM Section_Student WHERE Section_Student.stid = "{sid}" AND Section_Student.sectid = "{sectid}";"""
    cursor.execute(query)
    conn.commit()
    return jsonify({"message": "Section deleted successfully"})


if __name__ == "__main__":
    app.run()
