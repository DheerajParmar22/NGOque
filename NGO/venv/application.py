import os
from flask import Flask, render_template, request, url_for, redirect, jsonify
import json
import uuid
import datetime
from flask_mysqldb import MySQL
from werkzeug.utils import secure_filename
from flask_cors import CORS
from datetime import datetime
app = Flask(__name__)
CORS(app)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'    
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'NGO'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

mysql = MySQL(app)

@app.route('/login', methods=['POST'])
def Login():
    if request.method == 'POST':
        print('1st Inside')
        result = request.data
        userdetails  = json.loads(result)
        Name = userdetails['loginemail']
        Password = userdetails['loginpassword']
        print(Name, Password)
        cur = mysql.connection.cursor()
        cur.execute("select * from tbl_Registration where Email='"+Name+"'and Password='"+Password+"' ")
        r = cur.fetchall()
        count = cur.rowcount
        if count == 1:
            print(r)
            return jsonify(r)
            mysql.connection.commit()
            cur.close()
        else:   
            return jsonify('Username or password wrong')

@app.route('/regsiter', methods=['POST'])
def Register():
    if request.method == 'POST':
        print('2st Inside')
        result = request.data
        userdetails  = json.loads(result)
        FirstName = userdetails['txtfirstname']
        LastName = userdetails['txtlastname']
        Email = userdetails['txtemail']
        Phone = userdetails['txtphoneno']
        Address = userdetails['txtaddress']
        Password = userdetails['txtpassword']
        Created_On = datetime.now()
        print(Created_On)
        cur = mysql.connection.cursor()
        cur.execute('''Insert into tbl_Registration values(NULL,%s,%s,%s,%s,%s,%s,%s)''',(FirstName,LastName,Email,Phone,Address,Password,'Customer'))
        mysql.connection.commit()
        cur.close()
        return jsonify('Registration Succesfull')

@app.route('/fetchDataOfUser/<myemail>', methods=['GET'])
def FetchUserDetails(myemail):
    if request.method == 'GET':
        print('4st Inside')
        Email = myemail
        print(Email)
        cur = mysql.connection.cursor()
        cur.execute("select * from tbl_Registration where Email='"+Email+"' ")
        r = cur.fetchall()
        count = cur.rowcount
        if count == 1:
            print(r)
            return jsonify(r)
            mysql.connection.commit()
            cur.close()
        else:
            return jsonify('wrong email')

@app.route('/FetchCustomer', methods=['GET'])
def FetchCustomers():
    if request.method == 'GET':
        cur = mysql.connection.cursor()
        cur.execute("select * from tbl_Registration")
        r = cur.fetchall()
        mysql.connection.commit()
        cur.close()
        return jsonify(r)

@app.route('/FetchDonationOfUser/<User_Id>', methods=['GET'])
def FetchDonationOfUser(User_Id):
    if request.method == 'GET':
        cur = mysql.connection.cursor()
        cur.execute("select * from tbl_donation where User_ID='"+User_Id+"' ")
        r = cur.fetchall()
        mysql.connection.commit()
        cur.close()
        return jsonify(r)


@app.route('/FetchDonation', methods=['GET'])
def FetchDonation():
    if request.method == 'GET':
        cur = mysql.connection.cursor()
        cur.execute("select * from tbl_donation")
        r = cur.fetchall()
        mysql.connection.commit()
        cur.close()
        return jsonify(r)


@app.route('/Donation/<User_ID>', methods = ['POST'])
def Donation(User_ID):
    if request.method == 'POST':
        mydata = request.data
        DonationDetails  = json.loads(mydata)
        print("Results: ",DonationDetails,User_ID)
        FirstName = DonationDetails['FirstName']
        LastName = DonationDetails['LastName']
        DonationCategory = DonationDetails['DonationCategory']
        Addresss1 = DonationDetails['Addresss1']
        Address2 = DonationDetails['Address2']
        City = DonationDetails['City']
        State = DonationDetails['State']
        ZipCode = DonationDetails['ZipCode']
        Country = DonationDetails['Country']
        Amount = DonationDetails['Amount']
        Frequency = DonationDetails['Frequency']
        cur = mysql.connection.cursor()
        cur.execute('''Insert into tbl_donation values(NULL,%s,%s,%s,%s,%s,%s,%s,%s,%s,NULL,%s,%s)''',(FirstName,LastName,Address2,User_ID,City,State,ZipCode,Country,DonationCategory,Amount,Frequency))
        mysql.connection.commit()
        cur.close()
        return jsonify('Donation Successfull')

@app.route('/')
def home():
    if request.method == 'GET':
        return ('Welcome to NGO Application')

if __name__ == '__main__':
    app.run(debug=True)