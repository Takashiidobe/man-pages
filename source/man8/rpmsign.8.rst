.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rpmsign(8) — Linux manual page
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

   RPMSIGN(8)                                                    RPMSIGN(8)

NAME
-------------------------------------------------

::

          rpmsign - RPM Package Signing


---------------------------------------------------------

::

      SIGNING PACKAGES:
          rpm --addsign|--resign [rpmsign-options] PACKAGE_FILE ...

          rpm --delsign PACKAGE_FILE ...

          rpm --delfilesign PACKAGE_FILE ...

      rpmsign-options
          [--rpmv3] [--fskpath KEY] [--signfiles]


---------------------------------------------------------------

::

          Both of the --addsign and --resign options generate and insert
          new signatures for each package PACKAGE_FILE given, replacing any
          existing signatures.  There are two options for historical
          reasons, there is no difference in behavior currently.

          To create a signature rpm needs to verify the package's checksum.
          As a result packages with a MD5/SHA1 checksums cannot be signed
          in FIPS mode.

          rpm --delsign PACKAGE_FILE ...

          Delete all signatures from each package PACKAGE_FILE given.

          rpm --delfilesign PACKAGE_FILE ...

          Delete all IMA and fsverity file signatures from each package
          PACKAGE_FILE given.

      SIGN OPTIONS
          --rpmv3
                 Force RPM V3 header+payload signature addition.  These are
                 expensive and redundant baggage on packages where a
                 separate payload digest exists (packages built with rpm >=
                 4.14).  Rpm will automatically detect the need for V3
                 signatures, but this option can be used to force their
                 creation if the packages must be fully signature
                 verifiable with rpm < 4.14 or other interoperability
                 reasons.

          --fskpath KEY
                 Used with --signfiles, use file signing key Key.

          --certpath CERT
                 Used with --signverity, use file signing certificate Cert.

          --verityalgo ALG
                 Used with --signverity, to specify the signing algorithm.
                 sha256 and sha512 are supported, with sha256 being the
                 default if this argument is not specified.  This can also
                 be specified with the macro %_verity_algorithm

          --signfiles
                 Sign package files.  The macro
                 %_binary_filedigest_algorithm must be set to a supported
                 algorithm before building the package.  The supported
                 algorithms are SHA1, SHA256, SHA384, and SHA512, which are
                 represented as 2, 8, 9, and 10 respectively.  The file
                 signing key (RSA private key) must be set before signing
                 the package, it can be configured on the command line with
                 --fskpath or the macro %_file_signing_key.

          --signverity
                 Sign package files with fsverity signatures.  The file
                 signing key (RSA private key) and the signing certificate
                 must be set before signing the package.  The key can be
                 configured on the command line with --fskpath or the macro
                 %_file_signing_key, and the cert can be configured on the
                 command line with --certpath or the macro
                 %_file_signing_cert.

      USING GPG TO SIGN PACKAGES
          In order to sign packages using GPG, rpm must be configured to
          run GPG and be able to find a key ring with the appropriate keys.
          By default, rpm uses the same conventions as GPG to find key
          rings, namely the $GNUPGHOME environment variable.  If your key
          rings are not located where GPG expects them to be, you will need
          to configure the macro %_gpg_path to be the location of the GPG
          key rings to use.  If you want to be able to sign packages you
          create yourself, you also need to create your own public and
          secret key pair (see the GPG manual).  You will also need to
          configure the rpm macros

          %_gpg_name
                 The name of the "user" whose key you wish to use to sign
                 your packages.

          For example, to be able to use GPG to sign packages as the user
          "John Doe <jdoe@foo.com>" from the key rings located in
          /etc/rpm/.gpg using the executable /usr/bin/gpg you would include

                 %_gpg_path /etc/rpm/.gpg
                 %_gpg_name John Doe <jdoe@foo.com>
                 %__gpg /usr/bin/gpg

          in a macro configuration file.  Use /etc/rpm/macros for per-
          system configuration and ~/.rpmmacros for per-user configuration.
          Typically it's sufficient to set just %_gpg_name.


---------------------------------------------------------

::

                 popt(3),
                 rpm(8),
                 rpmdb(8),
                 rpmkeys(8),
                 rpm2cpio(8),
                 rpmbuild(8),
                 rpmspec(8),

          rpmsign --help - as rpm supports customizing the options via popt
          aliases it's impossible to guarantee that what's described in the
          manual matches what's available.

          http://www.rpm.org/ <URL:http://www.rpm.org/>


-------------------------------------------------------

::

                 Marc Ewing <marc@redhat.com>
                 Jeff Johnson <jbj@redhat.com>
                 Erik Troan <ewt@redhat.com>
                 Panu Matilainen <pmatilai@redhat.com>
                 Fionnuala Gunter <fin@linux.vnet.ibm.com>
                 Jes Sorensen <jsorensen@fb.com>

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

                                 Red Hat, Inc                    RPMSIGN(8)

--------------

Pages that refer to this page: `rpm(8) <../man8/rpm.8.html>`__, 
`rpmbuild(8) <../man8/rpmbuild.8.html>`__, 
`rpmdb(8) <../man8/rpmdb.8.html>`__, 
`rpmkeys(8) <../man8/rpmkeys.8.html>`__, 
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
