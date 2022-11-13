.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cryptsetup-ssh(8) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `COPYRIGHT <#COPYRIGHT>`__ \|  |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CRYPTSETUP-SSH(8)         Maintenance Commands         CRYPTSETUP-SSH(8)

NAME
-------------------------------------------------

::

          cryptsetup-ssh - manage LUKS2 SSH token


---------------------------------------------------------

::

          cryptsetup-ssh <options> <action> <action args>


---------------------------------------------------------------

::

          Experimental cryptsetup plugin for unlocking LUKS2 devices with
          token connected to an SSH server.

          This plugin currently allows only adding a token to an existing
          key slot, see cryptsetup(8) for instruction on how to remove,
          import or export the token.

      Add operation
          add <options> <device>

                 Adds the SSH token to <device>.

                 Specified SSH server must contain a key file on the
                 specified path with a passphrase for an existing key slot
                 on the device.  Provided credentials will be used by
                 cryptsetup to get the password when opening the device
                 using the token.

                 --ssh-server, --ssh-user, --ssh-keypath and --ssh-path are
                 required for this operation.

          --key-slot=NUM
                 Keyslot to assign the token to. If not specified, the
                 token will be assigned to the first key slot matching
                 provided passphrase.

          --ssh-keypath=STRING
                 Path to the SSH key for connecting to the remote server.

          --ssh-path=STRING
                 Path to the key file on the remote server.

          --ssh-server=STRING
                 IP address/URL of the remote server for this token.

          --ssh-user=STRING
                 Username used for the remote server.


-------------------------------------------------------

::

          --debug
                 Show debug messages

          --debug-json
                 Show debug messages including JSON metadata

          -v, --verbose
                 Shows more detailed error messages

          -?, --help
                 Show help

          -V, --version
                 Print program version


---------------------------------------------------

::

          The information provided when adding the token (SSH server
          address, user and paths) will be stored in the LUKS2 header in
          plaintext.


---------------------------------------------------------------------

::

          Report bugs, including ones in the documentation, on the
          cryptsetup mailing list at <dm-crypt@saout.de> or in the 'Issues'
          section on LUKS website.  Please attach the output of the failed
          command with the --debug option added.


-----------------------------------------------------------

::

          Copyright © 2016-2021 Red Hat, Inc.
          Copyright © 2016-2021 Milan Broz
          Copyright © 2021 Vojtech Trefny

          This is free software; see the source for copying conditions.
          There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR
          A PARTICULAR PURPOSE.


---------------------------------------------------------

::

          The project website at https://gitlab.com/cryptsetup/cryptsetup 

COLOPHON
---------------------------------------------------------

::

          This page is part of the Cryptsetup ((open-source disk
          encryption)) project.  Information about the project can be found
          at ⟨https://gitlab.com/cryptsetup/cryptsetup⟩.  If you have a bug
          report for this manual page, send it to dm-crypt@saout.de.  This
          page was obtained from the project's upstream Git repository
          ⟨https://gitlab.com/cryptsetup/cryptsetup.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-25.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   cryptsetup-ssh                  June 2021              CRYPTSETUP-SSH(8)

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
