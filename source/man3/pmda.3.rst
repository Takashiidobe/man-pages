.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmda(3) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMMUNICATING WITH P             |                                   |
| MCD <#COMMUNICATING_WITH_PMCD>`__ |                                   |
| \|                                |                                   |
| `DEFAULT CAL                      |                                   |
| LBACKS FOR HANDLING PDUs <#DEFAUL |                                   |
| T_CALLBACKS_FOR_HANDLING_PDUs>`__ |                                   |
| \|                                |                                   |
| `I                                |                                   |
| NSTANCES AND INSTANCE DOMAINS <#I |                                   |
| NSTANCES_AND_INSTANCE_DOMAINS>`__ |                                   |
| \| `NAMESPACE <#NAMESPACE>`__ \|  |                                   |
| `METRIC DESCR                     |                                   |
| IPTIONS <#METRIC_DESCRIPTIONS>`__ |                                   |
| \| `DSO PMDA <#DSO_PMDA>`__ \|    |                                   |
| `DAEMON PMDA <#DAEMON_PMDA>`__ \| |                                   |
| `HELP TEXT <#HELP_TEXT>`__ \|     |                                   |
| `INSTALLATION AND REMOV           |                                   |
| AL <#INSTALLATION_AND_REMOVAL>`__ |                                   |
| \|                                |                                   |
| `INSTALLATION REFINEMEN           |                                   |
| TS <#INSTALLATION_REFINEMENTS>`__ |                                   |
| \| `CAVEAT <#CAVEAT>`__ \|        |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDA(3)                 Library Functions Manual                 PMDA(3)

NAME
-------------------------------------------------

::

          PMDA - introduction to the Performance Metrics Domain Agent
          support library


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>
          #include <pcp/pmda.h>

           ... assorted routines ...

          cc ... -lpcp_pmda -lpcp


---------------------------------------------------------------

::

          To assist in the development of Performance Metric Domain Agents
          (PMDAs) for the Performance Co-Pilot (PCP), a procedural
          interface is provided that extends the Performance Metrics
          Application Programming Interface (PMAPI(3)) library.  These
          procedures are designed to enable a programmer to quickly build a
          PMDA which can then be tested and refined.  However, this also
          implies that a PMDA has a particular structure which may not be
          suitable for all PMDA implementations.

          Once you are familiar with the PCP and PMDA frameworks, you can
          quickly implement a new PMDA with only a few data structures and
          functions.  This is covered in far greater detail in the
          Performance Co-Pilot Programmer's Guide.

          A PMDA is responsible for a set of performance metrics, in the
          sense that it must respond to requests from pmcd(1) for
          information about performance metrics, instance domains, and
          instantiated values.

          This man page contains sections of the simple PMDA which is
          located at $PCP_PMDAS_DIR/simple.


---------------------------------------------------------------------------------------

::

          Two approaches may be used for connecting a PMDA to a pmcd(1)
          process.  A Dynamic Shared Object (DSO) can be attached by
          pmcd(1) using dlopen(3) when the pmcd(1) process is started.  A
          procedural interface referenced through a shared data structure
          is used to handle requests from pmcd(1) to the PMDA .

          The preferred approach is for a separate process (daemon) to
          communicate with pmcd(1) using the Performance Data Units (PDU)
          Inter-Process Communication (IPC) protocol.

          All PMDAs are launched and controlled by the pmcd(1) process on
          the local host.  The requests from the clients are received by
          pmcd(1) and forwarded to the appropriate PMDAs.  Responses, when
          required, are returned through pmcd(1) to the clients.  The
          requests (PDUs) that may be sent to a PMDA from pmcd(1) are
          PDU_FETCH, PDU_PROFILE, PDU_INSTANCE_REQ, PDU_DESC_REQ,
          PDU_TEXT_REQ and PDU_RESULT.  If the PMDA implements any dynamic
          metrics it may also receive PDU_PMNS_CHILD, PDU_PMNS_IDS,
          PDU_PMNS_NAMES and PDU_PMNS_TRAVERSE PDUs.


