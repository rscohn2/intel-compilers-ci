# Patterns used to check silent configuration file
#
# anythingpat - any string
# filepat     - the file location pattern (/file/location/to/license.lic)
# lspat       - the license server address pattern (0123@hostname)
# snpat       - the serial number pattern (ABCD-01234567)
# comppat     - the component abbreviation (intel-component-0123.4-567__arch), use installer command line option to get it

# Accept EULA, valid values are: {accept, decline}
ACCEPT_EULA=accept

# Optional error behavior, valid values are: {yes, no}
CONTINUE_WITH_OPTIONAL_ERROR=yes

# Install location, valid values are: {/opt/intel, filepat}
PSET_INSTALL_DIR=/opt/intel

# Continue with overwrite of existing installation directory, valid values are: {yes, no}
CONTINUE_WITH_INSTALLDIR_OVERWRITE=yes

# List of components to install (use semicolon to separate the components), valid values are: {ALL, DEFAULTS, comppat}
COMPONENTS=intel-icc-64bit-meta-linux-2019.2-192__noarch

# Installation mode, valid values are: {install, repair, uninstall}
PSET_MODE=install

# Serial number, valid values are: {snpat}
ACTIVATION_SERIAL_NUMBER=IS_SERIAL_NUMBER

# License file or license server, valid values are: {lspat, filepat}
#ACTIVATION_LICENSE_FILE=

# Activation type, valid values are: {exist_lic, license_server, license_file, serial_number}
ACTIVATION_TYPE=serial_number

# Intel(R) Software Improvement Program
#
# To improve our software and customer experience, Intel would like to collect technical
# information about your software installation and runtime status (such as installation metrics,
# license/support types, software SKU/serial, counters, flags, and timestamps)
# and development environment (such as operating system, CPU architecture,
# last 4-digits of the MAC address and other Intel products installed). ("Information").
#
# Information collected under this notice may be retained by Intel indefinitely but
# it will not be shared outside of Intel or its wholly-owned subsidiaries.
#
# You can revoke your consent at any time by choosing "Improvement Program Options" in the "Settings" tab of
# the Intel(R) Software Manager and selecting the "I do NOT consent to the collection of my Information" option.
# For more details please refer to this article:
# https://software.intel.com/en-us/articles/software-improvement-program.
#
# Yes - I consent to the collection of my Information
# No  - I do NOT consent to the collection of my Information
#, valid values are: {yes, no}
#INTEL_SW_IMPROVEMENT_PROGRAM_CONSENT=no

# Path to configuration file that contains the tools selected on the web-based configuration page, valid values are: {filepat}
#SELECTION_CONFIG_FILES_PATH=filepat

# Enable check for updates mode, valid values are: {yes, no}
#CHECK_FOR_UPDATES_MODE=no

# Path to Android* NDK, valid values are: {filepat}
#NDK_PATH=filepat

# Enable Android* NDK integration, valid values are: {yes, no}
#NDK_INTEGRATION_ENABLED=no

# Enable Wind River* Linux Build Environment Integration, valid values are: {yes, no}
WB_INTEGRATION_ENABLED=no

# Path to Wind River* Linux home location, valid values are: {filepat}
#WB_INTEGRATION_PATH=filepat

