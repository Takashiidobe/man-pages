.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcp-atoprc(5) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `OWN DEFINITION OF OUTPUT LINE <# |                                   |
| OWN_DEFINITION_OF_OUTPUT_LINE>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCP-ATOPRC(5)              File Formats Manual             PCP-ATOPRC(5)

NAME
-------------------------------------------------

::

          pcp-atoprc - pcp-atop and pcp-atopsar resource file


---------------------------------------------------------------

::

          This manual page documents the resource file of the pcp-atop and
          pcp-atopsar commands.  These commands can be used to monitor the
          system and process load on a system.

          The pcp-atoprc file contains the default settings. These settings
          are read during startup, first from the system-wide rcfile
          /etc/atoprc and after that from the user-specific rcfile
          ~/.atoprc (so system-wide settings can be overruled by an
          individual user).  The options in both rcfiles are identical.


-------------------------------------------------------

::

          The rcfile contains keyword-value pairs, one on every line (blank
          lines and lines starting with a #-sign are ignored).
          The following keywords can be specified:

          flags
              A list of default flags for pcp-atop can be defined here. The
              flags which are allowed are 'g', 'm', 'd', 'n', 'u', 'p',
              's', 'c', 'v', 'C', 'M', 'D', 'N', 'A', 'a', 'y', 'f', 'F',
              'G', 'R', '1', 'e', 'E' and 'x'.

          interval
              The default interval value in seconds.

          linelen
              The length of a screen line when sending output to a file or
              pipe (default 80).

          username
              The default regular expression for the users for which active
              processes will be shown.

          procname
              The default regular expression for the process names to be
              shown.

          maxlinecpu
              The maximum number of active CPUs that will be shown.

          maxlinegpu
              The maximum number of active GPUs that will be shown.

          maxlinelvm
              The maximum number of active logical volumes that will be
              shown.

          maxlinemdd
              The maximum number of active multiple devices that will be
              shown.

          maxlinedisk
              The maximum number of active disks that will be shown.

          maxlinenfsm
              The maximum number of NFS mounts that will be shown on an NFS
              client.

          maxlineintf
              The maximum number of active network interfaces that will be
              shown.

          maxlinecont
              The maximum number of active containers that will be shown.

          cpucritperc
              The busy percentage considered critical for a processor (see
              section COLORS in the man-page of the pcp-atop command).
              This percentage is used to determine a weighted percentage
              for line coloring and sorting of active processes.  When this
              value is zero, no line coloring or automatic sorting is
              performed for this resource.

          dskcritperc
              The busy percentage considered critical for a disk (see
              section COLORS in the man-page of the pcp-atop command).
              This percentage is used to determine a weighted percentage
              for line coloring and sorting of active processes.  When this
              value is zero, no line coloring or automatic sorting is
              performed for this resource.

          netcritperc
              The busy percentage considered critical for a network
              interface (see section COLORS in the man-page of the pcp-atop
              command).  This percentage is used to determine a weighted
              percentage for line coloring and sorting of active processes.
              When this value is zero, no line coloring or automatic
              sorting is performed for this resource.

          memcritperc
              The percentage considered critical for memory utilization
              (see section COLORS in the man-page of the pcp-atop command).
              This percentage is used to determine a weighted percentage
              for line coloring and sorting of active processes.  When this
              value is zero, no line coloring or automatic sorting is
              performed for this resource.

          swpcritperc
              The occupation percentage considered critical for swap space
              (see section COLORS in the man-page of the pcp-atop command).
              This percentage is used to determine a weighted percentage
              for line coloring and sorting of active processes.  When this
              value is zero, no line coloring or automatic sorting is
              performed for this resource.

          swoutcritsec
              The number of pages swapped out per second considered
              critical for for memory utilization (see section COLORS in
              the man-page of the pcp-atop command).  This threshold is
              used in combination with 'memcritperc' to determine a
              weighted percentage for line coloring and sorting of active
              processes.  When this value is zero, no line coloring or
              automatic sorting is performed for this resource.

          almostcrit
              A percentage of the critical percentage to determine if the
              resource is almost critical (see section COLORS in the man-
              page of the pcp-atop command).  When this value is zero, no
              line coloring for `almost critical' is performed.

          colorinfo
              Definition of color name for information messages (default:
              green).
              Allowed colors are: red green yellow blue magenta cyan black
              white.

          colorthread
              Definition of color name for thread-specific lines when using
              the 'y' option (default: yellow).
              Allowed colors are: red green yellow blue magenta cyan black
              white.

          coloralmost
              Definition of color name for almost critical resources
              (default: cyan).
              Allowed colors are: red green yellow blue magenta cyan black
              white.

          colorcritical
              Definition of color name for critical resources (default:
              red).
              Allowed colors are: red green yellow blue magenta cyan black
              white.

          pcp-atopsarflags
              A list of default flags for pcp-atopsar can be defined here.
              The flags that are allowed are 'S', 'x', 'C', 'M', 'H', 'a',
              'A' and the flags to select one or more specific reports.

          An example of the /etc/atoprc or ~/.atoprc file:

                  flags         Aaf
                  interval      5
                  username
                  procname
                  maxlinecpu    4
                  maxlinedisk   10
                  maxlineintf   5
                  cpucritperc   80
                  almostcrit    90
                  pcp-atopsarflags  CMH
                  ownprocline   PID:50 VGROW:40 RGROW:45 COMMAND-LINE:50
                  ownpagline    PAGSCAN:3 BLANKBOX:0 PAGSWIN:3 PAGSWOUT:7

          The keywords 'ownprocline' and 'ownpagline' are explained in the
          subsequent section.