---------------------------------------------------------------------------------------------------------------

::

          To allow a consistent framework, pmdaMain(3) can be used by a
          daemon PMDA to handle the communication protocol using the same
          callbacks as a DSO PMDA.  The structure pmdaInterface is used to
          convey the common procedural interface and state information that
          is used by pmcd(1) and a PMDA.  This state information includes
          tables describing the supported metrics and instance domains.

          As most of the procedural interface is identical for all PMDAs,
          they are provided as part of this support library
          (pmdaProfile(3), pmdaFetch(3), pmdaInstance(3), pmdaDesc(3),
          pmdaText(3) and pmdaStore(3)).  However, these routines require
          access to the pmdaInterface state information so it must be
          correctly initialized using pmdaConnect(3), pmdaDaemon(3),
          pmdaOpenLog(3), pmdaDSO(3), pmdaGetOpt(3) and pmdaInit(3).


-----------------------------------------------------------------------------------------------------

::

          Three structures are declared in /usr/include/pcp/pmda.h which
          provide a framework for declaring the metrics and instances
          supported by the PMDA.

          Every instance requires a unique integer identifier and a unique
          name, as defined by the structure pmdaInstid:

               /*
                * Instance description: index and name
                */

               typedef struct {
                   int         i_inst;        /* internal instance identifier */
                   char        *i_name;       /* external instance identifier */
               } pmdaInstid;

          An instance domain requires its own unique identification
          (pmInDom), the number of instances the domain represents, and a
          pointer to an array of instance descriptions.  This is defined in
          the structure pmdaIndom:

               /*
                * Instance domain description: unique instance id,
                * number of instances in this domain, and the list of
                * instances (not null terminated).
                */

               typedef struct {
                   pmInDom     it_indom;       /* indom, filled in */
                   int         it_numinst;     /* number of instances */
                   pmdaInstid  *it_set;        /* instance identifiers */
               } pmdaIndom;

          The simple PMDA has one instance domain for simple.color with
          three instances (red, green and blue), and a second instance
          domain for simple.now with instances which can be specified at
          run-time.  These instance domains are defined as:

               static pmdaInstid _color[] = {
                   { 0, "red" }, { 1, "green" }, { 2, "blue" }
               };
               static pmdaInstid *_timenow = NULL;

               static pmdaIndom indomtab[] = {
               #define COLOR_INDOM 0
                   { COLOR_INDOM, 3, _color },
               #define NOW_INDOM 1
                   { NOW_INDOM, 0, NULL },
               };

          The preprocessor macros COLOR_INDOM and NOW_INDOM are used in the
          metric description table to identify the instance domains of
          individual metrics.  These correspond to the serial value in the
          instance domain pmInDom structure (the domain field is set by
          pmdaInit(3) at run-time).  The serial value must be unique for
          each instance domain within the PMDA.

          The indom table shown above which is usually passed to
          pmdaInit(3) does not need to be created if one wants to write
          one's own Fetch and Instance functions.  See pmdaInit(3) for more
          details.


-----------------------------------------------------------

