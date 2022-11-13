.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-veritysetup-generator(8) — Linux manual page
====================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `KERNEL COMMA                     |                                   |
| ND LINE <#KERNEL_COMMAND_LINE>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-VERITYSETUP-GENERATOR(8)ritysetup-generatorITYSETUP-GENERATOR(8)

NAME
-------------------------------------------------

::

          systemd-veritysetup-generator - Unit generator for integrity
          protected block devices


---------------------------------------------------------

::

          /usr/lib/systemd/system-generators/systemd-veritysetup-generator


---------------------------------------------------------------

::

          systemd-veritysetup-generator is a generator that translates
          kernel command line options configuring integrity-protected block
          devices (verity) into native systemd units early at boot and when
          configuration of the system manager is reloaded. This will create
          systemd-veritysetup@.service(8) units as necessary.

          Currently, only a single verity device may be set up with this
          generator, backing the root file system of the OS.

          systemd-veritysetup-generator implements systemd.generator(7).


-------------------------------------------------------------------------------

::

          systemd-veritysetup-generator understands the following kernel
          command line parameters:

          systemd.verity=, rd.systemd.verity=
              Takes a boolean argument. Defaults to "yes". If "no",
              disables the generator entirely.  rd.systemd.verity= is
              honored only by the initial RAM disk (initrd) while
              systemd.verity= is honored by both the host system and the
              initrd.

          roothash=
              Takes a root hash value for the root file system. Expects a
              hash value formatted in hexadecimal characters of the
              appropriate length (i.e. most likely 256 bit/64 characters,
              or longer). If not specified via systemd.verity_root_data=
              and systemd.verity_root_hash=, the hash and data devices to
              use are automatically derived from the specified hash value.
              Specifically, the data partition device is looked for under a
              GPT partition UUID derived from the first 128bit of the root
              hash, the hash partition device is looked for under a GPT
              partition UUID derived from the last 128bit of the root hash.
              Hence it is usually sufficient to specify the root hash to
              boot from an integrity protected root file system, as device
              paths are automatically determined from it — as long as the
              partition table is properly set up.

          systemd.verity_root_data=, systemd.verity_root_hash=
              These two settings take block device paths as arguments and
              may be used to explicitly configure the data partition and
              hash partition to use for setting up the integrity protection
              for the root file system. If not specified, these paths are
              automatically derived from the roothash= argument (see
              above).

          systemd.verity_root_options=
              Takes a comma-separated list of dm-verity options. Expects
              the following options ignore-corruption,
              restart-on-corruption, ignore-zero-blocks,
              check-at-most-once, panic-on-corruption and
              root-hash-signature. See veritysetup(8) for more details.


---------------------------------------------------------

::

          systemd(1), systemd-veritysetup@.service(8), veritysetup(8),
          systemd-fstab-generator(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                             SYSTEMD-VERITYSETUP-GENERATOR(8)

--------------

Pages that refer to this page:
`veritytab(5) <../man5/veritytab.5.html>`__, 
`kernel-command-line(7) <../man7/kernel-command-line.7.html>`__, 
`systemd-veritysetup@.service(8) <../man8/systemd-veritysetup@.service.8.html>`__

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
