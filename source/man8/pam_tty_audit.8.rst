.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_tty_audit(8) — Linux manual page
====================================

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
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_TTY_AUDIT(8)            Linux-PAM Manual            PAM_TTY_AUDIT(8)

NAME
-------------------------------------------------

::

          pam_tty_audit - Enable or disable TTY auditing for specified
          users


---------------------------------------------------------

::

          pam_tty_audit.so [disable=patterns] [enable=patterns]


---------------------------------------------------------------

::

          The pam_tty_audit PAM module is used to enable or disable TTY
          auditing. By default, the kernel does not audit input on any TTY.


-------------------------------------------------------

::

          disable=patterns
              For each user matching one of comma-separated glob patterns,
              disable TTY auditing. This overrides any previous enable
              option matching the same user name on the command line.

          enable=patterns
              For each user matching one of comma-separated glob patterns,
              enable TTY auditing. This overrides any previous disable
              option matching the same user name on the command line.

          open_only
              Set the TTY audit flag when opening the session, but do not
              restore it when closing the session. Using this option is
              necessary for some services that don't fork() to run the
              authenticated session, such as sudo.

          log_passwd
              Log keystrokes when ECHO mode is off but ICANON mode is
              active. This is the mode in which the tty is placed during
              password entry. By default, passwords are not logged. This
              option may not be available on older kernels (3.9?).


-----------------------------------------------------------------------------------

::

          Only the session type is supported.


-------------------------------------------------------------------

::

          PAM_SESSION_ERR
              Error reading or modifying the TTY audit flag. See the system
              log for more details.

          PAM_SUCCESS
              Success.


---------------------------------------------------

::

          When TTY auditing is enabled, it is inherited by all processes
          started by that user. In particular, daemons restarted by an user
          will still have TTY auditing enabled, and audit TTY input even by
          other users unless auditing for these users is explicitly
          disabled. Therefore, it is recommended to use disable=* as the
          first option for most daemons using PAM.

          To view the data that was logged by the kernel to audit use the
          command aureport --tty.


---------------------------------------------------------

::

          Audit all administrative actions.

              session   required pam_tty_audit.so disable=* enable=root


---------------------------------------------------------

::

          aureport(8), pam.conf(5), pam.d(5), pam(8)


-----------------------------------------------------

::

          pam_tty_audit was written by Miloslav Trmač <mitr@redhat.com>.
          The log_passwd option was added by Richard Guy Briggs
          <rgb@redhat.com>.

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

   Linux-PAM Manual               04/11/2016               PAM_TTY_AUDIT(8)

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
