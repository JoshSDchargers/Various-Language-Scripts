import re

def insert(mylistusernames):
	print()
	usernames =input("Enter Username:")
	usernames =re.sub(r'\W+','',usernames)
	for i in mylistusernames:
		if i == usernames:
			print ("user exist already!")
			return 0, 0, 0
	password =input("Enter Password:")
	password = password.replace('\'', '')
	user = usernames + ":" + password
	return usernames, password, user
		
	
def genearte(mylistuser):
	print("List of User")
	print("---------------")
	for i in mylistuser:
		print (i)
	print ("\n\n\n")
	
def remove(mylistusernames, mylistuser, mylistpassword):
	print("\n\n")
	count = -1
	removing = input("Enter username to remove:")
	for i in mylistusernames:
		count = count + 1
		if i == removing:
			del mylistuser[count]
			del mylistusernames[count]
			del mylistpassword[count]
			print ("\nUser removed " + removing)
			print("\n\n\n")
			count = 50
			return mylistusernames, mylistuser, mylistpassword

	if count != 50:
		print ("User does not exist!\n\n\n")
		return mylistusernames, mylistuser, mylistpassword

	
def modify(mylistusernames, mylistpassword, mylistuser):
	modify =input("Enter username to modify:")
	here = 10
	usercount = 10
	count = -1
	for i in mylistusernames:
		count = count + 1
		if i == modify:
			here = 100
			passwordch =input("Enter Current password:")
			for s in mylistpassword:
				if passwordch == s:
						usercount = 100
						newpassword =input("Enter New password:")
						newpassword = newpassword.replace('\'', '')
						mylistpassword[count]=newpassword
						mylistuser= mylistusernames[count] + ":" + newpassword
						return mylistpassword, mylistuser, count
	if here == 10:
		print("user does not exist!")
		return 0, 0, 0
	if usercount == 10:
		print ("Password is incorrect!")
		return 0,0,0