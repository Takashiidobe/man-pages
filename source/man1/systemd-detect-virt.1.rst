.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-detect-virt(1) — Linux manual page
==========================================

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

   SYSTEMD-DETECT-VIRT(1)     systemd-detect-virt    SYSTEMD-DETECT-VIRT(1)

NAME
-------------------------------------------------

::

          systemd-detect-virt - Detect execution in a virtualized
          environment


---------------------------------------------------------

::

          systemd-detect-virt [OPTIONS...]


---------------------------------------------------------------

::

          systemd-detect-virt detects execution in a virtualized
          environment. It identifies the virtualization technology and can
          distinguish full machine virtualization from container
          virtualization.  systemd-detect-virt exits with a return value of
          0 (success) if a virtualization technology is detected, and
          non-zero (error) otherwise. By default, any type of
          virtualization is detected, and the options --container and --vm
          can be used to limit what types of virtualization are detected.

          When executed without --quiet will print a short identifier for
          the detected virtualization technology. The following
          technologies are currently identified:

          Table 1. Known virtualization technologies (both VM, i.e. full
          hardware virtualization, and container, i.e. shared kernel
          virtualization)
          ┌──────────┬────────────────────┬────────────────────┐
          │Type      │ ID                 │ Product            │
          ├──────────┼────────────────────┼────────────────────┤
          │VM        │ qemu               │ QEMU software      │
          │          │                    │ virtualization,    │
          │          │                    │ without KVM        │
          │          ├────────────────────┼────────────────────┤
          │          │ kvm                │ Linux KVM kernel   │
          │          │                    │ virtual machine,   │
          │          │                    │ in combination     │
          │          │                    │ with QEMU. Not     │
          │          │                    │ used for other     │
          │          │                    │ virtualizers using │
          │          │                    │ the KVM            │
          │          │                    │ interfaces, such   │
          │          │                    │ as Oracle          │
          │          │                    │ VirtualBox or      │
          │          │                    │ Amazon EC2 Nitro,  │
          │          │                    │ see below.         │
          │          ├────────────────────┼────────────────────┤
          │          │ amazon             │ Amazon EC2 Nitro   │
          │          │                    │ using Linux KVM    │
          │          ├────────────────────┼────────────────────┤
          │          │ zvm                │ s390 z/VM          │
          │          ├────────────────────┼────────────────────┤
          │          │ vmware             │ VMware Workstation │
          │          │                    │ or Server, and     │
          │          │                    │ related products   │
          │          ├────────────────────┼────────────────────┤
          │          │ microsoft          │ Hyper-V, also      │
          │          │                    │ known as Viridian  │
          │          │                    │ or Windows Server  │
          │          │                    │ Virtualization     │
          │          ├────────────────────┼────────────────────┤
          │          │ oracle             │ Oracle VM          │
          │          │                    │ VirtualBox         │
          │          │                    │ (historically      │
          │          │                    │ marketed by        │
          │          │                    │ innotek and Sun    │
          │          │                    │ Microsystems), for │
          │          │                    │ legacy and KVM     │
          │          │                    │ hypervisor         │
          │          ├────────────────────┼────────────────────┤
          │          │ powervm            │ IBM PowerVM        │
          │          │                    │ hypervisor — comes │
          │          │                    │ as firmware with   │
          │          │                    │ some IBM POWER     │
          │          │                    │ servers            │
          │          ├────────────────────┼────────────────────┤
          │          │ xen                │ Xen hypervisor     │
          │          │                    │ (only domU, not    │
          │          │                    │ dom0)              │
          │          ├────────────────────┼────────────────────┤
          │          │ bochs              │ Bochs Emulator     │
          │          ├────────────────────┼────────────────────┤
          │          │ uml                │ User-mode Linux    │
          │          ├────────────────────┼────────────────────┤
          │          │ parallels          │ Parallels Desktop, │
          │          │                    │ Parallels Server   │
          │          ├────────────────────┼────────────────────┤
          │          │ bhyve              │ bhyve, FreeBSD     │
          │          │                    │ hypervisor         │
          │          ├────────────────────┼────────────────────┤
          │          │ qnx                │ QNX hypervisor     │
          ├──────────┼────────────────────┼────────────────────┤
          │acrn      │ ACRN hypervisor[1] │                    │
          ├──────────┼────────────────────┼────────────────────┤
          │Container │ openvz             │ OpenVZ/Virtuozzo   │
          │          ├────────────────────┼────────────────────┤
          │          │ lxc                │ Linux container    │
          │          │                    │ implementation by  │
          │          │                    │ LXC                │
          │          ├────────────────────┼────────────────────┤
          │          │ lxc-libvirt        │ Linux container    │
          │          │                    │ implementation by  │
          │          │                    │ libvirt            │
          │          ├────────────────────┼────────────────────┤
          │          │ systemd-nspawn     │ systemd's minimal  │
          │          │                    │ container          │
          │          │                    │ implementation,    │
          │          │                    │ see                │
          │          │                    │ systemd-nspawn(1)  │
          │          ├────────────────────┼────────────────────┤
          │          │ docker             │ Docker container   │
          │          │                    │ manager            │
          │          ├────────────────────┼────────────────────┤
          │          │ podman             │ Podman[2]          │
          │          │                    │ container manager  │
          │          ├────────────────────┼────────────────────┤
          │          │ rkt                │ rkt app container  │
          │          │                    │ runtime            │
          │          ├────────────────────┼────────────────────┤
          │          │ wsl                │ Windows Subsystem  │
          │          │                    │ for Linux[3]       │
          │          ├────────────────────┼────────────────────┤
          │          │ proot              │ proot[4] userspace │
          │          │                    │ chroot/bind mount  │
          │          │                    │ emulation          │
          │          ├────────────────────┼────────────────────┤
          │          │ pouch              │ Pouch[5] Container │
          │          │                    │ Engine             │
          └──────────┴────────────────────┴────────────────────┘

          If multiple virtualization solutions are used, only the
          "innermost" is detected and identified. That means if both
          machine and container virtualization are used in conjunction,
          only the latter will be identified (unless --vm is passed).

          Windows Subsystem for Linux is not a Linux container, but an
          environment for running Linux userspace applications on top of
          the Windows kernel using a Linux-compatible interface. WSL is
          categorized as a container for practical purposes. Multiple WSL
          environments share the same kernel and services should generally
          behave like when being run in a container.


