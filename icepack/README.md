 Creating a Singularity Container for Icepack

This README provides instructions on how to create a Singularity container for Icepack using the provided Dockerfiles and Singularity definition file.

## Prerequisites

- Singularity installed on your system
- Docker installed on your system (for building intermediate Docker images)

## Steps

1. Build the Firedrake environment Docker image:
cd projects/container/icelake/firedrake-env docker build -t pnsinha/firedrake-env:latest .


2. Build the Firedrake vanilla Docker image:
cd ../firedrake-vanilla docker build -t pnsinha/firedrake-vanilla:latest .


3. Build the Icepack Docker image:
cd ../icepack docker build -t pnsinha/icepack:latest .


4. Create the Singularity definition file:
The Singularity definition file is already provided as `icepack.def`. Make sure it's in the current directory.

5. Build the Singularity container:
sudo singularity build icepack.sif icepack.def


This command will create a Singularity container named `icepack.sif` based on the `icepack.def` file.

## Additional Files

Ensure that the following files are present in the same directory as the Singularity definition file:

- `set_persistent_dir.sh`: Script to set up persistent directories
- `activate_venv.sh`: Script to activate the virtual environment

## Usage

To run the Singularity container:
singularity run icepack.sif 


This will activate the virtual environment, set up persistent directories, and launch a Python interpreter.

To run a specific Python script:
singularity run icepack.sif /path/to/script.py


## Notes

- The Singularity container uses the Docker image `pnsinha/icepack:latest` as its base.
- Persistent directories are set up in `/scratch/midway3/$USER/icepack_cache/`.
- Environment variables for Firedrake, PETSc, and other dependencies are set within the container.
- The container includes additional Python packages like `siphash24` and `pyyaml`.
- The container includes a script to activate the virtual environment and set up persistent directories.