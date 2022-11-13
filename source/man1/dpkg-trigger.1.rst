.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dpkg-trigger(1) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   dpkg-trigger(1)                dpkg suite                dpkg-trigger(1)

NAME
-------------------------------------------------

::

          dpkg-trigger - a package trigger utility


---------------------------------------------------------

::

          dpkg-trigger [option...] trigger-name
          dpkg-trigger [option...] command


---------------------------------------------------------------

::

          dpkg-trigger is a tool to explicitly activate triggers and check
          for its support on the running dpkg.

          This can be used by maintainer scripts in complex and conditional
          situations where the file triggers, or the declarative activate
          triggers control file directive, are insufficiently rich. It can
          also be used for testing and by system administrators (but note
          that the triggers won't actually be run by dpkg-trigger).

          Unrecognized trigger name syntaxes are an error for dpkg-trigger.


---------------------------------------------------------

::

          --check-supported
                 Check if the running dpkg supports triggers (usually
                 called from a postinst). Will exit 0 if a triggers-capable
                 dpkg has run, or 1 with an error message to stderr if not.
                 Normally, however, it is better just to activate the
                 desired trigger with dpkg-trigger.

          -?, --help
                 Show the usage message and exit.

          --version
                 Show the version and exit.


-------------------------------------------------------

::

          --admindir=dir
                 Change the location of the dpkg database. The default
                 location is /usr/local/var/lib/dpkg.

          --by-package=package
                 Override trigger awaiter (normally set by dpkg through the
                 DPKG_MAINTSCRIPT_PACKAGE environment variable of the
                 maintainer scripts, naming the package to which the script
                 belongs, and this will be used by default).

          --no-await
                 This option arranges that the calling package T (if any)
                 need not await the processing of this trigger; the
                 interested package(s) I, will not be added to T's trigger
                 processing awaited list and T's status is unchanged.  T
                 may be considered installed even though I may not yet have
                 processed the trigger.

          --await
                 This option does the inverse of --no-await (since dpkg
                 1.17.21).  If the interested package has declared a
                 “noawait” directive, then this option will not be
                 effective.  It is currently the default behavior.

          --no-act
                 Just test, do not actually change anything.


---------------------------------------------------------------

::

          0      The requested action was successfully performed.  Or a
                 check or assertion command returned true.

          1      A check or assertion command returned false.

          2      Fatal or unrecoverable error due to invalid command-line
                 usage, or interactions with the system, such as accesses
                 to the database, memory allocations, etc.


---------------------------------------------------------------

::

          DPKG_ADMINDIR
                 If set and the --admindir option has not been specified,
                 it will be used as the dpkg data directory.

          DPKG_COLORS
                 Sets the color mode (since dpkg 1.18.5).  The currently
                 accepted values are: auto (default), always and never.


---------------------------------------------------------

::

          dpkg(1), deb-triggers(5),
          /usr/share/doc/dpkg-dev/triggers.txt.gz.

COLOPHON
---------------------------------------------------------

::

          This page is part of the dpkg (Debian Package Manager) project.
          Information about the project can be found at 
          ⟨https://wiki.debian.org/Teams/Dpkg/⟩.  If you have a bug report
          for this manual page, see
          ⟨http://bugs.debian.org/cgi-bin/pkgreport.cgi?src=dpkg⟩.  This
          page was obtained from the project's upstream Git repository
          ⟨https://salsa.debian.org/dpkg-team/dpkg.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-06-17.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   1.19.6-2-g6e42d5               2019-03-25                dpkg-trigger(1)

--------------

Pages that refer to this page:
`deb-triggers(5) <../man5/deb-triggers.5.html>`__

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