-------------------------------------------------------

::

          The following options are understood:

          -c, --container
              Only detects container virtualization (i.e. shared kernel
              virtualization).

          -v, --vm
              Only detects hardware virtualization.

          -r, --chroot
              Detect whether invoked in a chroot(2) environment. In this
              mode, no output is written, but the return value indicates
              whether the process was invoked in a chroot() environment or
              not.

          --private-users
              Detect whether invoked in a user namespace. In this mode, no
              output is written, but the return value indicates whether the
              process was invoked inside of a user namespace or not. See
              user_namespaces(7) for more information.

          -q, --quiet
              Suppress output of the virtualization technology identifier.

          --list
              Output all currently known and detectable container and VM
              environments.

          -h, --help
              Print a short help text and exit.

          --version
              Print a short version string and exit.


---------------------------------------------------------------

::

          If a virtualization technology is detected, 0 is returned, a
          non-zero code otherwise.


---------------------------------------------------------

::

          systemd(1), systemd-nspawn(1), chroot(2), namespaces(7)


---------------------------------------------------

::

           1. ACRN hypervisor
              https://projectacrn.org

           2. Podman
              https://podman.io

           3. Windows Subsystem for Linux
              https://docs.microsoft.com/en-us/windows/wsl/about

           4. proot
              https://proot-me.github.io/

           5. Pouch
              https://github.com/alibaba/pouch

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

   systemd 249                                       SYSTEMD-DETECT-VIRT(1)

--------------

Pages that refer to this page:
`org.freedesktop.systemd1(5) <../man5/org.freedesktop.systemd1.5.html>`__, 
`systemd.unit(5) <../man5/systemd.unit.5.html>`__, 
`udev(7) <../man7/udev.7.html>`__

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
