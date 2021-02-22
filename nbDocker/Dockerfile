# Set our base image
FROM continuumio/miniconda3

# Set the working directory to the current directory
WORKDIR .
# COPY notebooks/environment.yml .

# Install geo & datasci packages
# RUN conda env create -f environment.yml  
RUN conda create -n geogerenv -c conda-forge geoviews-core geopandas hvplot psutil

# Install hvplot requirements
# RUN jupyter labextension install @pyviz/jupyterlab_pyviz

# start the virtual environment
RUN echo "source activate geogerenv" > ~/.bashrc
ENV PATH /opt/conda/envs/geogerenv/bin:$PATH 

# Jupyter listens on port: 8888
EXPOSE 8888

# Create location for Docker volumes
RUN mkdir -p /opt/app/data
RUN mkdir -p /opt/app/python

# Run Jupyter notebook as Docker main process
# CMD jupyter lab --ip='0.0.0.0' --port=8888 --no-browser --notebook-dir=/opt/app/python --allow-root

# Add Tini. Tini operates as a process subreaper for jupyter. This prevents kernel crashes.
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]