::

          Every PMDA has its own unique namespace using the format defined
          in PMNS(5).  In summary, the namespace matches the names of the
          metrics to the unique identifier.  The simple PMDA defines five
          metrics: simple.numfetch, simple.color, simple.time.user,
          simple.time.sys and simple.now.  The namespace for these metrics
          is defined in $PCP_PMDAS_DIR/simple/pmns and is installed as:

               simple {
                   numfetch    253:0:0
                   color       253:0:1
                   time
                   now         253:2:4
               }

               simple.time {
                   user        253:1:2
                   sys         253:1:3
               }

          The domain number of 253 is obtained from
          $PCP_VAR_DIR/pmns/stdpmid.  New PMDAs should specify a unique
          domain number in this file, and obtain the number during
          installation.  This allows the domain number to change by
          modifying only the file $PCP_VAR_DIR/pmns/stdpmid.

          The simple.time and simple.now metrics are defined in separate
          clusters to the other metrics which allows a PMDA to support more
          than 1024 metrics, as well as grouping similar metrics together.
          Therefore, the item numbers for a new cluster may be identical to
          the item numbers in other clusters.  The simple PMDA continues to
          increment the item numbers to permit direct mapping (see
          pmdaInit(3)).

          The namespace file should be installed and removed with the agent
          using pmnsadd(1) and pmnsdel(1).  See the later sections on
          INSTALLATION and REMOVAL.

          A simple ASCII namespace can be constructed by creating a file
          similar to $PCP_PMDAS_DIR/simple/root:

               /*
                * fake "root" for validating the local PMNS subtree
                */

               #include "$PCP_VAR_DIR/pmns/stdpmid"

               root { simple }

               #include "pmns"

          and can be referred to with the -n option in most PCP tools.


-------------------------------------------------------------------------------

::

          Each metric requires a description (pmDesc), which contains its
          Performance Metric Identifier (PMID), data type specification,
          instance domain, semantics and units (see pmLookupDesc(3)).  A
          handle is also provided for application specific information in
          the pmdaMetric structure:

               /*
                * Metric description: handle for extending description,
                * and the description.
                */

               typedef struct {
                   void*       m_user;         /* for users external use */
                   pmDesc      m_desc;         /* metric description */
               } pmdaMetric;

          The simple PMDA defines the metrics as:

               static pmdaMetric metrictab[] = {
               /* numfetch */
                   { (void *)0,
                     { PMDA_PMID(0,0), PM_TYPE_U32, PM_INDOM_NULL, PM_SEM_INSTANT,
                       { 0,0,0,0,0,0} }, },
               /* color */
                   { (void *)0,
                     { PMDA_PMID(0,1), PM_TYPE_32, COLOR_INDOM, PM_SEM_INSTANT,
                       { 0,0,0,0,0,0} }, },
               /* time.user */
                   { (void*)0,
                     { PMDA_PMID(1,2), PM_TYPE_DOUBLE, PM_INDOM_NULL, PM_SEM_COUNTER,
                         { 0, 1, 0, 0, PM_TIME_SEC, 0 } }, },
               /* time.sys */
                   { (void*)0,
                     { PMDA_PMID(1,3), PM_TYPE_DOUBLE, PM_INDOM_NULL, PM_SEM_COUNTER,
                         { 0, 1, 0, 0, PM_TIME_SEC, 0 } }, },
               /* now */
                   { NULL,
                     { PMDA_PMID(2,4), PM_TYPE_U32, NOW_INDOM, PM_SEM_INSTANT,
                       { 0,0,0,0,0,0 } }, },
               };

          The macro PMDA_PMID (defined in /usr/include/pcp/pmda.h) is used
          to specify each metric's cluster and item fields of the
          associated pmID.  As with instance domains, the domain field is
          set by pmdaInit(3) at run-time, however, the default domain is
          assumed to be defined by the PMDA in the macro MYDOMAIN.

          The metric table shown above which is usually passed to
          pmdaInit(3) does not need to be created if one wants to write
          one's own Fetch and Descriptor functions.  See pmdaInit(3) for
          more details.


---------------------------------------------------------

::

          A PMDA that is run as a DSO is opened by pmcd(1) with dlopen(3).
          pmcd(1) will call the PMDA's initialization function that is
          specified in $PCP_PMCDCONF_PATH.  This function is passed a
          pointer to a pmdaInterface structure which must be completed.
          Any callbacks which are not the default PMDA support library
          callbacks must be specified in the pmdaInterface structure.

          The simple PMDA uses its own store and fetch callback.
          simple_fetch() calls pmdaFetch(3) which requires a callback to be
          set with pmdaSetFetchCallBack(3) as can be seen in
          $PCP_PMDAS_DIR/simple/simple.c.

          The flag _isDSO is used to determine if the PMDA is a daemon or a
          DSO so that the correct initialization routine, pmdaDaemon(3) or
          pmdaDSO(3), is called.


