.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-machine-id-setup(1) — Linux manual page
===============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-MACHINE-ID-SETUP(1)temd-machine-id-setupTEMD-MACHINE-ID-SETUP(1)

NAME
-------------------------------------------------

::

          systemd-machine-id-setup - Initialize the machine ID in
          /etc/machine-id


---------------------------------------------------------

::

          systemd-machine-id-setup


---------------------------------------------------------------

::

          systemd-machine-id-setup may be used by system installer tools to
          initialize the machine ID stored in /etc/machine-id at install
          time, with a provisioned or randomly generated ID. See
          machine-id(5) for more information about this file.

          If the tool is invoked without the --commit switch,
          /etc/machine-id is initialized with a valid, new machined ID if
          it is missing or empty. The new machine ID will be acquired in
          the following fashion:

           1. If a valid D-Bus machine ID is already configured for the
              system, the D-Bus machine ID is copied and used to initialize
              the machine ID in /etc/machine-id.

           2. If run inside a KVM virtual machine and a UUID is configured
              (via the -uuid option), this UUID is used to initialize the
              machine ID. The caller must ensure that the UUID passed is
              sufficiently unique and is different for every booted
              instance of the VM.

           3. Similarly, if run inside a Linux container environment and a
              UUID is configured for the container, this is used to
              initialize the machine ID. For details, see the documentation
              of the Container Interface[1].

           4. Otherwise, a new ID is randomly generated.

          The --commit switch may be used to commit a transient machined ID
          to disk, making it persistent. For details, see below.

          Use systemd-firstboot(1) to initialize the machine ID on mounted
          (but not booted) system images.


-------------------------------------------------------

::

          The following options are understood:

          --root=path
              Takes a directory path as argument. All paths operated on
              will be prefixed with the given alternate root path,
              including the path for /etc/machine-id itself.

          --image=path
              Takes a path to a device node or regular file as argument.
              This is similar to --root= as described above, but operates
              on a disk image instead of a directory tree.

          --commit
              Commit a transient machine ID to disk. This command may be
              used to convert a transient machine ID into a persistent one.
              A transient machine ID file is one that was bind mounted from
              a memory file system (usually "tmpfs") to /etc/machine-id
              during the early phase of the boot process. This may happen
              because /etc/ is initially read-only and was missing a valid
              machine ID file at that point.

              This command will execute no operation if /etc/machine-id is
              not mounted from a memory file system, or if /etc/ is
              read-only. The command will write the current transient
              machine ID to disk and unmount the /etc/machine-id mount
              point in a race-free manner to ensure that this file is
              always valid and accessible for other processes.

              This command is primarily used by the
              systemd-machine-id-commit.service(8) early boot service.

          --print
              Print the machine ID generated or committed after the
              operation is complete.

          -h, --help
              Print a short help text and exit.

          --version
              Print a short version string and exit.


---------------------------------------------------------------

::

          On success, 0 is returned, a non-zero failure code otherwise.


---------------------------------------------------------

::

          systemd(1), machine-id(5), systemd-machine-id-commit.service(8),
          dbus-uuidgen(1), systemd-firstboot(1)


---------------------------------------------------

::

           1. Container Interface
              https://systemd.io/CONTAINER_INTERFACE

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

   systemd 249                                  SYSTEMD-MACHINE-ID-SETUP(1)

--------------

Pages that refer to this page:
`systemd-firstboot(1) <../man1/systemd-firstboot.1.html>`__, 
`machine-id(5) <../man5/machine-id.5.html>`__, 
`lvmsystemid(7) <../man7/lvmsystemid.7.html>`__, 
`systemd-machine-id-commit.service(8) <../man8/systemd-machine-id-commit.service.8.html>`__

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
