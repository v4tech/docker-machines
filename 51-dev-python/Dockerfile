FROM v4tech/dev:latest
MAINTAINER Stewart V. Wright <stewart@vifortech.com>

# Install the latest version of 64-bit Linux Miniconda
ENV PATH=/opt/conda/bin:$PATH
ENV CONDA_INSTALLER="Miniconda2-latest-Linux-x86_64.sh"

# all runtime requirements
RUN apt-get update && apt-get install -y --no-install-recommends \
    bzip2 \
    libglib2.0-0 \
    libxext6 \
    libsm6 \
    libxrender1 \
    wget \
    ca-certificates && \
    wget --quiet https://repo.continuum.io/miniconda/${CONDA_INSTALLER} && \
    /bin/bash /${CONDA_INSTALLER} -b -p /opt/conda && \
    rm ${CONDA_INSTALLER} && \
    /opt/conda/bin/conda install --yes conda && \
    conda install conda-build && \
    conda clean --yes --tarballs --packages --source-cache && \
    find /opt/conda \
      \( -type d -a -name test -o -name tests \) \
      -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
      -exec rm -rf '{}' +
