import sys
e0="166.230.161.230" #Rutgers
e1="128.163.232.65" #Kentucky
e2="128.206.119.40" #Missouri
e3="198.248.248.133" #Kansas
e4="204.102.244.68" #Cenic

with open("oldEdge.txt") as old:
	oldEdge = int(old.readline())

with open("report.txt") as tickopen:
        tick = int(tickopen.readline())

def decision():
	first = abs(-5 + (tick/2))
	second = abs(-25 + (tick/2))
	third = abs(-45 + (tick/2))
	fourth = abs(-50 + (tick/2))
	fifth = abs(-90 + (tick/2))
	L = [first, second, third, fourth, fifth]
	minIndex = min(range(len(L)), key=L.__getitem__)
	return(minIndex)

def findEdgeIP(newEdge):
	if(newEdge == 0):
		newIP = e0
	elif(newEdge == 1):
		newIP = e1
	elif(newEdge == 2):
		newIP = e2
	elif(newEdge == 3):
		newIP = e3
	elif(newEdge == 4):
		newIP = e4
	return newIP
newEdge = decision()

if(oldEdge == newEdge):
	newIP = "none";
	migration = False
else:
	migration = True
	newIP = findEdgeIP(newEdge)
	with open("oldEdge.txt","w") as old:
		old.write(str(newEdge))
sys.exit(newIP)