---------------------------------------------------------------

::

          A PMDA that is run as a daemon is forked and executed by pmcd(1).
          Therefore, unlike a DSO PMDA, the starting point for a daemon
          PMDA is main().  The agent should parse the command line
          arguments, create a log file and initialize some data structures
          that pmcd(1) would initialize for a DSO agent.

          The pmdaInterface structure must be completely defined by the
          daemon PMDA.  The function pmdaDaemon(3) can be called at the
          start of main() to set most of these fields.  Command line
          parsing can be simplified by using pmdaGetOpt(3), which is
          similar to getopt(2), but extracts a common set of options into
          the pmdaInterface structure.  stderr can be mapped to a log file
          using pmdaOpenLog(3) to simplify debugging and error messages.
          The connection to pmcd(1) can be made with pmdaConnect(3) and the
          loop which handles the incoming PDUs, pmdaMain(3), should be the
          last function called.  This can be seen in
          $PCP_PMDAS_DIR/simple/simple.c.

          The simple_init() routine is common to an agent that can be run
          as both a Daemon and DSO PMDA.


-----------------------------------------------------------

::

          Each PMDA must be able to provide pmcd(1) with the help text for
          each metric.  Most PMDAs use specially created files with indexes
          to support efficient retrieval of the help text.  Tools are
          provided with PCP to create the help text files of appropriate
          format. See newhelp(1).


-----------------------------------------------------------------------------------------

::

          A series of shell procedures are defined in
          $PCP_SHARE_DIR/lib/pmdaproc.sh which greatly simplify the
          installation and removal of a PMDA.

          The Install scripts for most PMDAs should only need to specify
          the name of the PMDA in iam, call pmdaSetup which sets up some
          default variables, checks permissions (you have to be ``root'' to
          install or remove a PMDA), checks that you're in the right
          directory (somewhere that ends with /pmdas/$iam), optionally
          generate the Performance Metrics Name Space (PMNS) and PMDA
          domain number files for Perl or Python PMDAs, checks the PMDA
          domain number is valid, etc., specify the communication
          protocols, and finally call pmdaInstall to do all the work of
          updating the PMNS, updating the pmcd(1) control file, notifying
          or restarting pmcd(1),

          Beyond pmdaSetup and pmdaInstall, another optional helper
          routines is pmdaChooseConfigFile that may be used to
          interactively select or create a PMDA-specific configuration
          file, e.g. pmdalogger(1).

          The Remove scripts are even simpler as setting up the
          communication protocols are not required, so set the name of the
          PMDA in iam, then call pmdaSetup followed by a call to
          pmdaRemove.

          Further information is contained in the
          $PCP_SHARE_DIR/lib/pmdaproc.sh file and the following section.

          Optionally, a PMDA may provide an Upgrade script alongside
          Install and Remove.  If present this script will be used by the
          pmcd startup process to ensure corrections to an installation
          have been made before starting the PMDA.  Examples of such
          corrections include: updates to pmcd.conf when a PMDA script or
          binary has been renamed, when the PMDA supports a new format of
          its configuration file, or if there is some latent problem from
          an earlier install (e.g. some PMDAs may need to introduce use of
          the notready keyword in pmcd.conf, as described below).


-----------------------------------------------------------------------------------------

