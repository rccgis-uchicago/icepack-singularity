FROM pnsinha/firedrake-vanilla:latest
WORKDIR /opt/firedrake

RUN apt  -y update && sudo apt -y install patchelf
RUN . firedrake/bin/activate && \
    pip install git+https://github.com/icepack/Trilinos.git && \
    pip install git+https://github.com/icepack/pyrol.git && \
    git clone https://github.com/icepack/icepack.git && \
    pip install --editable /opt/firedrake/icepack && \
    pip cache purge
