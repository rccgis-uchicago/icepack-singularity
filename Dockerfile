FROM firedrakeproject/firedrake-env:latest

USER firedrake
WORKDIR /opt/firedrake

ENV PETSC_ARCH default

# Copy the firedrake-install script into the Docker image
COPY firedrake-install /opt/firedrake/firedrake-install

# Ensure the script is executable
#RUN chmod +x /opt/firedrake/firedrake-install

# Now install Firedrake.
RUN bash -c "python3 /opt/firedrake/firedrake-install \
    --no-package-manager \
    --disable-ssh \
    --torch \
    --honour-petsc-dir \
    --mpicc=/opt/firedrake/petsc/packages/bin/mpicc \
    --mpicxx=/opt/firedrake/petsc/packages/bin/mpicxx \
    --mpif90=/opt/firedrake/petsc/packages/bin/mpif90 \
    --mpiexec=/opt/firedrake/petsc/packages/bin/mpiexec"

# Install Icepack packages
WORKDIR /opt
RUN pip install git+https://github.com/icepack/Trilinos.git
RUN pip install git+https://github.com/icepack/pyrol.git
RUN git clone https://github.com/icepack/icepack.git
RUN pip install ./icepack