::

          As outlined below there are a number of variables that can be set
          in a PMDA's Install script to influence the behaviour of the
          installation procedures.  These would typically need to be set
          before the call to pmdaInstall, but in some instances (like $iam
          and the cases specifically noted below), before the call to
          pmdaSetup.

          The following variables control the communication options between
          the PMDA and pmcd(1).  At least one of $daemon_opt, $dso_opt,
          $perl_opt or $python_opt must be set to define the supported
          mode(s) of communication.  If more than one of these is set the
          user will be prompted to make a selection when the Install script
          is run.

          daemon_opt
                 We are willing to install the PMDA as a daemon.
                 Default: true

          dso_opt
                 We are willing to install the PMDA as a DSO, so pmcd(1)
                 will use the dynamic linking loader to attach the PMDA's
                 DSO at run-time and communication from pmcd(1) to the PMDA
                 and back uses procedure calls, not an IPC channel.
                 Default: false

          dso_entry
                 For a DSO PMDA, this is the name of the PMDA's
                 initialization routine.
                 Default: ${iam}_init

          dso_name
                 For a DSO PMDA, this is the full pathanme of the PMDA's
                 DSO file.
                 Default: $PCP_PMDAS_DIR/$iam/pmda_$iam.$dso_suffix

          pipe_opt
                 For a daemon PMDA, is the default IPC channel via a
                 pipe(2)?
                 Default: Platform-specific, so true for most, but false
                 for Windows

          perl_opt
                 We are willing to install the PMDA as a Perl script and
                 pmcd(1) will use the perl(1) interpreter to run the PMDA.
                 Default: false

          pmda_dir
                 Full pathname to the directory where the PMDA's
                 installation files (executable, script, PMNS source, help
                 text source, etc) are to be found.
                 Default: output from pwd(1)

                          If set, must be done before the call to
                          pmdaSetup.

          pmda_name
                 For a daemon PMDA, this is the name of the PMDA's
                 executable binary relative to the $pmda_dir directory.
                 Default: pmda$iam

          python_opt
                 We are willing to install the PMDA as a Python script and
                 pmcd(1) will use the python(1) interpreter to run the
                 PMDA.
                 Default: false

          ipc_prot
                 For a daemon PMDA, this can be set to either binary or
                 text.  The default is binary and text is rarely used.  In
                 addition, an optional IPC parameter notready can be used
                 to signify that the PMDA will start up in the notready
                 state, e.g. ipc_prot="binary notready".  Note that the
                 quotes are required.  The IPC parameters for a PMDA appear
                 in pmcd.conf in the IPC Params column.  For further
                 details, see pmcd(1) but basically pmcd will not issue any
                 requests to a PMDA that has started in the notready state
                 until the PMDA sends a PM_ERR_PMDAREADY PDU.  This allows
                 PMDAs with long startup times to initialize correctly
                 without timing out.  For details, see pmdaSendError(3) and
                 pmcd(1).  When a PMDA is in the notready state, any client
                 requests sent to pmcd for the PMDA domain will return with
                 the PM_ERR_PMDANOTREADY error.

          socket_inet_def
                 For a daemon PMDA using a socket(2) as the IPC channel the
                 default Internet port number or service name (if known).
                 Default: ""

          socket_opt
                 For a daemon PMDA, is the default IPC channel via a
                 socket(2)?
                 Default: Platform-specific, so false for most, but true
                 for Windows

          The following variables control the PMNS options.

          pmns_dupok
                 Most PMDAs do not have duplicate names for the same PMID
                 in their PMNS.  But if this is not the case, pmns_dupok
                 should be set to true.
                 Default: false

          pmns_name
                 Each PMDA will add one or more non-leaf nodes to the top
                 of the PMNS.  The most common case is that all of the
                 metrics for a PMDA will be placed below the node named
                 $iam.  If this is not the case, and especially when the
                 PMDA adds more than one non-leaf node at the top of the
                 PMNS, pmns_name needs to be set to the list of node names
                 (separated by white space), e.g. for pmdaproc(1) pmns_name
                 is set to "proc cgroup hotproc".
                 Default: $iam

                          It is most important that if pmns_name is set to
                          a non-default value in the Install script then it
                          must also be set to the same value in the Remove
                          script.

          pmns_source
                 The name of the PMDA's PMNS source file.  By default, the
                 name is interpreted as a relative pathname from the
                 $pmda_dir directory.
                 Default: pmns

          The following variables provide assorted additional options
          associated with the installation of a PMDA.

          args   Additional command line args for the PMDA.  These will be
                 appended to the PMDA's control line in $PCP_PMCDCONF_PATH.
                 Default: ""

          check_delay
                 Delay (in seconds) after finishing the PMDA installation
                 (or removal) before checking the availability of metrics
                 from the PMDA.  May need to be increased if the PMDA has a
                 lengthy startup procedure.
                 Default: 0.3

          signal_delay
                 Delay (in seconds) after notifying pmcd(1) with a signal.
                 Required to allow pmcd(1) to complete processing before
                 proceeding to the next step of the installation (or
                 removal).
                 Default: 1

          configdir
                 Determines the directory in which a PMDA's configuration
                 file will be stored.  Used by pmdaChooseConfigFile so
                 should be set before calling that procedure.
                 Default: $PCP_VAR_DIR/config/$iam

          configfile
                 Preferred configuration file for the PMDA.  Used by
                 pmdaChooseConfigFile so should be set before calling that
                 procedure.
                 Default: ""

          default_configfile
                 Default configuration file for the PMDA.  Used by
                 pmdaChooseConfigFile so should be set before calling that
                 procedure.
                 Default: ""

          dso_suffix
                 Standard suffix for a DSO.  Should not need to be changed
                 under normal circumstances.
                 Default: Platform-specific, so 'so' for Linux, 'dylib' for
                 Mac OS X, 'dll' for Windows, etc.

                          If set, must be done before the call to
                          pmdaSetup.

          help_source
                 The name of the help text source file that should be used
                 as input to pmnewhelp(1).  By default, the name is
                 interpreted as a relative pathname from the $pmda_dir
                 directory.
                 Default: help

          python_name
                 Full pathname of the Python script for a Python PMDA.
                 Default: $pmda_dir/pmda$iam.python or
                 $pmda_dir/pmda$iam.py

          The shell procedures in $PCP_SHARE_DIR/lib/pmdaproc.sh manipulate
          a number of temporary files using the variable $tmp as the prefix
          for the name of the temporary files.  $tmp is a directory that is
          created, used and removed internally within the procedures of
          $PCP_SHARE_DIR/lib/pmdaproc.sh but can also be used as the prefix
          for temporary files needed by a PMDA's Install or Remove scripts.
          When used in this way, $tmp should be followed by a ``/'' and
          then a suffix, e.g. $tmp/myfoo.  The Install and Remove scripts
          should not use other temporary file name prefixes nor use sh(1)
          trap statements to clean up temporary files as this is all done
          within $PCP_SHARE_DIR/lib/pmdaproc.sh.


