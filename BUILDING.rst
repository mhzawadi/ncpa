=============
Building NCPA
=============

*This document is a work in progress for Python 3 and NCPA 3.*

Building with Docker
====================

Building on Windows
===================

*Note: The current Windows pre-build script is written in batch and
must be executed by cmd.exe. For this reason, any Windows commands
listed in this document will be written with cmd.exe compatibility
in mind.*

**Prerequisites for Windows** (Installing some of these prerequisites requires admin rights)
-------------------------

* `Git for Windows <https://git-scm.com/download/win>`_
* Python 3.9.x (32-Bit) (`Download <https://www.python.org/downloads/>`_)
* OpenSSL for Windows (32-bit) (`Download <https://slproweb.com/download/Win32OpenSSL-1_1_1a.exe>`_) *(Requires admin rights)*
* `Microsoft Visual C++ Compiler Build Tools <https://wiki.python.org/moin/WindowsCompilers>`_ *(Requires admin rights/version used is based on version of python installed)*
* `NSIS 3 <http://nsis.sourceforge.net/Download>`_ *Requires admin rights*

Configure the Build Environment
-------------------------------

Install Prerequisites
~~~~~~~~~~~~~~~~~~~~~

* Python

  1. Download and install Python 3.x. (`see prerequisites <#prerequisites>`_)
  2. Execute the installer as usual.

* OpenSSL

  1. Download and install the OpenSSL package. (`see prerequisites <#prerequisites>`_)
  2. Be sure to make a not of the installation directory while installing.

* Microsoft Visual C++ Compiler` Build Tools

  1. Download and run the installer. (`see prerequisites <#prerequisites>`_)
  2. Follow the instructions outlined in the article in prerequisite section to
  ensure you install the proper version for your python version

* NSIS

  1. Download and run the installer. (`see prerequisites <https://github.com/NagiosEnterprises/ncpa/blob/master/BUILDING.rst#prerequisites>`_)

* pywin32

  1. Download and run the installer (`see prerequisites <https://github.com/NagiosEnterprises/ncpa/blob/master/BUILDING.rst#prerequisites>`_)

  If the installer says python isn't in the registry, then the installer doesn't match your python (which should be 2.7.16 32-bit).

* pip

  * Pip is installed by default but should be updated before continuing::

      "%pydir%" -m pip install --upgrade pip

Install the Last Modules
~~~~~~~~~~~~~~~~~~~~~~~~

* Install the full list of python modules

  "%pydir%\python" -m pip install --upgrade -r build/resources/require.win.txt

Build NCPA
~~~~~~~~~~

Run the build script::

  "%pydir%\python" build\build_windows.py


Building on Linux
=================

Building on CentOS 7 is the easiest way to get a working package for all Linux distributions except the SuSE variants which seem to build most easily on openSuSE 15 Leap, and SLES 15. For Ubuntu/Debian, you will need copy the generated .rpm to an Ubuntu system (20.04 recommended) with alien installed and run alien to create a .deb file that will work on all of the supported distributions.

*WARNING: DO THIS ON A VM OR NOT A PRODUCTION SYSTEM*

To start, clone the repository in your directory::

The CentOS 7 build flow (for all non-SuSE linux)
-------------------------------------------------
  **Clone the git repo on a CentOS 7 machine** (*It must have wget and git installed*)::

Now run the setup scripts to install the requirements::

  cd ncpa/build/scripts
  ./build.sh

Follow the prompts to setup the system. When running the build.sh script it will setup
the system and build the ncpa binary.


  **SLES**

  On SLES 15, the build script fails because rpm-build is no longer available in the zypper repositories. Hence, this process is not really recommended, but it is provided for those useers for whom building on older versions of SLES is necessary.

  **Clone the repo as for OpenSuSE above.**

  **Edit linux/setup.sh and remove "rpm-build" from line 49**

  **Run build script to install the requirements and build an archive**

  The script will die when it tries to invoke rpm-build leaving a compressed tarball in the build directory, e.g., ncpa-2.4.1.tar.gz.

  **Copy this .gz into the build dir of the ncpa repo on another distrbution that that has rpm-build available, .e.g, a CentOS 7 VM.**

  **Select the proper .spec file, as for OpenSuSE above.**

  **From the build directory, run linux/package.sh**

  An rpm, e.g., ncpa-2.4.1-sle15.x86_64.rpm, will be generated.


**Install on the target Linux server**
--------------------------------

  Copy the resulting ~/ncpa/build/ncpa-2.x.x-1.elx.x86_64.rpm or ncpa_2.4.1-1.el7_amd64.deb to the desired server and install using the appropriate package system:

  On CentOs/RHEL::

    yum install ./ncpa-2.x.x-1.elx.x86_64.rpm

  On Ubuntu/Debian::

    apt install ./ncpa_2.4.1-1.el7_amd64.deb

  On OpenSuSE/SLES::

    zypper install ./ncpa_2.4.1-1.el7_amd64.deb


Building on MacOS
=================

Working on this section. It's basically the same as Linux, however you may need to
install the libraries and python differently, due to it being macOS. You must have
python3 installed prior to running it. You'll also have to use the following command
to build the dmg::

  cd ncpa/build/scripts
  ./build.sh
