
	count = 5
	Dim myarray(100)
	Dim newarray(100)
	usercount=0
	finish = 0
	
fn = InputBox("Enter text file to open:","Open text file")
set fh = CreateObject("Scripting.FileSystemObject")
set thefile = fh.OpenTextFile(fn,1,true)
Do until thefile.AtEndOfStream
	line=thefile.Readline
	myarray(tee)=line
	tee = tee+1
Loop
thefile.close
set thefile = fh.OpenTextFile(fn,2,true)


Do Until count>10
	choosie=InputBox("ENTER OPTION:" & vbcrlf &"       1:Insert new to-do item" &vbcrlf& "       2:Modify current to-do item" & vbcrlf &"       3:Remove current to-do item"& vbcrlf &"       4:Generate list of to-do items" & vbcrlf &"       5:Quit")
	If choosie="5" Then 
	c=InputBox("Save contents? (y/n)","Close text file")	
	count= 100
	End If
	If c="y" Then
		MsgBox("works")
		For i=0 to tee-1
			thefile.WriteLine(myarray(i))
	Next
	End If
	If choosie="1" Then
		insert()
	End If
	If choosie="2" Then
		modify()
	End If
	If choosie="3" Then
		remove()
	End If
	If choosie="4" Then
		generate()
	End If
Loop

Function insert()
insert= InputBox("Enter new to-do item:")
num= InputBox("Enter priorty for to-do item:")
		if myarray(num) = Empty Then
		myarray(num-1)=insert
		Else
		x=MsgBox("There is already an item inserted")
		End If

End Function

Function modify()
x=InputBox("Enter modified item priorty", "Modify Item")
if myarray(x-1) = Empty Then
	x=MsgBox("No to-do was for this number ")
Else	
	change=InputBox("Modify string here:")
	myarray(x-1)=change
End If
End Function

Function remove()
x=InputBox("Enter priority you want to remove:")
x=x-1
If myarray(x) = Empty Then
	t=MsgBox("priority is empty;")
Else
r=InputBox("Are you sure you want to remove?(y/n)" & vbcrlf & myarray(x))
      If r="y" Then
			myarray(x) = myarray(x+1)
			myarray(i+1)= ""
	End If
End If
End Function

Function generate()
	nums=1
	r=0
	Dim x
	s=""
	For r=0 to 100
	If NOT myarray(r) = Empty Then
	q = q + 1
	End If
	Next
	

	For i=0 to q-1
		s = s & nums & ") " & myarray(i) & chr(13)
		nums = nums+1
	Next
	x = MsgBox(s, 0, "To-do List")
End Function



                                                                                                                             




