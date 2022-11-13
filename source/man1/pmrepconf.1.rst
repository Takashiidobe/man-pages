.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmrepconf(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SETUP GR                         |                                   |
| OUP FILES <#SETUP_GROUP_FILES>`__ |                                   |
| \| `OPTIONS <#OPTIONS>`__ \|      |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMREPCONF(1)             General Commands Manual            PMREPCONF(1)

NAME
-------------------------------------------------

::

          pmrepconf - create/edit a pmrep configuration file


---------------------------------------------------------

::

          pmrepconf [-crvV?]  [-d groupsdir] [-g grouptag] [-o option] [-h
          host] configfile


---------------------------------------------------------------

::

          pmrepconf may be used to create and modify a generic
          configuration file for pmrep(1) and related utilities in the
          pmrep.conf(5) format.

          If configfile does not exist, pmrepconf will create a generic
          configuration file with a set of discovered metrics in a
          [metrics] section.

          Once created, configfile may be used with the -c option to
          pmrep(1) and related utilities such as pcp2elasticsearch(2) and
          pcp2spark(2).

          If configfile does exist, pmrepconf will prompt for input from
          the user to enable or disable groups of related performance
          metrics.

          Group selection requires a simple y (yes) or n (no) response to
          the prompt Log this group?.

          Other responses at this point may be used to select additional
          control functions as follows:

          m         Report the names of the metrics in the current group.

          q         Finish with group selection (quit) and make no further
                    changes to this group or any subsequent group.

          /pattern  Make no change to this group but search for a group
                    containing pattern in the description of the group or
                    the names of the associated metrics.

          When run from automated setup processes, the -c option is used to
          indicate that pmrepconf is in auto-create mode and no interactive
          dialog takes place.  The output configfile has an additional
          comment message and timestamp indicating this fact, so that it
          can be identified and subsequently updated using -c again.  This
          option is not appropriate for interactive use of the tool.

          More verbose output may be enabled with the -v option.


---------------------------------------------------------------------------

::

          When an initial configfile is created, the default specifications
          come from a set of group files below the groupsdir specified with
          the -d option (the default groupsdir is
          $PCP_VAR_DIR/config/pmlogconf which is most commonly correct, so
          the -d option is rarely used in practice).

          The directory structure and format of files below groupsdir is
          shared with the pmlogconf(1) utility, and described in detail on
          that manual page.  When used by pmrepconf all interval settings
          are ignored.


-------------------------------------------------------

::

          The available command line options are:

          -c   Enable non-interactive, auto-create mode.

          -d groupdir, --groups=groupdir
               Specify the path to the groupsdir directory.

          -g grouptag, --group=grouptag
               Query logging state for the specific group named grouptag.

          -h host, --host=host
               Performance metrics source is pmcd(1) on host, rather than
               on the default localhost.

          -o option, --option=option
               Specify an option to be added to the [option] secton of the
               generated pmrep.conf(5) file.  This command line option can
               be presented multiple times in order to added multiple lines
               in the [option] section.

          -r, --reprobe
               Reconsider every group for inclusion in the configfile.

          -v, --verbose
               Enable verbose mode.

          -V, --version
               Display version number and exit.

          -?, --help
               Display usage message and exit.


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).

          pmrepconf overrides any $PCP_DERIVED_CONFIG environment variable
          to an empty string, for performance reasons.

          pmrepconf honours the $PMCD_WAIT_TIMEOUT environment variable
          when probing and creating new pmrep configuration files.  It uses
          a default timeout value of 10 seconds for this, in the absence of
          an environment setting.


---------------------------------------------------------

::

          pcp2elasticsearch(1), pcp2spark(1), pmcd(1), pmlogconf(1),
          pmrep(1), pcp.conf(5), pcp.env(5) and pmrep.conf(5)

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

   Performance Co-Pilot               PCP                      PMREPCONF(1)

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
