.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pam_fail_delay(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RATIONALE <#RATIONALE>`__ \|     |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `                                 |                                   |
| RETURN VALUES <#RETURN_VALUES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `STANDARDS <#STANDARDS>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PAM_FAIL_DELAY(3)           Linux-PAM Manual           PAM_FAIL_DELAY(3)

NAME
-------------------------------------------------

::

          pam_fail_delay - request a delay on failure


---------------------------------------------------------

::

          #include <security/pam_appl.h>

          int pam_fail_delay(pam_handle_t *pamh, unsigned int usec);


---------------------------------------------------------------

::

          The pam_fail_delay function provides a mechanism by which an
          application or module can suggest a minimum delay of usec
          micro-seconds. The function keeps a record of the longest time
          requested with this function. Should pam_authenticate(3) fail,
          the failing return to the application is delayed by an amount of
          time randomly distributed (by up to 50%) about this longest
          value.

          Independent of success, the delay time is reset to its zero
          default value when the PAM service module returns control to the
          application. The delay occurs after all authentication modules
          have been called, but before control is returned to the service
          application.

          When using this function the programmer should check if it is
          available with:

              #ifdef HAVE_PAM_FAIL_DELAY
                  ....
              #endif /* HAVE_PAM_FAIL_DELAY */

          For applications written with a single thread that are event
          driven in nature, generating this delay may be undesirable.
          Instead, the application may want to register the delay in some
          other way. For example, in a single threaded server that serves
          multiple authentication requests from a single event loop, the
          application might want to simply mark a given connection as
          blocked until an application timer expires. For this reason the
          delay function can be changed with the PAM_FAIL_DELAY item. It
          can be queried and set with pam_get_item(3) and pam_set_item (3)
          respectively. The value used to set it should be a function
          pointer of the following prototype:

              void (*delay_fn)(int retval, unsigned usec_delay, void *appdata_ptr);

          The arguments being the retval return code of the module stack,
          the usec_delay micro-second delay that libpam is requesting and
          the appdata_ptr that the application has associated with the
          current pamh. This last value was set by the application when it
          called pam_start(3) or explicitly with pam_set_item(3). Note, if
          PAM_FAIL_DELAY item is unset (or set to NULL), then no delay will
          be performed.


-----------------------------------------------------------

::

          It is often possible to attack an authentication scheme by
          exploiting the time it takes the scheme to deny access to an
          applicant user. In cases of short timeouts, it may prove possible
          to attempt a brute force dictionary attack -- with an automated
          process, the attacker tries all possible passwords to gain access
          to the system. In other cases, where individual failures can take
          measurable amounts of time (indicating the nature of the
          failure), an attacker can obtain useful information about the
          authentication process. These latter attacks make use of
          procedural delays that constitute a covert channel of useful
          information.

          To minimize the effectiveness of such attacks, it is desirable to
          introduce a random delay in a failed authentication process.
          Preferable this value should be set by the application or a
          special PAM module. Standard PAM modules should not modify the
          delay unconditional.


-------------------------------------------------------

::

          For example, a login application may require a failure delay of
          roughly 3 seconds. It will contain the following code:

                  pam_fail_delay (pamh, 3000000 /* micro-seconds */ );
                  pam_authenticate (pamh, 0);

          if the modules do not request a delay, the failure delay will be
          between 2.25 and 3.75 seconds.

          However, the modules, invoked in the authentication process, may
          also request delays:

              module #1:    pam_fail_delay (pamh, 2000000);
              module #2:    pam_fail_delay (pamh, 4000000);

          in this case, it is the largest requested value that is used to
          compute the actual failed delay: here between 3 and 5 seconds.


-------------------------------------------------------------------

::

          PAM_SUCCESS
              Delay was successful adjusted.

          PAM_SYSTEM_ERR
              A NULL pointer was submitted as PAM handle.


---------------------------------------------------------

::

          pam_start(3), pam_get_item(3), pam_strerror(3)


-----------------------------------------------------------

::

          The pam_fail_delay function is an Linux-PAM extension.

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

   Linux-PAM Manual               04/01/2016              PAM_FAIL_DELAY(3)

--------------

Pages that refer to this page:
`pam_get_item(3) <../man3/pam_get_item.3.html>`__, 
`pam_set_item(3) <../man3/pam_set_item.3.html>`__, 
`pam_faildelay(8) <../man8/pam_faildelay.8.html>`__

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
