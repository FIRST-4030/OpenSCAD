# OpenSCAD
This is a folder of OpenSCAD files used to simulate our various autonomous goals for FTC team 7462.

OpenSCAD is a text based CAD (Computer Aided Design) application that we will be using to prototype our efforts at autonomous programming. Once a field is defined then pseudo-robots can be added to show discreet locations that we want the robot to be placed in order to identify coordinates that can be directly fed into ‘’RoadRunner’’.  A sample simulation can be found in the **2019 – Skystone** folder in a file called *Simulator.png* and is pictured below:

 ![](https://github.com/FIRST-4030/OpenSCAD/blob/main/2019%20-%20Skystone/Simulator.png).

# Directory Structure

The ‘’OpenSCAD’’ folder is the parent folder for all seasonal competitions. Beneath it are individual folders for each year’s competition. Additionally, there is a folder called **Global** which holds all of the SCAD files used to build a generic field.

Within each competition folder will exist, at a minimum, the following 2 files:
* xxxField.scad – The SCAD code used to lay out the entire field
* xxxField.png – Screen capture, in a *png* format, of the final field

	**Note**: where, “xxx” is the name of the competition (e.g., “Skystone”, “FreightFrenzy”, etc.)

# Accessing the Code

All of the SCAD files we use are managed in this Github repository. 

Git is the configuration management software used to ensure that all files are protected as they change over time. OpenSCAD is **not** compatible with Android Studio so specific instructions on using Git must be followed. An extensive description on how Git can be used within our team can be found on our Google Drive at [How To use Git]( https://drive.google.com/file/d/1Ci7hOdEGSX_p0ja9RH9DupoqMC6KAjk8/view?usp=share_link).
