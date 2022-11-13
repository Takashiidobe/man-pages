.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sandbox(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SANDBOX(8)                    User Commands                   SANDBOX(8)

NAME
-------------------------------------------------

::

          sandbox - Run cmd under an SELinux sandbox


---------------------------------------------------------

::

          sandbox [-C] [-s] [ -d DPI ] [-l level ] [[-M | -X]  -H homedir
          -T tempdir ] [-I includefile ] [ -W windowmanager ] [ -w
          windowsize ] [[-i file ]...] [ -t type ] cmd

          sandbox [-C] [-s] [ -d DPI ] [-l level ] [[-M | -X]  -H homedir
          -T tempdir ] [-I includefile ] [ -W windowmanager ] [ -w
          windowsize ] [[-i file ]...] [ -t type ] -S


---------------------------------------------------------------

::

          Run the cmd application within a tightly confined SELinux domain.
          The default sandbox domain only allows applications the ability
          to read and write stdin, stdout and any other file descriptors
          handed to it. It is not allowed to open any other files.  The -M
          option will mount an alternate homedir and tmpdir to be used by
          the sandbox.

          If you have the policycoreutils-sandbox package installed, you
          can use the -X option and the -M option.  sandbox -X allows you
          to run X applications within a sandbox.  These applications will
          start up their own X Server and create a temporary home directory
          and /tmp.  The default SELinux policy does not allow any
          capabilities or network access.  It also prevents all access to
          the users other processes and files.  Files specified on the
          command that are in the home directory or /tmp will be copied
          into the sandbox directories.

          If directories are specified with -H or -T the directory will
          have its context modified with chcon(1) unless a level is
          specified with -l.  If the MLS/MCS security level is specified,
          the user is responsible to set the correct labels.

          -h --help
                 display usage message

          -H --homedir
                 Use alternate homedir to mount over your home directory.
                 Defaults to temporary. Requires -X or -M.

          -i --include
                 Copy this file into the appropriate temporary sandbox
                 directory. Command can be repeated.

          -I --includefile
                 Copy all files listed in inputfile into the appropriate
                 temporary sandbox directories.

          -l --level
                 Specify the MLS/MCS Security Level to run the sandbox
                 with.  Defaults to random.

          -M --mount
                 Create a Sandbox with temporary files for $HOME and /tmp.

          -s --shred
                 Shred temporary files created in $HOME and /tmp, before
                 deleting.

          -t --type
                 Use alternate sandbox type, defaults to sandbox_t or
                 sandbox_x_t for -X.

                 Examples:
                 sandbox_t -    No X, No Network Access, No Open,
                 read/write on passed in file descriptors.
                 sandbox_min_t  -    No Network Access
                 sandbox_x_t    -    Ports for X applications to run
                 locally
                 sandbox_web_t  -    Ports required for web browsing
                 sandbox_net_t  -         Network ports (for server
                 software)
                 sandbox_net_client_t     -    All network ports

          -T --tmpdir
                 Use alternate temporary directory to mount on /tmp.
                 Defaults to tmpfs. Requires -X or -M.

          -S --session
                 Run a full desktop session, Requires level, and home and
                 tmpdir.

          -w --windowsize

                 Specifies the windowsize when creating an X based Sandbox.
                 The default windowsize is 1000x700.

          -W --windowmanager
                 Select alternative window manager to run within sandbox
                 -X.  Default to /usr/bin/openbox.

          -X     Create an X based Sandbox for gui apps, temporary files
                 for $HOME and /tmp, secondary Xserver, defaults to
                 sandbox_x_t

          -d --dpi
                 Set the DPI value for the sandbox X Server. Defaults to
                 the current X Sever DPI.

          -C --capabilities Use capabilities within the
                 sandbox. By default applications executed within the
                 sandbox will not be allowed to use capabilities (setuid
                 apps), with the -C flag, you can use programs requiring
                 capabilities.


---------------------------------------------------------

::

          runcon(1),
                 seunshare(8), selinux(8)


-----------------------------------------------------

::

          This manual page was written by Dan Walsh <dwalsh@redhat.com> and
          Thomas Liu <tliu@fedoraproject.org>

COLOPHON
---------------------------------------------------------

::

          This page is part of the selinux (Security-Enhanced Linux user-
          space libraries and tools) project.  Information about the
          project can be found at 
          ⟨https://github.com/SELinuxProject/selinux/wiki⟩.  If you have a
          bug report for this manual page, see
          ⟨https://github.com/SELinuxProject/selinux/wiki/Contributing⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/SELinuxProject/selinux⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-23.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   sandbox                         May 2010                      SANDBOX(8)

--------------

Pages that refer to this page: `sandbox(5) <../man5/sandbox.5.html>`__, 
`seunshare(8) <../man8/seunshare.8.html>`__

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
