.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

moduli(5) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `STANDARDS <#STANDARDS>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MODULI(5)                BSD File Formats Manual               MODULI(5)

NAME
-------------------------------------------------

::

        moduli — Diffie-Hellman moduli


---------------------------------------------------------------

::

        The /etc/moduli file contains prime numbers and generators for use
        by sshd(8) in the Diffie-Hellman Group Exchange key exchange
        method.

        New moduli may be generated with ssh-keygen(1) using a two-step
        process.  An initial candidate generation pass, using ssh-keygen
        -G, calculates numbers that are likely to be useful.  A second
        primality testing pass, using ssh-keygen -T, provides a high degree
        of assurance that the numbers are prime and are safe for use in
        Diffie-Hellman operations by sshd(8).  This moduli format is used
        as the output from each pass.

        The file consists of newline-separated records, one per modulus,
        containing seven space-separated fields.  These fields are as
        follows:

              timestamp    The time that the modulus was last processed as
                           YYYYMMDDHHMMSS.

              type         Decimal number specifying the internal structure
                           of the prime modulus.  Supported types are:

                           0     Unknown, not tested.
                           2     "Safe" prime; (p-1)/2 is also prime.
                           4     Sophie Germain; 2p+1 is also prime.

                           Moduli candidates initially produced by
                           ssh-keygen(1) are Sophie Germain primes (type
                           4).  Further primality testing with
                           ssh-keygen(1) produces safe prime moduli (type
                           2) that are ready for use in sshd(8).  Other
                           types are not used by OpenSSH.

              tests        Decimal number indicating the type of primality
                           tests that the number has been subjected to
                           represented as a bitmask of the following
                           values:

                           0x00  Not tested.
                           0x01  Composite number – not prime.
                           0x02  Sieve of Eratosthenes.
                           0x04  Probabilistic Miller-Rabin primality
                                 tests.

                           The ssh-keygen(1) moduli candidate generation
                           uses the Sieve of Eratosthenes (flag 0x02).
                           Subsequent ssh-keygen(1) primality tests are
                           Miller-Rabin tests (flag 0x04).

              trials       Decimal number indicating the number of
                           primality trials that have been performed on the
                           modulus.

              size         Decimal number indicating the size of the prime
                           in bits.

              generator    The recommended generator for use with this
                           modulus (hexadecimal).

              modulus      The modulus itself in hexadecimal.

        When performing Diffie-Hellman Group Exchange, sshd(8) first
        estimates the size of the modulus required to produce enough
        Diffie-Hellman output to sufficiently key the selected symmetric
        cipher.  sshd(8) then randomly selects a modulus from /etc/moduli
        that best meets the size requirement.


---------------------------------------------------------

::

        ssh-keygen(1), sshd(8)


-----------------------------------------------------------

::

        M. Friedl, N. Provos, and W. Simpson, Diffie-Hellman Group Exchange
        for the Secure Shell (SSH) Transport Layer Protocol, RFC 4419,
        March 2006 2006.

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

   BSD                        September 26, 2012                        BSD

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
