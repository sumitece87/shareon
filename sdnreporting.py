import time
#This opens the report sent by SDN
with open("report.txt") as tickopen:
	tick = int(tickopen.read(1))

tshift = -25 + (tick/2);
networktime = abs(tshift)
f  = open("time.txt", "r") 
substring1 = "Total Time to process image: "
substring2 = "ms."
substring3 = "Processing Time = "

for line in f:
	time.sleep(0.3)
	if substring1 in line:
		pitime = line[(line.index(substring1)+len(substring1)):line.index(substring2)] #This is processing time for image
		line = next(f)
		try:
			pptime = line[(line.index(substring3)+len(substring3)):line.index(substring2)] #This is processing time for number plate
			totaltime = float(pitime)+float(pptime)+networktime
			print("Total time =", totaltime)
			tick = tick + 1
		except:
			continue
		if(tick % 2):
			tshift = tshift + 1
			networktime = abs(tshift)
		if(totaltime > 100):
			f1  = open("report.txt", "w")
			f1.write(str(tick))
			f1.close()




