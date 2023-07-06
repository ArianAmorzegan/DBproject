import mysql.connector

mydb = mysql.connector.connect(
  host="127.0.0.1",
  user="root",
  password="@Amir4225202",
  database="projects"
)

mycursor = mydb.cursor()


# query = """
# SELECT id, final_date
# FROM Section
# WHERE final_date IS NOT NULL
# """
# try:
#     mycursor.execute(query)

#     # Fetch all rows 
#     exam_schedule = mycursor.fetchall()

#     # Print the exam schedule
#     for section in exam_schedule:
#         section_id, final_date = section
#         print(f"Section ID: {section_id}, Final Date: {final_date}")

# except mysql.connector.Error as err:
#     print(f"Error retrieving exam schedule: {err}")


# -------------------------------------------------------------------------

# query = """
# SELECT id, date, status
# FROM Attendance
# """

# # Execute the query
# mycursor.execute(query)

# # Fetch all rows from the result set
# rows = mycursor.fetchall()

# # Display the presence and absences
# for row in rows:
#     id = row[0]
#     date = row[1]
#     status = row[2]

#     if status == 1:
#         print(f"Presence - ID: {id}, Date: {date}")
#     else:
#         print(f"Absence - ID: {id}, Date: {date}")

# ---------------------------------------------------------------------


def evaluate_professor(id, score, sectstuid):
    # Insert a new evaluation into the evaluations table
    sql_insert = "INSERT INTO Evaluation (id, score, sectstuid) VALUES (%s, %s, %s)"
    mycursor.execute(sql_insert, (id, score, sectstuid))

    mydb.commit()
    print("Evaluation submitted successfully.")

id = 31311214
score = 22
sectstuid = 7
evaluate_professor(id, score, sectstuid)


query1 = """
SELECT id, score , sectstuid
FROM Evaluation
"""


mycursor.execute(query1)


rows = mycursor.fetchall()

for row in rows:
    id = row[0]
    score = row[1]
    sectstuid = row[2]
    print(f"ID: {id}, Score: {score}, Sectstuid: {sectstuid}")





mycursor.close()
mydb.close()