-----------------------------------------------------

::

          Failing to complete any of the data structures or calling any of
          the library routines out of order may cause unexpected behavior
          in the PMDA.

          Due to changes to the PMAPI(3) and PMDA(3) API in the PCP 2.0
          release, as described in the product release notes, PMDAs built
          using PCP 2.0 must specify PMDA_INTERFACE_2 or later and link
          with libpcp_pmda.so.2 and libpcp.so.2.  Pre-existing Daemon PMDAs
          specifying PMDA_PROTOCOL_1 will continue to function using the
          backwards compatible libpcp_pmda.so.1 and libpcp.so.1 libraries
          and may be recompiled using the headers installed in
          /usr/include/pcp1.x/ without any modification.  These backwards
          compatible headers and libraries are contained in the
          pcp.sw.compat subsystem.


---------------------------------------------------------------

::

          Any PMDA which uses this library can set PMAPI(3) debugging
          control option libpmda (with -Dlibpmda on the command line or via
          3pmSetDebug(3)) to to enable the display of debugging information
          which may be useful during development (see pmdbg(1)).

          The status field of the pmdaInterface structure should be zero
          after pmdaDaemon, pmdaDSO, pmdaGetOpt, pmdaConnect and pmdaInit
          are called.  A value less than zero indicates that initialization
          has failed.

          Some error messages that are common to most functions in this
          library are:

          PMDA interface version interface not supported
                 Most of the functions require that the comm.version field
                 of the pmdaInterface structure be set to PMDA_INTERFACE_2
                 or later.  PMDA_INTERFACE_2 or PMDA_INTERFACE_3 implies
                 that the version.two fields are correctly initialized,
                 while PMDA_INTERFACE_4 implies that the version.four
                 fields are correctly initialized (see pmdaDaemon(3) and
                 pmdaDSO(3)).


