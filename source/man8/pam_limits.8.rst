.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_limits(8) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `MODULE TYPES PRO                 |                                   |
| VIDED <#MODULE_TYPES_PROVIDED>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| RETURN VALUES <#RETURN_VALUES>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_LIMITS(8)               Linux-PAM Manual               PAM_LIMITS(8)

NAME
-------------------------------------------------

::

          pam_limits - PAM module to limit resources


---------------------------------------------------------

::

          pam_limits.so [conf=/path/to/limits.conf] [debug] [set_all]
                        [utmp_early] [noaudit]


---------------------------------------------------------------

::

          The pam_limits PAM module sets limits on the system resources
          that can be obtained in a user-session. Users of uid=0 are
          affected by this limits, too.

          By default limits are taken from the /etc/security/limits.conf
          config file. Then individual *.conf files from the
          /etc/security/limits.d/ directory are read. The files are parsed
          one after another in the order of "C" locale. The effect of the
          individual files is the same as if all the files were
          concatenated together in the order of parsing. If a config file
          is explicitly specified with a module option then the files in
          the above directory are not parsed.

          The module must not be called by a multithreaded application.

          If Linux PAM is compiled with audit support the module will
          report when it denies access based on limit of maximum number of
          concurrent login sessions.


-------------------------------------------------------

::

          conf=/path/to/limits.conf
              Indicate an alternative limits.conf style configuration file
              to override the default.

          debug
              Print debug information.

          set_all
              Set the limits for which no value is specified in the
              configuration file to the one from the process with the PID
              1.

          utmp_early
              Some broken applications actually allocate a utmp entry for
              the user before the user is admitted to the system. If some
              of the services you are configuring PAM for do this, you can
              selectively use this module argument to compensate for this
              behavior and at the same time maintain system-wide
              consistency with a single limits.conf file.

          noaudit
              Do not report exceeded maximum logins count to the audit
              subsystem.


-----------------------------------------------------------------------------------

::

          Only the session module type is provided.


-------------------------------------------------------------------

::

          PAM_ABORT
              Cannot get current limits.

          PAM_IGNORE
              No limits found for this user.

          PAM_PERM_DENIED
              New limits could not be set.

          PAM_SERVICE_ERR
              Cannot read config file.

          PAM_SESSION_ERR
              Error recovering account name.

          PAM_SUCCESS
              Limits were changed.

          PAM_USER_UNKNOWN
              The user is not known to the system.


---------------------------------------------------

::

          /etc/security/limits.conf
              Default configuration file


---------------------------------------------------------

::

          For the services you need resources limits (login for example)
          put a the following line in /etc/pam.d/login as the last line for
          that service (usually after the pam_unix session line):

              #%PAM-1.0
              #
              # Resource limits imposed on login sessions via pam_limits
              #
              session  required  pam_limits.so

          Replace "login" for each service you are using this module.


---------------------------------------------------------

::

          limits.conf(5), pam.d(5), pam(8).


-------------------------------------------------------

::

          pam_limits was initially written by Cristian Gafton
          <gafton@redhat.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the linux-pam (Pluggable Authentication
          Modules for Linux) project.  Information about the project can be
          found at ⟨http://www.linux-pam.org/⟩.  If you have a bug report
          for this manual page, see ⟨//www.linux-pam.org/⟩.  This page was
          obtained from the tarball Linux-PAM-1.3.0.tar.bz2 fetched from
          ⟨http://www.linux-pam.org/library/⟩ on 2021-08-27.  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   Linux-PAM Manual               04/01/2016                  PAM_LIMITS(8)

--------------

Pages that refer to this page:
`limits.conf(5) <../man5/limits.conf.5.html>`__

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
