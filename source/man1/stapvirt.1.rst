.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stapvirt(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `TUTORIAL <#TUTORIAL>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STAPVIRT(1)              General Commands Manual             STAPVIRT(1)

NAME
-------------------------------------------------

::

          stapvirt - prepare libvirt domains for systemtap probing


---------------------------------------------------------

::

          stapvirt [-c URI] [-d PATH] [-v] COMMAND ARGUMENTS


---------------------------------------------------------------

::

          The stapvirt program can be used to add ports to domains managed
          by libvirt (see <http://libvirt.org/>).  These ports can then be
          used by stap to run scripts inside the domains (see the
          '--remote' option in stap(1) for more information).

          Ports are added to the definition of the domain using the port-
          add command.  These ports can later be removed using the port-
          remove command.  Note that there can only be as many simultaneous
          stap sessions as there are ports.

          Starting from libvirt v1.1.1 and QEMU v0.10.0, SystemTap ports
          can be hotplugged and thus do not need to be added first using
          the port-add command.  However, you need to ensure that there is
          a virtio-serial controller in place so that hotplugged ports can
          be connected. If creating a domain using virt-install, you can do
          this by adding this option:

                 $ virt-install [...] --controller=virtio-serial

          If the domain has already been created, you can simply do port-
          add followed immediately by port-remove, and then power off and
          restart the domain. The port will be removed, but the controller
          will remain.


-------------------------------------------------------

::

          The following options are supported. Any other option prints a
          short help message.

          -c URI Specify the libvirt driver URI to which to connect (e.g.
                 'qemu:///system'). The default value is NULL, which
                 indicates to libvirt to connect to the default driver. See
                 the page at <http://libvirt.org/uri.html> for supported
                 values.

          -d PATH
                 Specify the directory in which UNIX sockets should be
                 created when SystemTap ports are added. The default
                 directory is '/var/lib/libvirt/qemu'.

          -v     Increase verbosity. This option may be repeated for more
                 verbosity.


---------------------------------------------------------

::

          The following commands are recognized by stapvirt. Any other
          command prints a short help message.

          help   Display the help message.

          list   List available domains.

          port-add DOMAIN
                 Add a permanent SystemTap port to the domain's definition.
                 If the domain is currently running, it must be powered off
                 before changes take effect.

          port-list DOMAIN
                 List the UNIX socket paths of the permanent SystemTap
                 ports in the domain's definition.

          port-remove DOMAIN
                 Remove a permanent SystemTap port from the domain's
                 definition. If the domain is currently running, it must be
                 powered off before changes take effect.

          query DOMAIN
                 Display the following information about the domain: its
                 name, its UUID, its state, the number of permanent
                 SystemTap ports installed, and whether hotplugging is
                 supported.


---------------------------------------------------------

::

          This tutorial will help you get started with stapvirt. Let's
          start by listing all the privileged domains on the machine with
          the list command:

                 $ stapvirt -c 'qemu:///system' list
                 Available domains on URI 'qemu:///system':
                 ID      State     Type        Name
                 2       running   persistent  TestVM

          Note that we specified the libvirt URI using the -c switch.
          Otherwise libvirt might have defaulted to e.g. 'qemu:///session'.

          Rather than typing the URI everytime, it might be easier to
          instead set the LIBVIRT_DEFAULT_URI environment variable and omit
          the -c switch. Note that this is a libvirt functionality (see
          <libvirt.org/uri.html> for more details).

          The list command indicates that we have a running domain named
          'TestVM' with ID 2. Let's use the query command to retrieve more
          information:

                 $ stapvirt query TestVM # by name
                 $ stapvirt query 2      # by ID

                               Name:  TestVM
                               UUID:  905951c0-fa4f-409b-079c-c91ddda27028
                              State:  running
                                 ID:  2
                               Type:  persistent
                    Permanent Ports:  0
                        Hotplugging:  not supported

          The query command gives us some basic information about the
          domain, such as its name, UUID, and state. More importantly, it
          gives us two pieces of information: the number of permanent ports
          installed, and whether hotplugging is supported.  Technically,
          hotplugging support depends on libvirt and qemu, and is not
          related to the domain in itself.

          If hotplugging were supported, we could stop here and run stap
          directly (assuming we have a virtio-serial controller already in
          place, see DESCRIPTION). Since in our case hotplugging is not
          supported, we need to add SystemTap ports. To do this, we use the
          port-add command:

                 $ stapvirt port-add TestVM
                 Added new port org.systemtap.stapsh.0
                 The domain must be powered off before changes take effect.

          We can confirm that a port was added by running the query command
          again:

                 $ stapvirt query TestVM
                 ...
                    Permanent Ports:  1
                        Hotplugging:  not supported

          It now indicates that there is 1 permanent port. We can also use
          the port-list command to know exactly where the port will be
          created:

                 $ stapvirt port-list TestVM
                 /var/lib/libvirt/qemu/TestVM.org.systemtap.stapsh.0.sock

          After powering off and restarting the domain, we are now ready to
          use the port with stap:

                 $ stap -e 'probe begin { printf("Hello from TestVM!\n"); exit() }' \
                        --remote=libvirt://TestVM
                 Hello from TestVM!

          Finally, if we'd like to remove the port, we can use the port-
          remove command:

                 $ stapvirt port-remove TestVM
                 Removed port org.systemtap.stapsh.0
                 The domain must be powered off before changes take effect.

          And that's all there is to it!


---------------------------------------------------------

::

          stap(1),
          virt-install(1)


-------------------------------------------------

::

          Use the Bugzilla link of the project web page or our mailing
          list.
          http://sourceware.org/systemtap/ ,<systemtap@sourceware.org>.

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemtap (a tracing and live-system
          analysis tool) project.  Information about the project can be
          found at ⟨https://sourceware.org/systemtap/⟩.  If you have a bug
          report for this manual page, send it to systemtap@sourceware.org.
          This page was obtained from the project's upstream Git repository
          ⟨git://sourceware.org/git/systemtap.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                                                STAPVIRT(1)

--------------

Pages that refer to this page: `stap(1) <../man1/stap.1.html>`__

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
