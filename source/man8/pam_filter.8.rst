.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_filter(8) — Linux manual page
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
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_FILTER(8)               Linux-PAM Manual               PAM_FILTER(8)

NAME
-------------------------------------------------

::

          pam_filter - PAM filter module


---------------------------------------------------------

::

          pam_filter.so [debug] [new_term] [non_term] run1|run2 filter
                        [...]


---------------------------------------------------------------

::

          This module is intended to be a platform for providing access to
          all of the input/output that passes between the user and the
          application. It is only suitable for tty-based and (stdin/stdout)
          applications.

          To function this module requires filters to be installed on the
          system. The single filter provided with the module simply
          transposes upper and lower case letters in the input and output
          streams. (This can be very annoying and is not kind to termcap
          based editors).

          Each component of the module has the potential to invoke the
          desired filter. The filter is always execv(2) with the privilege
          of the calling application and not that of the user. For this
          reason it cannot usually be killed by the user without closing
          their session.


-------------------------------------------------------

::

          debug
              Print debug information.

          new_term
              The default action of the filter is to set the PAM_TTY item
              to indicate the terminal that the user is using to connect to
              the application. This argument indicates that the filter
              should set PAM_TTY to the filtered pseudo-terminal.

          non_term
              don't try to set the PAM_TTY item.

          runX
              In order that the module can invoke a filter it should know
              when to invoke it. This argument is required to tell the
              filter when to do this.

              Permitted values for X are 1 and 2. These indicate the
              precise time that the filter is to be run. To understand this
              concept it will be useful to have read the pam(3) manual
              page. Basically, for each management group there are up to
              two ways of calling the module's functions. In the case of
              the authentication and session components there are actually
              two separate functions. For the case of authentication, these
              functions are pam_authenticate(3) and pam_setcred(3), here
              run1 means run the filter from the pam_authenticate function
              and run2 means run the filter from pam_setcred. In the case
              of the session modules, run1 implies that the filter is
              invoked at the pam_open_session(3) stage, and run2 for
              pam_close_session(3).

              For the case of the account component. Either run1 or run2
              may be used.

              For the case of the password component, run1 is used to
              indicate that the filter is run on the first occasion of
              pam_chauthtok(3) (the PAM_PRELIM_CHECK phase) and run2 is
              used to indicate that the filter is run on the second
              occasion (the PAM_UPDATE_AUTHTOK phase).

          filter
              The full pathname of the filter to be run and any command
              line arguments that the filter might expect.


-----------------------------------------------------------------------------------

::

          All module types (auth, account, password and session) are
          provided.


-------------------------------------------------------------------

::

          PAM_SUCCESS
              The new filter was set successfully.

          PAM_ABORT
              Critical error, immediate abort.


---------------------------------------------------------

::

          Add the following line to /etc/pam.d/login to see how to
          configure login to transpose upper and lower case letters once
          the user has logged in:

                      session required pam_filter.so run1 /lib/security/pam_filter/upperLOWER


---------------------------------------------------------

::

          pam.conf(5), pam.d(5), pam(8)


-----------------------------------------------------

::

          pam_filter was written by Andrew G. Morgan <morgan@kernel.org>.

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

   Linux-PAM Manual               04/01/2016                  PAM_FILTER(8)

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
