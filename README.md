# intel-compilers-ci

Scripts and sample configurations files for using intel compilers with
cloud-based CI systems including Appveyor, CircleCI, GitLab, & TravisCI.

The script installs the Intel C++ & Fortran compilers on a minimal
Container/VM, including the license file. The files in this repo can
be used as a reference for non-interactive install of a compiler.

## How it works

This repo contains:

* a small shell script that downloads and installs Intel C++ & Fortran compilers for easy integration into CI scripts.
* sample configuration files for popular CI systems
* sample project to build

You can be up and running in 10 minutes! Setting up your project has 4
steps:

1. [Add the is-insallers directory to the top level of your project](#add_directory)
2. [Add a few lines to your CI config file to install the compiler](#config_file)
3. [Obtain a license to use intel compilers](#get_license)
4. [Set some environment variables in the CI settings so the installer can get your license](#environment)

If you want to try it out quickly, you can clone this repo and skip steps 1 & 2.

### Add intel-compilers directory to your project <a name="add_directory">

Clone this repo and copy the is-installers directory into your
repo. If you don't want to include the files in your repo, just add
this to your CI config to copy it at install time:

        wget https://github.com/rscohn2/intel-compilers-ci/archive/master.zip
        unzip master.zip
        mv intel-compilers-ci-master/is-installers .

### Add a few lines to your CI config file to install the compiler <a name="config_file">

We have examples for several CI systems in this repo.

### Obtain a license to use intel compilers <a name="get_license">

The compiler will check for a license when it is installed and
everytime you compile a file. The license is a file in
/opt/intel/licenses

If you do not already have a license for intel compilers, there are
several options, some of which are low cost or free. Please look at
[Intel Parallel Studio
XE](https://software.intel.com/en-us/parallel-studio-xe/choose-download). If
you are looking at this repo, you are probably an open source
developer. Open source contributors can qualify for a [free license](
https://software.intel.com/en-us/qualify-for-free-software/opensourcecontributor)
for Linux!  Whatever option you choose, you can start immediately with
a free 30 day license. 

You will need your license file in the next step. You can download the
license file by visiting [Intel Registration
Center](https://registrationcenter.intel.com/en/products).  Click on
the serial number in the leftmost column. Near the top of the page,
there will be icons for downloading or emailing the license
file. Treat the license file as a password. Do not put it in your
publicly visible source repo or post it on the web.

### Set some environment variables in the CI settings so the installer can get your license <a name="environment">

When the CI system starts, we need to install the license file before
installing the compiler. We do this by putting the contents of the
license file in an environment variable, and then the install script writes
the contents of the environment variable to a file.

Using an environment variable to hold the license file has 2 benefits.

* Other people can fork your repo and use their own license by setting
  the environment variable to their license file.

* CI systems do not let other users see your environment variables, so
  your license is secure

There is one catch. The license file has special characters that make
it difficult to store in an environment variable. To avoid this
problem, we encode the license file when storing it in a variable.

You can encode this way:

        openssl base64 -A < license.lic

Cut and paste the output of this command into an appropriate
envrionment variable in the CI system.

All the CI systems let you set environment variables in the settings
of the web interface. The settings are specific to your project on the
CI system and not visible to other users. See [CI
systems](#CI_systems) for specific directions.

Below are the environment variable names:

        IS_LICENSE_DATA_LINUX
        IS_LICENSE_DATA_WINDOWS
        IS_LICENSE_DATA_MACOS_ICC
        IS_LICENSE_DATA_MACOS_IFORT

## Sample project

We include a sample project based on [Cmake](https://cmake.org/) to
build with the C++ and Fortran compilers:

        # Build
        mkdir build
        cd build
        source /opt/intel/bin/iccvars.sh -arch intel64
        FC=ifort CC=icc CXX=icpc cmake ../src
        make
        # Test
        make test

## Compiler versions

The master branch of this repo will install the latest compiler. We
also have branches for each Compiler release, and [GitHub
releases](https://github.com/rscohn2/intel-compilers-ci/releases) for
each branch.

## CI systems <a name="CI_systems">

### TravisCI

Status: [![Build Status](https://travis-ci.org/rscohn2/intel-compilers-ci.svg?branch=master)](https://travis-ci.org/rscohn2/intel-compilers-ci)

Setting the environment variable:
[Instructions](https://docs.travis-ci.com/user/environment-variables/#defining-variables-in-repository-settings)

### CircleCI

Status: [![CircleCI](https://circleci.com/gh/rscohn2/intel-compilers-ci/tree/master.svg?style=svg)](https://circleci.com/gh/rscohn2/intel-compilers-ci/tree/master)

Setting the environment variable:
[Instructions](https://circleci.com/docs/2.0/env-vars/#setting-an-environment-variable-in-a-project)

### Gitlab CI/CD

Status: [![Build Status](https://gitlab.com/rscohn2/intel-compilers-ci/badges/master/build.svg)](https://gitlab.com/rscohn2/intel-compilers-ci/-/jobs)

Setting the environment variable: [instructions](https://docs.gitlab.com/ee/ci/variables/#protected-variables)

### Appveyor

Status: [![Build status](https://ci.appveyor.com/api/projects/status/lhhe8c5xho1ra7kx/branch/master?svg=true)](https://ci.appveyor.com/project/rscohn2/intel-compilers-ci/branch/master)

Setting the environment variable: [instructions](https://www.appveyor.com/docs/build-configuration/#custom-environment-variables)

### Azure Pipelines

Status: [![Build Status](https://dev.azure.com/robertscohn/intel-compilers-ci/_apis/build/status/rscohn2.intel-compilers-ci?branchName=master)](https://dev.azure.com/robertscohn/intel-compilers-ci/_build/latest?definitionId=1&branchName=master)

Setting the environment variable: [instructions](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/variables?view=azure-devops&tabs=designer%2Cbatch#secret-variables)

## Updating for a new compiler release

* Update the installer URL and file names in the install script and
  the silent.cfg file.

* Push a feature branch to verify that it works. Pull requests may not
  have access to the license files, depending on the CI system
  configuration.

* Merge the feature branch

* Make a branch for the compiler release

* In the new branch, edit the README.md so the URL for the build badges use the branch
  name, instead of master.

* Push a feature branch and verify that it works.

* Merge the feature branch
