.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_access(8) — Linux manual page
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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_ACCESS(8)               Linux-PAM Manual               PAM_ACCESS(8)

NAME
-------------------------------------------------

::

          pam_access - PAM module for logdaemon style login access control


---------------------------------------------------------

::

          pam_access.so [debug] [nodefgroup] [noaudit] [accessfile=file]
                        [fieldsep=sep] [listsep=sep]


---------------------------------------------------------------

::

          The pam_access PAM module is mainly for access management. It
          provides logdaemon style login access control based on login
          names, host or domain names, internet addresses or network
          numbers, or on terminal line names, X $DISPLAY values, or PAM
          service names in case of non-networked logins.

          By default rules for access management are taken from config file
          /etc/security/access.conf if you don't specify another file.

          If Linux PAM is compiled with audit support the module will
          report when it denies access based on origin (host, tty, etc.).


-------------------------------------------------------

::

          accessfile=/path/to/access.conf
              Indicate an alternative access.conf style configuration file
              to override the default. This can be useful when different
              services need different access lists.

          debug
              A lot of debug information is printed with syslog(3).

          noaudit
              Do not report logins from disallowed hosts and ttys to the
              audit subsystem.

          fieldsep=separators
              This option modifies the field separator character that
              pam_access will recognize when parsing the access
              configuration file. For example: fieldsep=| will cause the
              default `:' character to be treated as part of a field value
              and `|' becomes the field separator. Doing this may be useful
              in conjunction with a system that wants to use pam_access
              with X based applications, since the PAM_TTY item is likely
              to be of the form "hostname:0" which includes a `:' character
              in its value. But you should not need this.

          listsep=separators
              This option modifies the list separator character that
              pam_access will recognize when parsing the access
              configuration file. For example: listsep=, will cause the
              default ` ' (space) and `\t' (tab) characters to be treated
              as part of a list element value and `,' becomes the only list
              element separator. Doing this may be useful on a system with
              group information obtained from a Windows domain, where the
              default built-in groups "Domain Users", "Domain Admins"
              contain a space.

          nodefgroup
              User tokens which are not enclosed in parentheses will not be
              matched against the group database. The backwards compatible
              default is to try the group database match even for tokens
              not enclosed in parentheses.


-----------------------------------------------------------------------------------

::

          All module types (auth, account, password and session) are
          provided.


-------------------------------------------------------------------

::

          PAM_SUCCESS
              Access was granted.

          PAM_PERM_DENIED
              Access was not granted.

          PAM_IGNORE
              pam_setcred was called which does nothing.

          PAM_ABORT
              Not all relevant data or options could be gotten.

          PAM_USER_UNKNOWN
              The user is not known to the system.


---------------------------------------------------

::

          /etc/security/access.conf
              Default configuration file


---------------------------------------------------------

::

          access.conf(5), pam.d(5), pam(8).


-------------------------------------------------------

::

          The logdaemon style login access control scheme was designed and
          implemented by Wietse Venema. The pam_access PAM module was
          developed by Alexei Nogin <alexei@nogin.dnttm.ru>. The IPv6
          support and the network(address) / netmask feature was developed
          and provided by Mike Becher <mike.becher@lrz-muenchen.de>.

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

   Linux-PAM Manual               04/01/2016                  PAM_ACCESS(8)

--------------

Pages that refer to this page:
`access.conf(5) <../man5/access.conf.5.html>`__

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
