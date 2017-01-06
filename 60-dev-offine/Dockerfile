FROM v4tech/dev-python-pandas:latest
MAINTAINER Stewart V. Wright <stewart@vifortech.com>

# Massive overkill - installing a full Anaconda (python 2.7) and R (MRAN)
# Useful for offline dev when you don't know what you want to work on...

# Install full Anaconda
ENV ANACONDA_URL="https://repo.continuum.io/archive"
ENV ANACONDA_INSTALLER="Anaconda2-4.2.0-Linux-x86_64.sh"
# Hash is from  https://docs.continuum.io/anaconda/hashes/all
ENV ANACONDA_SHA265="beee286d24fb37dd6555281bba39b3deb5804baec509a9dc5c69185098cf661a"

RUN rm -rf /opt/conda  \
    && wget --quiet ${ANACONDA_URL}/${ANACONDA_INSTALLER}  \
    && sha256sum /${ANACONDA_INSTALLER} | grep -q "${ANACONDA_SHA256}"  \
    && /bin/bash /${ANACONDA_INSTALLER} -b -p /opt/conda  \
    && rm ${ANACONDA_INSTALLER}  \
    && /opt/conda/bin/conda upgrade --yes --all  \
    && /opt/conda/bin/conda install --yes  \
        anaconda-client  \
        boost  \
        boto3  \
        botocore  \
        conda-build  \
        coverage  \
        cvxcanon  \
        cvxopt  \
        feedparser  \
        flake8  \
        future  \
        gdata  \
        googlecl  \
        icalendar  \
        ipykernel  \
        ipython  \
        ipywidgets  \
        matplotlib  \
        notebook  \
        numpy  \
        pandas  \
        pep8  \
        pyflakes  \
        pymc  \
        quandl  \
        scipy  \
        spacy  \
    && /opt/conda/bin/conda clean --yes --tarballs --packages --source-cache  \
    && find /opt/conda  \
            \( -type d -a -name test -o -name tests \)  \
            -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \)  \
            -exec rm -rf '{}' +


ENV MRAN_VERSION="3.3.2"
# Hash is from  https://mran.revolutionanalytics.com/download/
ENV MRAN_SHA265="817aca692adffe20e590fc5218cb6992f24f29aa31864465569057534bce42c7"

# MRAN installs to $REVOMATH=/microsoft-r-open

RUN conda config --append channels mro  \
    && conda config --append channels r  \
    && conda install  \
        r  \
        r-essentials  \
        r-xts  \
        r-shiny  \
        r-readxl  \
    && wget --quiet https://mran.revolutionanalytics.com/install/mro/${MRAN_VERSION}/microsoft-r-open-${MRAN_VERSION}.tar.gz  \
    && sha256sum /microsoft-r-open-${MRAN_VERSION}.tar.gz | grep -q "${MRAN_SHA256}"  \
    && cd /  \
    && tar -xf /microsoft-r-open-${MRAN_VERSION}.tar.gz  \
    && cp /opt/conda/lib/R/lib/libRblas.so /opt/conda/lib/R/lib/libRblas.so-BACKUP  \
    && cp /opt/conda/lib/R/lib/libRlapack.so /opt/conda/lib/R/lib/libRlapack.so-BACKUP  \
    && cp -f /microsoft-r-open/mkl/libs/*.so to /opt/conda/lib/R/lib  \
    && { echo 'Sys.setenv("MKL_INTERFACE_LAYER"="GNU,LP64")\nSys.setenv("MKL_THREADING_LAYER"="GNU")';  \
         /opt/conda/lib/R/etc/Rprofile.site; } >/opt/conda/lib/R/etc/Rprofile.site  \
    && mv /opt/conda/lib/R/etc/Rprofile.site{.new,}  \
    && /opt/conda/bin/R CMD INSTALL $REVOMATH/RevoUtilsMath.tar.gz
