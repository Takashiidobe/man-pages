.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

misc_conv(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `STANDARDS <#STANDARDS>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MISC_CONV(3)                Linux-PAM Manual                MISC_CONV(3)

NAME
-------------------------------------------------

::

          misc_conv - text based conversation function


---------------------------------------------------------

::

          #include <security/pam_misc.h>

          int misc_conv(int num_msg, const struct pam_message **msgm,
                        struct pam_response **response, void *appdata_ptr);


---------------------------------------------------------------

::

          The misc_conv function is part of libpam_misc and not of the
          standard libpam library. This function will prompt the user with
          the appropriate comments and obtain the appropriate inputs as
          directed by authentication modules.

          In addition to simply slotting into the appropriate pam_conv(3),
          this function provides some time-out facilities. The function
          exports five variables that can be used by an application
          programmer to limit the amount of time this conversation function
          will spend waiting for the user to type something. The five
          variabls are as follows:

          time_t pam_misc_conv_warn_time;
              This variable contains the time (as returned by time(2)) that
              the user should be first warned that the clock is ticking. By
              default it has the value 0, which indicates that no such
              warning will be given. The application may set its value to
              sometime in the future, but this should be done prior to
              passing control to the Linux-PAM library.

          const char *pam_misc_conv_warn_line;
              Used in conjuction with pam_misc_conv_warn_time, this
              variable is a pointer to the string that will be displayed
              when it becomes time to warn the user that the timeout is
              approaching. Its default value is a translated version of
              “...Time is running out...”, but this can be changed by the
              application prior to passing control to Linux-PAM.

          time_t pam_misc_conv_die_time;
              This variable contains the time (as returned by time(2)) that
              the will time out. By default it has the value 0, which
              indicates that the conversation function will not timeout.
              The application may set its value to sometime in the future,
              but this should be done prior to passing control to the
              Linux-PAM library.

          const char *pam_misc_conv_die_line;
              Used in conjuction with pam_misc_conv_die_time, this variable
              is a pointer to the string that will be displayed when the
              conversation times out. Its default value is a translated
              version of “...Sorry, your time is up!”, but this can be
              changed by the application prior to passing control to
              Linux-PAM.

          int pam_misc_conv_died;
              Following a return from the Linux-PAM libraray, the value of
              this variable indicates whether the conversation has timed
              out. A value of 1 indicates the time-out occurred.

          The following two function pointers are available for supporting
          binary prompts in the conversation function. They are optimized
          for the current incarnation of the libpamc library and are
          subject to change.

          int (*pam_binary_handler_fn)(void *appdata, pamc_bp_t *prompt_p);
              This function pointer is initialized to NULL but can be
              filled with a function that provides machine-machine (hidden)
              message exchange. It is intended for use with hidden
              authentication protocols such as RSA or Diffie-Hellman key
              exchanges. (This is still under development.)

          int (*pam_binary_handler_free)(void *appdata, pamc_bp_t
          *delete_me);
              This function pointer is initialized to
              PAM_BP_RENEW(delete_me, 0, 0), but can be redefined as
              desired by the application.


---------------------------------------------------------

::

          pam_conv(3), pam(8)


-----------------------------------------------------------

::

          The misc_conv function is part of the libpam_misc Library and not
          defined in any standard.

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

   Linux-PAM Manual               04/01/2016                   MISC_CONV(3)

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
