.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-random-seed.service(8) — Linux manual page
==================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-RANDOM-SEED.SERVICE(8)-random-seed.serviceRANDOM-SEED.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-random-seed.service, systemd-random-seed - Load and save
          the system random seed at boot and shutdown


---------------------------------------------------------

::

          systemd-random-seed.service

          /usr/lib/systemd/random-seed


---------------------------------------------------------------

::

          systemd-random-seed.service is a service that loads an on-disk
          random seed into the kernel entropy pool during boot and saves it
          at shutdown. See random(4) for details. By default, no entropy is
          credited when the random seed is written into the kernel entropy
          pool, but this may be changed with $SYSTEMD_RANDOM_SEED_CREDIT,
          see below. On disk the random seed is stored in
          /var/lib/systemd/random-seed.

          Note that this service runs relatively late during the early boot
          phase, i.e. generally after the initial RAM disk (initrd)
          completed its work, and the /var/ file system has been mounted
          writable. Many system services require entropy much earlier than
          this — this service is hence of limited use for complex system.
          It is recommended to use a boot loader that can pass an initial
          random seed to the kernel to ensure that entropy is available
          from earliest boot on, for example systemd-boot(7), with its
          bootctl random-seed functionality.

          When loading the random seed from disk, the file is immediately
          updated with a new seed retrieved from the kernel, in order to
          ensure no two boots operate with the same random seed. This new
          seed is retrieved synchronously from the kernel, which means the
          service will not complete start-up until the random pool is fully
          initialized. On entropy-starved systems this may take a while.
          This functionality is intended to be used as synchronization
          point for ordering services that require an initialized entropy
          pool to function securely (i.e. services that access /dev/urandom
          without any further precautions).

          Care should be taken when creating OS images that are replicated
          to multiple systems: if the random seed file is included
          unmodified each system will initialize its entropy pool with the
          same data, and thus — if otherwise entropy-starved — generate the
          same or at least guessable random seed streams. As a safety
          precaution crediting entropy is thus disabled by default. It is
          recommended to remove the random seed from OS images intended for
          replication on multiple systems, in which case it is safe to
          enable entropy crediting, see below.

          See Random Seeds[1] for further information.


---------------------------------------------------------------

::

          $SYSTEMD_RANDOM_SEED_CREDIT
              By default, systemd-random-seed.service does not credit any
              entropy when loading the random seed. With this option this
              behaviour may be changed: it either takes a boolean parameter
              or the special string "force". Defaults to false, in which
              case no entropy is credited. If true, entropy is credited if
              the random seed file and system state pass various
              superficial concisistency checks. If set to "force" entropy
              is credited, regardless of these checks, as long as the
              random seed file exists.


---------------------------------------------------------

::

          systemd(1), random(4), systemd-boot(7), bootctl(4)


---------------------------------------------------

::

           1. Random Seeds
              https://systemd.io/RANDOM_SEEDS

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

   systemd 249                               SYSTEMD-RANDOM-SEED.SERVICE(8)

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
