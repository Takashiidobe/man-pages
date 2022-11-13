.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ssh-pkcs11-helper(8) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SSH-PKCS11-HELPER(8)   BSD System Manager's Manual  SSH-PKCS11-HELPER(8)

NAME
-------------------------------------------------

::

        ssh-pkcs11-helper — OpenSSH helper for PKCS#11 support


---------------------------------------------------------

::

        ssh-pkcs11-helper [-v]


---------------------------------------------------------------

::

        ssh-pkcs11-helper is used by ssh-agent(1) to access keys provided
        by a PKCS#11 token.

        ssh-pkcs11-helper is not intended to be invoked by the user, but
        from ssh-agent(1).

        A single option is supported:

        -v      Verbose mode.  Causes ssh-pkcs11-helper to print debugging
                messages about its progress.  This is helpful in debugging
                problems.  Multiple -v options increase the verbosity.  The
                maximum is 3.

                Note that ssh-agent(1) will automatically pass the -v flag
                to ssh-pkcs11-helper when it has itself been placed in
                debug mode.


---------------------------------------------------------

::

        ssh(1), ssh-add(1), ssh-agent(1)


-------------------------------------------------------

::

        ssh-pkcs11-helper first appeared in OpenBSD 4.7.


-------------------------------------------------------

::

        Markus Friedl <markus@openbsd.org>

COLOPHON
---------------------------------------------------------

::

        This page is part of the openssh (Portable OpenSSH) project.
        Information about the project can be found at
        http://www.openssh.com/portable.html.  If you have a bug report for
        this manual page, see ⟨http://www.openssh.com/report.html⟩.  This
        page was obtained from the tarball openssh-8.7p1.tar.gz fetched
        from ⟨http://ftp.eu.openbsd.org/pub/OpenBSD/OpenSSH/portable/⟩ on
        2021-08-27.  If you discover any rendering problems in this HTML
        version of the page, or you believe there is a better or more up-
        to-date source for the page, or you have corrections or
        improvements to the information in this COLOPHON (which is not part
        of the original manual page), send a mail to man-pages@man7.org

   BSD                         November 30, 2019                        BSD

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
