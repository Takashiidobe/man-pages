.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_exec(8) — Linux manual page
===============================

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
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_EXEC(8)                 Linux-PAM Manual                 PAM_EXEC(8)

NAME
-------------------------------------------------

::

          pam_exec - PAM module which calls an external command


---------------------------------------------------------

::

          pam_exec.so [debug] [expose_authtok] [seteuid] [quiet] [stdout]
                      [log=file] [type=type] command [...]


---------------------------------------------------------------

::

          pam_exec is a PAM module that can be used to run an external
          command.

          The child's environment is set to the current PAM environment
          list, as returned by pam_getenvlist(3) In addition, the following
          PAM items are exported as environment variables: PAM_RHOST,
          PAM_RUSER, PAM_SERVICE, PAM_TTY, PAM_USER and PAM_TYPE, which
          contains one of the module types: account, auth, password,
          open_session and close_session.

          Commands called by pam_exec need to be aware of that the user can
          have controll over the environment.


-------------------------------------------------------

::

          debug
              Print debug information.

          expose_authtok
              During authentication the calling command can read the
              password from stdin(3). Only first PAM_MAX_RESP_SIZE bytes of
              a password are provided to the command.

          log=file
              The output of the command is appended to file

          type=type
              Only run the command if the module type matches the given
              type.

          stdout
              Per default the output of the executed command is written to
              /dev/null. With this option, the stdout output of the
              executed command is redirected to the calling application.
              It's in the responsibility of this application what happens
              with the output. The log option is ignored.

          quiet
              Per default pam_exec.so will echo the exit status of the
              external command if it fails. Specifying this option will
              suppress the message.

          seteuid
              Per default pam_exec.so will execute the external command
              with the real user ID of the calling process. Specifying this
              option means the command is run with the effective user ID.


-----------------------------------------------------------------------------------

::

          All module types (auth, account, password and session) are
          provided.


-------------------------------------------------------------------

::

          PAM_SUCCESS
              The external command was run successfully.

          PAM_SERVICE_ERR
              No argument or a wrong number of arguments were given.

          PAM_SYSTEM_ERR
              A system error occurred or the command to execute failed.

          PAM_IGNORE
              pam_setcred was called, which does not execute the command.
              Or, the value given for the type= parameter did not match the
              module type.


---------------------------------------------------------

::

          Add the following line to /etc/pam.d/passwd to rebuild the NIS
          database after each local password change:

                      password optional pam_exec.so seteuid /usr/bin/make -C /var/yp

          This will execute the command

              make -C /var/yp

          with effective user ID.


---------------------------------------------------------

::

          pam.conf(5), pam.d(5), pam(8)


-----------------------------------------------------

::

          pam_exec was written by Thorsten Kukuk <kukuk@thkukuk.de> and
          Josh Triplett <josh@joshtriplett.org>.

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

   Linux-PAM Manual               04/01/2016                    PAM_EXEC(8)

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
