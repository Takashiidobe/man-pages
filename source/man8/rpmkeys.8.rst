.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rpmkeys(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RPMKEYS(8)                                                    RPMKEYS(8)

NAME
-------------------------------------------------

::

          rpmkeys - RPM Keyring


---------------------------------------------------------

::

          rpmkeys {--import|--checksig}


---------------------------------------------------------------

::

          The general forms of rpm digital signature commands are

          rpmkeys --import PUBKEY ...

          rpmkeys {-K|--checksig} PACKAGE_FILE ...

          The --checksig option checks all the digests and signatures
          contained in PACKAGE_FILE to ensure the integrity and origin of
          the package.  Note that signatures are now verified whenever a
          package is read, and --checksig is useful to verify all of the
          digests and signatures associated with a package.

          Digital signatures cannot be verified without a public key.  An
          ASCII armored public key can be added to the rpm database using
          --import.  An imported public key is carried in a header, and key
          ring management is performed exactly like package management.
          For example, all currently imported public keys can be displayed
          by:

          rpm -qa gpg-pubkey*

          Details about a specific public key, when imported, can be
          displayed by querying.  Here's information about the Red Hat
          GPG/DSA key:

          rpm -qi gpg-pubkey-db42a60e

          Finally, public keys can be erased after importing just like
          packages.  Here's how to remove the Red Hat GPG/DSA key

          rpm -e gpg-pubkey-db42a60e


---------------------------------------------------------

::

                 popt(3),
                 rpm(8),
                 rpmdb(8),
                 rpmsign(8),
                 rpm2cpio(8),
                 rpmbuild(8),
                 rpmspec(8),

          rpmkeys --help - as rpm supports customizing the options via popt
          aliases it's impossible to guarantee that what's described in the
          manual matches what's available.

          http://www.rpm.org/ <URL:http://www.rpm.org/>


-------------------------------------------------------

::

                 Marc Ewing <marc@redhat.com>
                 Jeff Johnson <jbj@redhat.com>
                 Erik Troan <ewt@redhat.com>
                 Panu Matilainen <pmatilai@redhat.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the rpm (RPM Package Manager) project.
          Information about the project can be found at 
          ⟨https://github.com/rpm-software-management/rpm⟩.  It is not known
          how to report bugs for this man page; if you know, please send a
          mail to man-pages@man7.org.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/rpm-software-management/rpm.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-25.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                29 October 2010                  RPMKEYS(8)

--------------

Pages that refer to this page: `rpm(8) <../man8/rpm.8.html>`__, 
`rpmbuild(8) <../man8/rpmbuild.8.html>`__, 
`rpmdb(8) <../man8/rpmdb.8.html>`__, 
`rpmsign(8) <../man8/rpmsign.8.html>`__, 
`rpmspec(8) <../man8/rpmspec.8.html>`__

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
