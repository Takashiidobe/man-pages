.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

environ(7) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ENVIRON(7)              Linux Programmer's Manual             ENVIRON(7)

NAME
-------------------------------------------------

::

          environ - user environment


---------------------------------------------------------

::

          extern char **environ;


---------------------------------------------------------------

::

          The variable environ points to an array of pointers to strings
          called the "environment".  The last pointer in this array has the
          value NULL.  This array of strings is made available to the
          process by the execve(2) call when a new program is started.
          When a child process is created via fork(2), it inherits a copy
          of its parent's environment.

          By convention, the strings in environ have the form "name=value".
          The name is case-sensitive and may not contain the character "=".
          The value can be anything that can be represented as a string.
          The name and the value may not contain an embedded null byte
          ('\0'), since this is assumed to terminate the string.

          Environment variables may be placed in the shell's environment by
          the export command in sh(1), or by the setenv command if you use
          csh(1).

          The initial environment of the shell is populated in various
          ways, such as definitions from /etc/environment that are
          processed by pam_env(8) for all users at login time (on systems
          that employ pam(8)).  In addition, various shell initialization
          scripts, such as the system-wide /etc/profile script and per-user
          initializations script may include commands that add variables to
          the shell's environment; see the manual page of your preferred
          shell for details.

          Bourne-style shells support the syntax

              NAME=value command

          to create an environment variable definition only in the scope of
          the process that executes command.  Multiple variable
          definitions, separated by white space, may precede command.

          Arguments may also be placed in the environment at the point of
          an exec(3).  A C program can manipulate its environment using the
          functions getenv(3), putenv(3), setenv(3), and unsetenv(3).

          What follows is a list of environment variables typically seen on
          a system.  This list is incomplete and includes only common
          variables seen by average users in their day-to-day routine.
          Environment variables specific to a particular program or library
          function are documented in the ENVIRONMENT section of the
          appropriate manual page.

          USER   The name of the logged-in user (used by some BSD-derived
                 programs).  Set at login time, see section NOTES below.

          LOGNAME
                 The name of the logged-in user (used by some System-V
                 derived programs).  Set at login time, see section NOTES
                 below.

          HOME   A user's login directory.  Set at login time, see section
                 NOTES below.

          LANG   The name of a locale to use for locale categories when not
                 overridden by LC_ALL or more specific environment
                 variables such as LC_COLLATE, LC_CTYPE, LC_MESSAGES,
                 LC_MONETARY, LC_NUMERIC, and LC_TIME (see locale(7) for
                 further details of the LC_* environment variables).

          PATH   The sequence of directory prefixes that sh(1) and many
                 other programs employ when searching for an executable
                 file that is specified as a simple filename (i.a., a
                 pathname that contains no slashes).  The prefixes are
                 separated by colons (:).  The list of prefixes is searched
                 from beginning to end, by checking the pathname formed by
                 concatenating a prefix, a slash, and the filename, until a
                 file with execute permission is found.

                 As a legacy feature, a zero-length prefix (specified as
                 two adjacent colons, or an initial or terminating colon)
                 is interpreted to mean the current working directory.
                 However, use of this feature is deprecated, and POSIX
                 notes that a conforming application shall use an explicit
                 pathname (e.g., .)  to specify the current working
                 directory.

                 Analogously to PATH, one has CDPATH used by some shells to
                 find the target of a change directory command, MANPATH
                 used by man(1) to find manual pages, and so on.

          PWD    The current working directory.  Set by some shells.

          SHELL  The absolute pathname of the user's login shell.  Set at
                 login time, see section NOTES below.

          TERM   The terminal type for which output is to be prepared.

          PAGER  The user's preferred utility to display text files.  Any
                 string acceptable as a command-string operand to the sh -c
                 command shall be valid.  If PAGER is null or is not set,
                 then applications that launch a pager will default to a
                 program such as less(1) or more(1).

          EDITOR/VISUAL
                 The user's preferred utility to edit text files.  Any
                 string acceptable as a command_string operand to the sh -c
                 command shall be valid.

          Note that the behavior of many programs and library routines is
          influenced by the presence or value of certain environment
          variables.  Examples include the following:

          *  The variables LANG, LANGUAGE, NLSPATH, LOCPATH, LC_ALL,
             LC_MESSAGES, and so on influence locale handling; see
             catopen(3), gettext(3), and locale(7).

          *  TMPDIR influences the path prefix of names created by
             tempnam(3) and other routines, and the temporary directory
             used by sort(1) and other programs.

          *  LD_LIBRARY_PATH, LD_PRELOAD, and other LD_* variables
             influence the behavior of the dynamic loader/linker.  See also
             ld.so(8).

          *  POSIXLY_CORRECT makes certain programs and library routines
             follow the prescriptions of POSIX.

          *  The behavior of malloc(3) is influenced by MALLOC_* variables.

          *  The variable HOSTALIASES gives the name of a file containing
             aliases to be used with gethostbyname(3).

          *  TZ and TZDIR give timezone information used by tzset(3) and
             through that by functions like ctime(3), localtime(3),
             mktime(3), strftime(3).  See also tzselect(8).

          *  TERMCAP gives information on how to address a given terminal
             (or gives the name of a file containing such information).

          *  COLUMNS and LINES tell applications about the window size,
             possibly overriding the actual size.

          *  PRINTER or LPDEST may specify the desired printer to use.  See
             lpr(1).


