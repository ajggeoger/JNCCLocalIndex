# Set our base image
FROM continuumio/miniconda

# Set the working directory to the current directory
WORKDIR .
COPY environment.yml ./notebooks

# Install geo & datasci packages
RUN conda env create -f environment.yml  

# start the virtual environment
RUN echo "source activate geogerenv" > ~/.bashrc
ENV PATH /opt/conda/envs/geogerenv/bin:$PATH 

# Jupyter listens port: 8888
EXPOSE 8888
# RUN mkdir -p /opt/app/data
RUN mkdir -p /opt/app/python

# Run Jupyter notebook as Docker main process
CMD jupyter lab --ip='0.0.0.0' --port=8888 --no-browser --notebook-dir=/opt/app/python --allow-root