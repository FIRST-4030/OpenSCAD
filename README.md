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

# Git

Git is the configuration management software used to ensure that all files are protected as they change over time. OpenSCAD is **not** compatible with Android Studio so specific instructions on using Git at the command line will be detailed in subsequent sections.

Some of the basic operations within Git are,
| Command | Description |
| --- | --- |
| `git clone`   | Get a copy of the global repository and store it on your local PC |
| `git add`     | Move all changed and new (i.e., untracked) files into a local branch |
| `git diff`     | Show the differences between the local file and the last one committed |
| `git status`  | Display all of the files that have been changed since your last commit |

Examples of their use will be shown in later sections.

## Secure Token

Before you can make changes to files in the repository you must first clone it. Before you clone it you must first generate a secure token which will act as your password when moving files into and out of the repository. The following steps outline out to generate a token specific to your username,
1. Select the icon for your username found in the upper right-hand corner of the GitHub window
2. Select *Settings* in the displayed dropdown menu
3. Select *<> Developer Settings* found at the bottom of the left-hand list of options
4. Select *Tokens (classic)* found underneath the *Personal access tokens* option
5. Select *Generate new token (classic)* that is made available when you select the *Generate new token* button
6. The above command forces you to login again to the GitHub repository
7. Add some text to the *Note* field that describes the key you are about to generate
8. Enter a custom date of expiration that will allow you to keep the token for the entire school year
9. Add a check mark to the topmost entries in each of the sections related to *scope*
10. Select the *Generate token* button at the bottom of the window
11. Copy the newly generated token into a file that can be easily accessed later

## Cloning

## Using Branches

### Global

### Local

##
