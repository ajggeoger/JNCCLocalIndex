# JNCCLocalIndex
Some notebook and dash-boarding tools for Sentinel time series statistics

## Background to tool choice

## Setting up the environment
#### Docker set up (Jupyter Lab)
Follow this process to provide an analysis environment:
* Clone git repository using: `git clone https://github.com/ajggeoger/JNCCLocalIndex`
* Move into the repository
* Assuming Docker is installed, run: `docker image build -t jncc_lit .`
  * This will take some time and create a ‘large’ docker image called `jncc_lit`. _Note:_ You can comment out tools in the environment.yml file to make a smaller image
* Use `docker images` to check it exists, and its size
* The .gitignore file has been updated to ignore *.json file and the four main file types associated with shapefiles. You will need to add usable data into the data/ directory though
* Create the Docker container using a command such as:
  * `docker container run -i -t --name nameofcontainer -v full/path/to/data:/opt/app/data -v full/path/to/notebooks:/opt/app/python -p 8180:8888 nameofimage` 
  * e.g. `docker container run -i -t --name jnccholoviz -v ~/Documents/projectfiles/JNCCLocalIndex/data:/opt/app/data -v ~/Documents/projectfiles/JNCCLocalIndex/notebooks:/opt/app/python -p 8180:8888 jncc_lit`
  * Make sure the path points to the data and notebook folders in the repository
* In a web browser window paste the link given when starting the container, and change port 8888 to 8180

#### Docker set up (Jupyter Notebooks)
Follow this process to provide an analysis environment using an updated Panel installation:
* Clone git repository using: `git clone https://github.com/ajggeoger/JNCCLocalIndex`
* Move into the repository
* Assuming Docker is installed, run: `docker image build -t panelupdate .`
* This will take some time and create a ‘large’ docker image called `panelupdate` . _Note:_ This DockerFile does not use an environment.yml file 
* Use `docker images` to check it exists, and its size
* The .gitignore file has been updated to ignore *.json file and the four main file types associated with shapefiles. You will need to add usable data into the data/ directory though
* Create the Docker container using a command such as:
  * `docker container run -i -t --name nameofcontainer -v full/path/to/data:/opt/app/data -v full/path/to/notebooks:/opt/app/python -p 8180:8888 nameofimage` 
  * e.g. `docker container run -i -t --name jnccholoviznew -v ~/Documents/projectfiles/JNCCLocalIndex/data:/opt/app/data -v ~/Documents/projectfiles/JNCCLocalIndex/notebooks:/opt/app/python -p 8180:8888 panelupdate`
  * Make sure the path points to the data and notebook folders in the repository
* In a web browser window paste the link given when starting the container, and change port 8888 to 8180
* You will then need to open /opt/app/python to see your notebooks

## Running the notebooks
Development is currently underway using the Docker set up that uses Jupyter Notebooks rather than JupyterLab. 

## Resources