---------------------------------------------------------------------------------------------------

::

          Via the rcfile it is possible to define the layout of the output
          lines yourself, i.e. you can define the layout of one line with
          process information with the keyword 'ownprocline' (to be
          selected with the key 'o' or the flag -o) and you can redefine
          all lines with system information.

          The layout of an output-line can be defined as follows (notice
          that this should be specified as one line in the rcfile):

             keyword   <columnid>:<prio> [<columnid>:<prio> ...]

          The columnid is the symbolic name of a column that should shown
          at this position in the output line.
          The prio is a positive integer value that determines which
          columns have precedence whenever not all specified columns fit
          into the current screen-width.  The higher value, the higher
          priority.
          The column-specifications should be separated by a space. The
          order in which columns have been specified is the order in which
          they will be shown, with respect to their priority (columns that
          do not fit, will be dropped dynamically).

          A special columnid for system lines is 'BLANKBOX'. This indicates
          that an empty column is required at this position. Also this
          special columnid is followed by a priority (usually low).

          The following definition can be specified for process
          information:

          ownprocline
              The columnids are the names of the columns that are shown in
              the normal output of the process-related lines that are shown
              by pcp-atop such as 'PID', 'CMD', 'S', ....  The only
              exception is the special columnid 'SORTITEM' that is used to
              show one of the columns CPU%/DSK%/MEM%/NET%, depending on the
              chosen sort-criterium.
              An example of a user-defined process line:

                  ownprocline   PID:20 PPID:10 SYSCPU:15 USRCPU:15 VGROW:14
                  VSIZE:12 RGROW:14 RSIZE:12 ST:8 EXC:7 S:11 SORTITEM:18
                  CMD:20

          The following definitions are used internally by pcp-atop as the
          default system lines (you can redefine each of them in the rcfile
          as one line):

          ownsysprcline
              Redefinition of line labeled with 'PRC':

                  ownsysprcline   PRCSYS:8 PRCUSER:8 BLANKBOX:0 PRCNPROC:7
                  PRCNZOMBIE:5 PRCCLONES:4 BLANKBOX:0 PRCNNEXIT:6

          ownallcpuline
              Redefinition of line labeled with 'CPU' for total CPU-
              utilization:

                  ownallcpuline   CPUSYS:8 CPUUSER:7 CPUIRQ:4 BLANKBOX:0
                  CPUIDLE:5 CPUWAIT:6 BLANKBOX:0 CPUSTEAL:1 CPUGUEST:3

          ownonecpuline
              Redefinition of line labeled with 'CPU' for utilization of
              one CPU:

                  ownonecpuline   CPUISYS:8 CPUIUSER:7 CPUIIRQ:4 BLANKBOX:0
                  CPUIIDLE:5 CPUIWAIT:6 BLANKBOX:0 CPUISTEAL:1 CPUIGUEST:3

          owncplline
              Redefinition of line labeled with 'CPL':

                  owncplline   CPLAVG1:4 CPLAVG5:3 CPLAVG15:2 BLANKBOX:0
                  CPLCSW:6 CPLINTR:5 BLANKBOX:0 CPLNUMCPU:1

          ownmemline
              Redefinition of line labeled with 'MEM':

                  ownmemline   MEMTOT:2 MEMFREE:5 MEMCACHE:3 MEMDIRTY:1
                  MEMBUFFER:3 MEMSLAB:3 BLANKBOX:0 BLANKBOX:0 BLANKBOX:0
                  BLANKBOX:0

          ownswpline
              Redefinition of line labeled with 'SWP':

                  ownswpline   SWPTOT:3 SWPFREE:4 BLANKBOX:0 BLANKBOX:0
                  BLANKBOX:0 BLANKBOX:0 BLANKBOX:0 BLANKBOX:0
                  SWPCOMMITTED:5 SWPCOMMITLIM:6

          ownpagline
              Redefinition of line labeled with 'PAG':

                  ownpagline   PAGSCAN:3 PAGSTALL:1 BLANKBOX:0 PAGSWIN:4
                  PAGSWOUT:3

          owndskline
              Redefinition of lines labeled with 'LVM', 'MDD' and 'DSK':

                  owndskline   DSKNAME:8 DSKBUSY:7 DSKNREAD:6 DSKNWRITE:6
                  DSKKBPERRD:4 DSKKBPERWR:4 DSKMBPERSECRD:5 DSKMBPERSECWR:5
                  DSKAVQUEUE:1 DSKAVIO:5

          ownnettrline
              Redefinition of line labeled with 'NET' for transport:

                  ownnettrline   NETTRANSPORT:9 NETTCPI:8 NETTCPO:8
                  NETUDPI:8 NETUDPO:8 NETTCPACTOPEN:6 NETTCPPASVOPEN:5
                  NETTCPRETRANS:4 NETTCPINERR:3 NETTCPORESET:20
                  NETUDPNOPORT:1 NETUDPINERR:3

          ownnetnetline
              Redefinition of line labeled with 'NET' for network:

                  ownnetnetline   NETNETWORK:5 NETIPI:4 NETIPO:4 NETIPFRW:4
                  NETIPDELIV:4 BLANKBOX:0 BLANKBOX:0 BLANKBOX:0 NETICMPIN:1
                  NETICMPOUT:1

          ownnetifline
              Redefinition of line labeled with 'NET' for interfaces:

                  ownnetifline   NETNAME:8 NETPCKI:7 NETPCKO:7 NETSPEEDIN:6
                  NETSPEEDOUT:6 NETCOLLIS:3 NETMULTICASTIN:2 NETRCVERR:5
                  NETSNDERR:5 NETRCVDROP:4 NETSNDDROP:4

          The lines above are shown in the order as shown by pcp-atop in
          combination with the -f flag (in a very wide window you should be
          able to see all of the columns).


---------------------------------------------------------

::

          pcp(1), pcp-atop(1), pcp-atopsar(1) and PCPIntro(1).

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

   Performance Co-Pilot               PCP                     PCP-ATOPRC(5)

--------------

Pages that refer to this page:
`pcp-atop(1) <../man1/pcp-atop.1.html>`__, 
`pcp-atopsar(1) <../man1/pcp-atopsar.1.html>`__

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
