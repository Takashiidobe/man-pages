.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setlogmask(3) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SETLOGMASK(3)           Linux Programmer's Manual          SETLOGMASK(3)

NAME
-------------------------------------------------

::

          setlogmask - set log priority mask


---------------------------------------------------------

::

          #include <syslog.h>

          int setlogmask(int mask);


---------------------------------------------------------------

::

          A process has a log priority mask that determines which calls to
          syslog(3) may be logged.  All other calls will be ignored.
          Logging is enabled for the priorities that have the corresponding
          bit set in mask.  The initial mask is such that logging is
          enabled for all priorities.

          The setlogmask() function sets this logmask for the calling
          process, and returns the previous mask.  If the mask argument is
          0, the current logmask is not modified.

          The eight priorities are LOG_EMERG, LOG_ALERT, LOG_CRIT, LOG_ERR,
          LOG_WARNING, LOG_NOTICE, LOG_INFO, and LOG_DEBUG.  The bit
          corresponding to a priority p is LOG_MASK(p).  Some systems also
          provide a macro LOG_UPTO(p) for the mask of all priorities in the
          above list up to and including p.


-----------------------------------------------------------------

::

          This function returns the previous log priority mask.


-----------------------------------------------------

::

          None.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────┬───────────────┬────────────────────────┐
          │Interface              │ Attribute     │ Value                  │
          ├───────────────────────┼───────────────┼────────────────────────┤
          │setlogmask()           │ Thread safety │ MT-Unsafe race:LogMask │
          └───────────────────────┴───────────────┴────────────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.

          LOG_UPTO() will be included in the next release of the POSIX
          specification (Issue 8).


---------------------------------------------------------

::

          closelog(3), openlog(3), syslog(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                  SETLOGMASK(3)

--------------

Pages that refer to this page: `syslog(3) <../man3/syslog.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/setlogmask.3.license.html>`__

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
