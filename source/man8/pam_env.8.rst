.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_env(8) — Linux manual page
==============================

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
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_ENV(8)                  Linux-PAM Manual                  PAM_ENV(8)

NAME
-------------------------------------------------

::

          pam_env - PAM module to set/unset environment variables


---------------------------------------------------------

::

          pam_env.so [debug] [conffile=conf-file] [envfile=env-file]
                     [readenv=0|1] [user_envfile=env-file]
                     [user_readenv=0|1]


---------------------------------------------------------------

::

          The pam_env PAM module allows the (un)setting of environment
          variables. Supported is the use of previously set environment
          variables as well as PAM_ITEMs such as PAM_RHOST.

          By default rules for (un)setting of variables are taken from the
          config file /etc/security/pam_env.conf. An alternate file can be
          specified with the conffile option.

          Second a file (/etc/environment by default) with simple KEY=VAL
          pairs on separate lines will be read. With the envfile option an
          alternate file can be specified. And with the readenv option this
          can be completly disabled.

          Third it will read a user configuration file
          ($HOME/.pam_environment by default). The default file file can be
          changed with the user_envfile option and it can be turned on and
          off with the user_readenv option.

          Since setting of PAM environment variables can have side effects
          to other modules, this module should be the last one on the
          stack.


-------------------------------------------------------

::

          conffile=/path/to/pam_env.conf
              Indicate an alternative pam_env.conf style configuration file
              to override the default. This can be useful when different
              services need different environments.

          debug
              A lot of debug information is printed with syslog(3).

          envfile=/path/to/environment
              Indicate an alternative environment file to override the
              default. The syntax are simple KEY=VAL pairs on separate
              lines. The export instruction can be specified for bash
              compatibility, but will be ignored. This can be useful when
              different services need different environments.

          readenv=0|1
              Turns on or off the reading of the file specified by envfile
              (0 is off, 1 is on). By default this option is on.

          user_envfile=filename
              Indicate an alternative .pam_environment file to override the
              default.The syntax is the same as for /etc/environment. The
              filename is relative to the user home directory. This can be
              useful when different services need different environments.

          user_readenv=0|1
              Turns on or off the reading of the user specific environment
              file. 0 is off, 1 is on. By default this option is on.


-----------------------------------------------------------------------------------

::

          The auth and session module types are provided.


-------------------------------------------------------------------

::

          PAM_ABORT
              Not all relevant data or options could be gotten.

          PAM_BUF_ERR
              Memory buffer error.

          PAM_IGNORE
              No pam_env.conf and environment file was found.

          PAM_SUCCESS
              Environment variables were set.


---------------------------------------------------

::

          /etc/security/pam_env.conf
              Default configuration file

          /etc/environment
              Default environment file

          $HOME/.pam_environment
              User specific environment file


---------------------------------------------------------

::

          pam_env.conf(5), pam.d(5), pam(8), environ(7).


-----------------------------------------------------

::

          pam_env was written by Dave Kinchlea <kinch@kinch.ark.com>.

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

   Linux-PAM Manual               04/01/2016                     PAM_ENV(8)

--------------

Pages that refer to this page: `runuser(1) <../man1/runuser.1.html>`__, 
`su(1) <../man1/su.1.html>`__, 
`pam_env.conf(5) <../man5/pam_env.conf.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`environ(7) <../man7/environ.7.html>`__

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
