.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lxc-user-nic(1) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LXC-USER-NIC(1)                                          LXC-USER-NIC(1)

NAME
-------------------------------------------------

::

          lxc-user-nic - Manage nics in another network namespace


---------------------------------------------------------

::

          lxc-user-niccreate lxcpath name pid type bridge container nicname

          lxc-user-nicdelete lxcpath name path to network namespace type
          bridge container nicname


---------------------------------------------------------------

::

          lxc-user-nic is a setuid-root program with which unprivileged
          users may manage network interfaces for use by a lxc container.

          It will consult the configuration file /usr/local/etc/lxc/lxc-
          usernet to determine the number of interfaces which the calling
          user is allowed to create, and which bridge they may attach them
          to. It tracks the number of interfaces each user has created
          using the file /run/lxc/nics. It ensures that the calling user is
          privileged over the network namespace to which the interface will
          be attached.  lxc-user-nic also allows one to delete network
          devices.  Currently only ovs ports can be deleted.


-------------------------------------------------------

::

          lxcpath
                 The path of the container. This is currently not used.

          name   The name of the container. This is currently not used.

          pid    The process id for the task to whose network namespace the
                 interface should be attached.

          type   The network interface type to attach. Currently only veth
                 is supported. With this type, two interfaces representing
                 each tunnel endpoint are created. One endpoint will be
                 attached to the specified bridge, while the other will be
                 passed into the container.

          bridge The bridge to which to attach the network interface, for
                 instance lxcbr0.

          container nicname
                 The desired interface name in the container. This will be
                 eth0 if unspecified.

          path to network namespace
                 A path to open to get a file descriptor for the target
                 network namespace.  This is only relevant when an veth
                 device is deleted.


---------------------------------------------------------

::

          lxc(1), lxc-start(1), lxc-usernet(5)


-----------------------------------------------------

::

          Christian Brauner <christian@brauner.io>

          Serge Hallyn <serge@hallyn.com>

          Daniel Lezcano <daniel.lezcano@free.fr>

COLOPHON
---------------------------------------------------------

::

          This page is part of the lxc (Linux containers) project.
          Information about the project can be found at 
          ⟨http://linuxcontainers.org/⟩.  If you have a bug report for this
          manual page, send it to lxc-devel@lists.linuxcontainers.org.
          This page was obtained from the project's upstream Git repository
          ⟨git://github.com/lxc/lxc⟩ on 2021-08-27.  (At that time, the
          date of the most recent commit that was found in the repository
          was 2021-08-26.)  If you discover any rendering problems in this
          HTML version of the page, or you believe there is a better or
          more up-to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

                                  2021-08-26                LXC-USER-NIC(1)

--------------

Pages that refer to this page:
`lxc-usernet(5) <../man5/lxc-usernet.5.html>`__

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
