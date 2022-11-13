.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lpoptions(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   lpoptions(1)                   Apple Inc.                   lpoptions(1)

NAME
-------------------------------------------------

::

          lpoptions - display or set printer options and defaults


---------------------------------------------------------

::

          lpoptions [ -E ] [ -h server[:port] ] -d destination[/instance] [
          -l ]
          lpoptions [ -E ] [ -h server[:port] ] [ -p destination[/instance]
          ] -o option[=value] ...
          lpoptions [ -E ] [ -h server[:port] ] [ -p destination[/instance]
          ] -r option
          lpoptions [ -E ] [ -h server[:port] ] -x destination[/instance]


---------------------------------------------------------------

::

          lpoptions displays or sets printer options and defaults.  If no
          printer is specified using the -p option, the default printer is
          used as described in lp(1).

          If no -l, -o, or -r options are specified, the current options
          are reported on the standard output.

          Options set with the lpoptions command are used by the lp(1) and
          lpr(1) commands when submitting jobs.

          When run by the root user, lpoptions gets and sets default
          options and instances for all users in the /etc/cups/lpoptions
          file.  Otherwise, the per-user defaults are managed in the
          ~/.cups/lpoptions file.


-------------------------------------------------------

::

          lpoptions supports the following options:

          -E   Enables encryption when communicating with the CUPS server.

          -d destination[/instance]
               Sets the user default printer to destination.  If instance
               is supplied then that particular instance is used.  This
               option overrides the system default printer for the current
               user.

          -h server[:port]
               Uses an alternate server.

          -l   Lists the printer specific options and their current
               settings.

          -o option[=value]
               Specifies a new option for the named destination.

          -p destination[/instance]
               Sets the destination and instance, if specified, for any
               options that follow.  If the named instance does not exist
               then it is created.  Destinations can only be created using
               the lpadmin(8) program.

          -r option
               Removes the specified option from the named destination.

          -x destination[/instance]
               Removes the options for the named destination and instance,
               if specified.  If the named instance does not exist then
               this does nothing.  Destinations can only be removed using
               the lpadmin(8) command.


---------------------------------------------------

::

          ~/.cups/lpoptions - user defaults and instances created by non-
          root users.
          /etc/cups/lpoptions - system-wide defaults and instances created
          by the root user.


-------------------------------------------------------------------

::

          The lpoptions command is unique to CUPS.


---------------------------------------------------------

::

          cancel(1), lp(1), lpadmin(8), lpr(1), lprm(1), CUPS Online Help
          (http://localhost:631/help)


-----------------------------------------------------------

::

          Copyright © 2007-2019 by Apple Inc.

COLOPHON
---------------------------------------------------------

::

          This page is part of the CUPS (a standards-based, open source
          printing system) project.  Information about the project can be
          found at ⟨http://www.cups.org/⟩.  If you have a bug report for
          this manual page, see ⟨http://www.cups.org/⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/apple/cups⟩ on 2021-08-27.  (At that time,
          the date of the most recent commit that was found in the
          repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   26 April 2019                     CUPS                      lpoptions(1)

--------------

Pages that refer to this page: `cups(1) <../man1/cups.1.html>`__, 
`lp(1) <../man1/lp.1.html>`__,  `lpr(1) <../man1/lpr.1.html>`__, 
`lpadmin(8) <../man8/lpadmin.8.html>`__

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
