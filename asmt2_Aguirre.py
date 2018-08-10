#!/usr/bin/python

#Name: Joshua Aguirre
#Date 9/27/2015
#Project 2
#CIT270

from functs_Aguirre import insert
from functs_Aguirre import genearte
from functs_Aguirre import remove
from functs_Aguirre import modify

count = 0
mylistuser=[]
mylistpassword=[]
mylistusernames=[]


import sys

try:
	file= input("Enter file to open: ")
	with open (file) as f:
		hello = f.read().splitlines()
	countone, counttwo = zip(*(s.split(":") for s in hello))
	for i in hello:
		mylistuser.append(i)
	for r in countone:
		mylistusernames.append(r) 
	for s in counttwo:
		mylistpassword.append(s) 
	print("work")
	f.close()
except:
	print("File could not open!")
	pass

	
	
	
	

#with open (file) as f:
#	hello = f.read().splitlines()
#countone, counttwo = zip(*(s.split(":") for s in hello))
#for i in hello:
#	mylistuser.append(i)
#for r in countone:
#	mylistusernames.append(r) 
#for s in counttwo:
#	mylistpassword.append(s) 	

while count < 5:
	print("User accounts")
	print("-------------")
	print("i = Insert new user account")
	print("m = Modify existing user account")
	print("r = Remove existing user account")
	print("g = Generate list of account")
	print("q = Quit\n\n\n")
	variable = input("Enter an letter to preform an operation:")
	print (variable)
	if variable == "i":
		usernames, password, users=insert(mylistusernames)
		if password != 0:
			mylistuser.append(users)
			mylistusernames.append(usernames)
			mylistpassword.append(password)
	if variable == 'g':
		genearte(mylistuser)
	if variable == 'r':
		remove(mylistusernames, mylistuser ,mylistpassword)
	if variable == 'q':
		yes = input("Save contents? (y/n):")
		if yes == 'y':
			f = open('output.txt', 'w')
			for item in mylistuser:
				f.write("%s\n" % item)
		exit()
	if variable == 'm':
		password, users, count =modify(mylistusernames, mylistpassword, mylistuser)
		if users != 0:
			mylistuser[count]=users
			mylistpassword[count]=password

	
	
	

	
