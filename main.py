# import firestore
import firebase_admin
from firebase_admin import credentials, firestore
from flask import escape, Flask, request, jsonify
import json
import pytz
from google.cloud.firestore_v1 import SERVER_TIMESTAMP
import datetime
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

cred = credentials.Certificate("final-project-a1903-firebase-adminsdk-95hrt-46454d23fd.json")
firebase_admin.initialize_app(cred)

db = firestore.client()

students = db.collection('Students')
Posts = db.collection('Posts')


# @functions_framework.http
# def socialApp(request):
#     if request.method == 'POST':
#         if request.path =="/students":
#             return create_profile()
#         elif request.path == "/elections":
#             return create_election()

#     elif request.method == 'DELETE':
#         if request.path =="/students":
#             return delete_record()
#         elif request.path == "/elections":
#             return delete_election()

#     elif request.method == 'GET':
#         if request.path =="/students":
#             return view_profile()
#         elif request.path == "/Posts":
#             return make_post()

#     elif request.method == 'PUT' and request.path == "/students":
#         return update_profile()

#     elif request.method == 'PATCH' and request.path == "/elections":
#         return election_voting()


    # if request.method == 'POST':
    #     if request.path =="/students":
    #         return create_record()
    # if request.method == 'POST':
    #     if request.path =="/students":
    #         return create_record()
    # if request.method == 'POST':
    #     if request.path =="/students":
    #         return create_record()



# Sign up/ Registration

@app.route('/students', methods=['POST'])
def create_profile():
    Profile = json.loads(request.data)

    student = students.document(Profile['Email']).get()

    if student.exists:
        return jsonify({"error": "Student already exists"})

    else:
        students.document(Profile['Email']).set(Profile)
        return jsonify(Profile)


# Deregistering A Student

@app.route('/students', methods=['DELETE'])
def delete_record():
    record = request.args.get('ID')

    if not record:
        return jsonify("Invalid request")

    student = students.document(record)

    if student.get().exists:
        student.delete()
        return jsonify(' '), 204
    else:
        return jsonify({"error": "data not found"}), 404


# #Updating Voter's details
@app.route('/students', methods=['PATCH'])
def update_profile():
    Profile = json.loads(request.data)

    student = students.document(Profile['Email'])

    if student.get().exists:
        if 'DOB' in Profile:
            student.update(
                {'DOB': Profile['DOB']}
            )

        if 'Yeargroup' in Profile:
            student.update(
                {'Yeargroup': Profile['Yeargroup']}
            )

        if 'Major' in Profile:
            student.update(
                {'Major': Profile['Major']}
            )

        if 'Residence' in Profile:
            student.update(
                {'Residence': Profile['Residence']}
            )

        if 'favorite_food' in Profile:
            student.update(
                {'favorite_food': Profile['favorite_food']}
            )

        if 'favorite_movie' in Profile:
            student.update(
                {'favorite_movie': Profile['favorite_movie']}
            )
        
    else:
        return jsonify({"error": "data not found"}), 404
    return jsonify(Profile), 200

# #Retrieving 

@app.route('/students', methods=['GET'])
def view_profile():
    Email = request.args.get('Email')

    student = students.document(Email)

    if student.get().exists:
        return jsonify(student.get().to_dict())

    else:
        return jsonify("student not found"), 404


@app.route('/posts', methods=['POST'])
def make_post():
    record = json.loads(request.data)


    if "Email" not in record:
         return jsonify("Invalid request")

    user = students.document(record['Email']).get()

    
    current_time = datetime.datetime.now(tz=pytz.utc)

    date_string = current_time.strftime('%Y-%m-%d %H:%M:%S')

    variable = Posts.document(date_string)

    variable.set(record)
    return jsonify(record)




# @app.route('/vote', methods=['PUT'])
def election_voting():
    record = json.loads(request.data)

    election_ref = db.collection('Elections').document(record['electionID'])

    if not election_ref.get().exists:
        return jsonify({"error":"Invalid ID"})

    if record['candidateID'] not in election_ref.get().to_dict().get('votes_casted'):
        votes_casted = election_ref.get().to_dict().get('votes_casted')
        votes_casted[record['candidateID']] = 1
        election_ref.update({"votes_casted": votes_casted})
        return jsonify("Success"), 200

    if record['candidateID'] in election_ref.get().to_dict().get('votes_casted'):
        votes_casted = election_ref.get().to_dict().get('votes_casted')
        votes_casted[record['candidateID']] += 1
        election_ref.update({"votes_casted": votes_casted})
        return jsonify("Success"), 200

    return jsonify("error")



@app.route("/login", methods=["POST"])
def login_profile():
    credentials =json.loads(request.data)

    profile = db.collection('Students').document(credentials['Email']).get()

    if profile.exists:
        firstname = profile.to_dict().get('Firstname')
        lastname = profile.to_dict().get('Lastname')
        major = profile.to_dict().get('Major')
        year = profile.to_dict().get('Yeargroup')
        email = profile.to_dict().get('Email')
        birth = profile.to_dict().get('DOB')
        food = profile.to_dict().get('Favorite_food')
        movie = profile.to_dict().get('Favorite_movie')
        residence = profile.to_dict().get('Residence')
        ID = profile.to_dict().get('StudentID')


        if profile.to_dict()['Password'] == credentials['Password']:
            return jsonify({
                'Success': True,
                "Message": "Logged In",
                "Firstname": firstname,
                "Lastname": lastname,
                "Major": major,
                "Email": email,
                "DOB": birth, 
                "Yeargroup": year,
                "Favorite_food": food,
                "Favorite_movie": movie,
                "Residence" : residence,
                "StudentID": ID 
            }), 200

        else:
            return jsonify({'Success': False, "Error": 'Incorrect Email or Password'}), 404

    else:
        return jsonify({'Success': False, "Error ": 'User not found'}), 404





# app.run(debug=True)