---------------------------------------------------

::

          /usr/include/pcp/pmda.h
                 Header file for the PMDA support library.

          /usr/lib/libpcp_pmda.so
                 Dynamic library containing PMDA support library routines.

          $PCP_PMDAS_DIR/trivial
                 The source of the trivial PMDA.

          $PCP_PMDAS_DIR/simple
                 The source of the simple PMDA.

          $PCP_PMDAS_DIR/txmon
                 The source of the txmon PMDA.

          $PCP_PMCDCONF_PATH
                 Configuration file for pmcd(1).

          $PCP_VAR_DIR/pmns
                 Location of namespace descriptions for every PMDA.

          $PCP_VAR_DIR/pmns/stdpmid
                 The unique domain identifiers for each PMDA.

          $PCP_SHARE_DIR/lib/pmdaproc.sh
                 Shell procedures for installing and removing a PMDA.


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).  Values for these variables may be obtained
          programmatically using the pmGetConfig(3) function.


---------------------------------------------------------

::

          dbpmda(1), newhelp(1), pmcd(1), pmnsadd(1), pmnsdel(1), PMAPI(3),
          PMWEBAPI(3), pmdaConnect(3), pmdaDaemon(3), pmdaDesc(3),
          pmdaDSO(3), pmdaFetch(3), pmdaGetOpt(3), pmdaInit(3),
          pmdaInstance(3), pmdaMain(3), pmdaOpenLog(3), pmdaProfile(3),
          pmdaStore(3), pmdaText(3), pmLookupDesc(3) and PMNS(5).

          For a complete description of the pcp_pmda library and the PMDA
          development process, refer to the Insight book Performance Co-
          Pilot Programmer's Guide.

COLOPHON
---------------------------------------------------------

::

          This page is part of the PCP (Performance Co-Pilot) project.
          Information about the project can be found at 
          ⟨http://www.pcp.io/⟩.  If you have a bug report for this manual
          page, send it to pcp@groups.io.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/performancecopilot/pcp.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Performance Co-Pilot               PCP                           PMDA(3)

--------------