---------------------------------------------------

::

          Historically and by standard, environ must be declared in the
          user program.  However, as a (nonstandard) programmer
          convenience, environ is declared in the header file <unistd.h> if
          the _GNU_SOURCE feature test macro is defined (see
          feature_test_macros(7)).

          The prctl(2) PR_SET_MM_ENV_START and PR_SET_MM_ENV_END operations
          can be used to control the location of the process's environment.

          The HOME, LOGNAME, SHELL, and USER variables are set when the
          user is changed via a session management interface, typically by
          a program such as login(1) from a user database (such as
          passwd(5)).  (Switching to the root user using su(1) may result
          in a mixed environment where LOGNAME and USER are retained from
          old user; see the su(1) manual page.)


-------------------------------------------------

::

          Clearly there is a security risk here.  Many a system command has
          been tricked into mischief by a user who specified unusual values
          for IFS or LD_LIBRARY_PATH.

          There is also the risk of name space pollution.  Programs like
          make and autoconf allow overriding of default utility names from
          the environment with similarly named variables in all caps.  Thus
          one uses CC to select the desired C compiler (and similarly MAKE,
          AR, AS, FC, LD, LEX, RM, YACC, etc.).  However, in some
          traditional uses such an environment variable gives options for
          the program instead of a pathname.  Thus, one has MORE and LESS.
          Such usage is considered mistaken, and to be avoided in new
          programs.


---------------------------------------------------------

::

          bash(1), csh(1), env(1), login(1), printenv(1), sh(1), su(1),
          tcsh(1), execve(2), clearenv(3), exec(3), getenv(3), putenv(3),
          setenv(3), unsetenv(3), locale(7), ld.so(8), pam_env(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                     ENVIRON(7)

--------------

Pages that refer to this page: `login(1) <../man1/login.1.html>`__, 
`pcp2json(1) <../man1/pcp2json.1.html>`__, 
`pcp2template(1) <../man1/pcp2template.1.html>`__, 
`pcp2xlsx(1) <../man1/pcp2xlsx.1.html>`__, 
`pcp2xml(1) <../man1/pcp2xml.1.html>`__, 
`pcp-atopsar(1) <../man1/pcp-atopsar.1.html>`__, 
`pcp-free(1) <../man1/pcp-free.1.html>`__, 
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pcp-mpstat(1) <../man1/pcp-mpstat.1.html>`__, 
`pcp-pidstat(1) <../man1/pcp-pidstat.1.html>`__, 
`pcp-uptime(1) <../man1/pcp-uptime.1.html>`__, 
`pmchart(1) <../man1/pmchart.1.html>`__, 
`pmclient(1) <../man1/pmclient.1.html>`__, 
`pmdiff(1) <../man1/pmdiff.1.html>`__, 
`pmdumplog(1) <../man1/pmdumplog.1.html>`__, 
`pmdumptext(1) <../man1/pmdumptext.1.html>`__, 
`pmie(1) <../man1/pmie.1.html>`__, 
`pminfo(1) <../man1/pminfo.1.html>`__, 
`pmlc(1) <../man1/pmlc.1.html>`__, 
`pmlogcheck(1) <../man1/pmlogcheck.1.html>`__, 
`pmlogextract(1) <../man1/pmlogextract.1.html>`__, 
`pmloglabel(1) <../man1/pmloglabel.1.html>`__, 
`pmlogreduce(1) <../man1/pmlogreduce.1.html>`__, 
`pmlogsummary(1) <../man1/pmlogsummary.1.html>`__, 
`pmprobe(1) <../man1/pmprobe.1.html>`__, 
`pmrep(1) <../man1/pmrep.1.html>`__, 
`pmseries(1) <../man1/pmseries.1.html>`__, 
`pmstat(1) <../man1/pmstat.1.html>`__, 
`pmval(1) <../man1/pmval.1.html>`__, 
`pmview(1) <../man1/pmview.1.html>`__, 
`tset(1) <../man1/tset.1.html>`__, 
`execve(2) <../man2/execve.2.html>`__, 
`clearenv(3) <../man3/clearenv.3.html>`__, 
`exec(3) <../man3/exec.3.html>`__, 
`getenv(3) <../man3/getenv.3.html>`__, 
`intro(3) <../man3/intro.3.html>`__, 
`pmgetconfig(3) <../man3/pmgetconfig.3.html>`__, 
`pmnewcontextzone(3) <../man3/pmnewcontextzone.3.html>`__, 
`pmnewzone(3) <../man3/pmnewzone.3.html>`__, 
`putenv(3) <../man3/putenv.3.html>`__, 
`sd_bus_default(3) <../man3/sd_bus_default.3.html>`__, 
`setenv(3) <../man3/setenv.3.html>`__, 
`udev_device_new_from_syspath(3) <../man3/udev_device_new_from_syspath.3.html>`__, 
`localtime(5) <../man5/localtime.5.html>`__, 
`nfs.conf(5) <../man5/nfs.conf.5.html>`__, 
`pam_env.conf(5) <../man5/pam_env.conf.5.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`systemd-system.conf(5) <../man5/systemd-system.conf.5.html>`__, 
`file-hierarchy(7) <../man7/file-hierarchy.7.html>`__, 
`pam_env(8) <../man8/pam_env.8.html>`__

--------------

`Copyright and license for this manual
page <../man7/environ.7.license.html>`__

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
