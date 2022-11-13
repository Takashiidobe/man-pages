.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ssh-keysign(8) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SSH-KEYSIGN(8)         BSD System Manager's Manual        SSH-KEYSIGN(8)

NAME
-------------------------------------------------

::

        ssh-keysign — OpenSSH helper for host-based authentication


---------------------------------------------------------

::

        ssh-keysign


---------------------------------------------------------------

::

        ssh-keysign is used by ssh(1) to access the local host keys and
        generate the digital signature required during host-based
        authentication.

        ssh-keysign is disabled by default and can only be enabled in the
        global client configuration file /etc/ssh/ssh_config by setting
        EnableSSHKeysign to “yes”.

        ssh-keysign is not intended to be invoked by the user, but from
        ssh(1).  See ssh(1) and sshd(8) for more information about host-
        based authentication.


---------------------------------------------------

::

        /etc/ssh/ssh_config
                Controls whether ssh-keysign is enabled.

        /etc/ssh/ssh_host_dsa_key
        /etc/ssh/ssh_host_ecdsa_key
        /etc/ssh/ssh_host_ed25519_key
        /etc/ssh/ssh_host_rsa_key
                These files contain the private parts of the host keys used
                to generate the digital signature.  They should be owned by
                root, readable only by root, and not accessible to others.
                Since they are readable only by root, ssh-keysign must be
                set-uid root if host-based authentication is used.

        /etc/ssh/ssh_host_dsa_key-cert.pub
        /etc/ssh/ssh_host_ecdsa_key-cert.pub
        /etc/ssh/ssh_host_ed25519_key-cert.pub
        /etc/ssh/ssh_host_rsa_key-cert.pub
                If these files exist they are assumed to contain public
                certificate information corresponding with the private keys
                above.


---------------------------------------------------------

::

        ssh(1), ssh-keygen(1), ssh_config(5), sshd(8)


-------------------------------------------------------

::

        ssh-keysign first appeared in OpenBSD 3.2.


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
