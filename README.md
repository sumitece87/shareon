# shareon
Traffic-Aware Dynamic Container Migration for Real-Time Support in Mobile Edge Clouds

This repo is based on the following paper:
https://www.researchgate.net/publication/328096627_Traffic-Aware_Dynamic_Container_Migration_for_Real-Time_Support_in_Mobile_Edge_Clouds


1	Introduction
In these experiments, we run a mobility emulation for a user using a real-time license plate recognition application using GENI nodes. There are total six nodes as follows: 

a.	One SDN node at: Northwestern (Chicago)

b.	Five edge nodes at: Rutgers, Kentucky, Missouri, Kansas and CENIC

2	Files, Scripts and Experiment Set-up

2.1	Directory Structure

This subsection describes the directory structure of the images placed at the container namely ‘edgecontainer’, host namely ‘edge’ and at the controller SDN node.

2.1.1	SDN

a.	runapp.sh: This file runs the application at the first edge node.

b.	sdnpull.sh: Pulls the report.txt file from edge nodes, calls decision method and start migration if required.

c.	decision.py: Decides on the right edge node for the migration which fulfils QoS requirements.

d.	config.sh: Configures the IP, port and brings up the interfaces

e.	setp.sh: Internally called by config.sh where we assign names to the edge nodes.

f.	loadServer.py: It increases or decreases the edge node’s load linearly 

g.	report.txt: Pulled by sdnpull.sh which carries the time tick information when the QoS was not fulfilled by the edge.

h.	oldEdge.txt: Currently running edge node’s information is written in this file

i.	newIP.txt: Contains information about the new edge to be connected to. This file is generated by decision.py.

j.	time.txt: File pulled by sdnpull.sh which is a replica of file generated by edge and carries information about application’s output 
and processing time.

k.	result*.py: These files pull results from different edge nodes, process them to extract the delay information and save it in result*.txt file.

l.	result*.txt: Processed output for plotting.

2.1.2	Edge

a.	sdnreporting.py: This is a local decision file which writes to a local report.txt file if the QoS goes below threshold.

b.	time.txt: same as described above.

2.1.3	edgecontainer

a.	runalpr.sh: This script continuously runs the application with input being image and output the detected number plate.

b.	loadserver1.txt: File created by loadServer.py obtained from the /proc/loadavg file of the container. This carries information about 
the read load after running sqrt() function.

c.	images (dir): Contains the frames extracted from vid.mp4 video.

2.1.4	Other Files

a.	Rspec.xml: This is to create and bring up topology in GENI.

b.	vid.mp4: Sample video for the application.

c.	processLoad.sh: loadServer.txt can be processed to extract load values as a vector to be processed by Matlab.

d.	vid2img.m: Extracts frames from vid.mp4 video.

e.	rsize.sh: This uses imagemagick codec to process images placed into the folder to reduce the size and save processing time while 
running the experiment. 

f.	result.m: Plots the results obtained by running the experiment using result*.txt files.

g.	NodeImage: Image created after installing software and dependencies is saved at: https://www.lan.sdn.uky.edu/image_metadata.php?uuid=8d23cffd-fcaf-11e7-9a1c-000000000000 

2.2	Assumptions
We consider following assumptions while building and running the experiment:

a.	SDN has privileges to access the files at all the edge nodes.

b.	All the edge nodes have LXD, Python and other dependencies pre-installed.

c.	All the users, nodes and services are pre-authenticated by the SDN.

2.3	Setting-up the Experiment:

2.3.1	System Set-up

a.	Upload the Rspec.xml file to GENI resource manager

b.	Load ‘NodeImage’ at all the nodes (URL provided above)

c.	Run config.sh to set up IP and bring up the interfaces

2.3.2	Running the Experiment

a.	Run runApp.sh from SDN using: ./runApp.sh

b.	Run sdnreporting.py from the first edge using: python3 sdnreporting.py. This will be later taken care by sdnpull.sh.

c.	Run sdnpull.sh from SDN using: ./sdnpull.sh

d.	Repeat (a-c) after running loadServer.sh using: ./loadServer.sh

2.3.3	Collecting the Data:

a.	Run result*.py from SDN using: python3 result1.py and so on.

b.	Run result.m using MATLAB offline after pulling result.txt file from SDN.

2.3.4	Analyzing the Plot:

a.	Finally, a spike in the delay can be seen which will drop once the threshold is reached and the migration happens. 

b.	Migration can be ascertained by looking at the different result*.txt files where the delay values decrease after migration as expected. 

c.	Also, the time of result*.txt file creation at different edge nodes also provides us insight about the when the migration would have happened. 

d.	For a loaded server, rise in processing time will be observed which will drop after migration.

e.	Finally, all the data and steps be observed on the Linux shell while running the experiments as everything is logged.