Pages that refer to this page: `dbpmda(1) <../man1/dbpmda.1.html>`__, 
`genpmda(1) <../man1/genpmda.1.html>`__, 
`pmcd(1) <../man1/pmcd.1.html>`__, 
`pmdaroot(1) <../man1/pmdaroot.1.html>`__, 
`pmdasimple(1) <../man1/pmdasimple.1.html>`__, 
`pmdatrivial(1) <../man1/pmdatrivial.1.html>`__, 
`pmdatxmon(1) <../man1/pmdatxmon.1.html>`__, 
`pmdaweblog(1) <../man1/pmdaweblog.1.html>`__, 
`pmapi(3) <../man3/pmapi.3.html>`__, 
`pmda(3) <../man3/pmda.3.html>`__, 
`pmdaattribute(3) <../man3/pmdaattribute.3.html>`__, 
`pmdacache(3) <../man3/pmdacache.3.html>`__, 
`pmdachildren(3) <../man3/pmdachildren.3.html>`__, 
`pmdaconnect(3) <../man3/pmdaconnect.3.html>`__, 
`pmdadaemon(3) <../man3/pmdadaemon.3.html>`__, 
`pmdadesc(3) <../man3/pmdadesc.3.html>`__, 
`pmdadso(3) <../man3/pmdadso.3.html>`__, 
`pmdaeventarray(3) <../man3/pmdaeventarray.3.html>`__, 
`pmdaeventclient(3) <../man3/pmdaeventclient.3.html>`__, 
`pmdaeventqueue(3) <../man3/pmdaeventqueue.3.html>`__, 
`pmdafetch(3) <../man3/pmdafetch.3.html>`__, 
`pmdagetoptions(3) <../man3/pmdagetoptions.3.html>`__, 
`pmdahelp(3) <../man3/pmdahelp.3.html>`__, 
`pmdainit(3) <../man3/pmdainit.3.html>`__, 
`pmdainstance(3) <../man3/pmdainstance.3.html>`__, 
`pmdainterfacemoved(3) <../man3/pmdainterfacemoved.3.html>`__, 
`pmdalabel(3) <../man3/pmdalabel.3.html>`__, 
`pmdamain(3) <../man3/pmdamain.3.html>`__, 
`pmdaname(3) <../man3/pmdaname.3.html>`__, 
`pmdaopenlog(3) <../man3/pmdaopenlog.3.html>`__, 
`pmdapmid(3) <../man3/pmdapmid.3.html>`__, 
`pmdaprofile(3) <../man3/pmdaprofile.3.html>`__, 
`pmdarootconnect(3) <../man3/pmdarootconnect.3.html>`__, 
`pmdasenderror(3) <../man3/pmdasenderror.3.html>`__, 
`pmdastore(3) <../man3/pmdastore.3.html>`__, 
`pmdatext(3) <../man3/pmdatext.3.html>`__, 
`pmdatrace(3) <../man3/pmdatrace.3.html>`__, 
`pmjsonget(3) <../man3/pmjsonget.3.html>`__

--------------

--------------

.. container:: footer

   +-----------------------+-----------------------+-----------------------+
   | HTML rendering        |                       | |Cover of TLPI|       |
   | created 2021-08-27 by |                       |                       |
   | `Michael              |                       |                       |
   | Ker                   |                       |                       |
   | risk <https://man7.or |                       |                       |
   | g/mtk/index.html>`__, |                       |                       |
   | author of `The Linux  |                       |                       |
   | Programming           |                       |                       |
   | Interface <https:     |                       |                       |
   | //man7.org/tlpi/>`__, |                       |                       |
   | maintainer of the     |                       |                       |
   | `Linux man-pages      |                       |                       |
   | project <             |                       |                       |
   | https://www.kernel.or |                       |                       |
   | g/doc/man-pages/>`__. |                       |                       |
   |                       |                       |                       |
   | For details of        |                       |                       |
   | in-depth **Linux/UNIX |                       |                       |
   | system programming    |                       |                       |
   | training courses**    |                       |                       |
   | that I teach, look    |                       |                       |
   | `here <https://ma     |                       |                       |
   | n7.org/training/>`__. |                       |                       |
   |                       |                       |                       |
   | Hosting by `jambit    |                       |                       |
   | GmbH                  |                       |                       |
   | <https://www.jambit.c |                       |                       |
   | om/index_en.html>`__. |                       |                       |
   +-----------------------+-----------------------+-----------------------+

--------------

.. container:: statcounter

   |Web Analytics Made Easy - StatCounter|

.. |Cover of TLPI| image:: https://man7.org/tlpi/cover/TLPI-front-cover-vsmall.png
   :target: https://man7.org/tlpi/
.. |Web Analytics Made Easy - StatCounter| image:: https://c.statcounter.com/7422636/0/9b6714ff/1/
   :class: statcounter
   :target: https://statcounter.com/
