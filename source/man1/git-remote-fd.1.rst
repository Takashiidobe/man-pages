.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-remote-fd(1) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-REMOTE-FD(1)               Git Manual               GIT-REMOTE-FD(1)

NAME
-------------------------------------------------

::

          git-remote-fd - Reflect smart transport stream back to caller


---------------------------------------------------------

::

          "fd::<infd>[,<outfd>][/<anything>]" (as URL)


---------------------------------------------------------------

::

          This helper uses specified file descriptors to connect to a
          remote Git server. This is not meant for end users but for
          programs and scripts calling git fetch, push or archive.

          If only <infd> is given, it is assumed to be a bidirectional
          socket connected to remote Git server (git-upload-pack,
          git-receive-pack or git-upload-archive). If both <infd> and
          <outfd> are given, they are assumed to be pipes connected to a
          remote Git server (<infd> being the inbound pipe and <outfd>
          being the outbound pipe.

          It is assumed that any handshaking procedures have already been
          completed (such as sending service request for git://) before
          this helper is started.

          <anything> can be any string. It is ignored. It is meant for
          providing information to user in the URL in case that URL is
          displayed in some context.


-----------------------------------------------------------------------------------

::

          GIT_TRANSLOOP_DEBUG
              If set, prints debugging information about various
              reads/writes.


---------------------------------------------------------

::

          git fetch fd::17 master
              Fetch master, using file descriptor #17 to communicate with
              git-upload-pack.

          git fetch fd::17/foo master
              Same as above.

          git push fd::7,8 master (as URL)
              Push master, using file descriptor #7 to read data from
              git-receive-pack and file descriptor #8 to write data to same
              service.

          git push fd::7,8/bar master
              Same as above.


---------------------------------------------------------

::

          gitremote-helpers(7)


-----------------------------------------------

::

          Part of the git(1) suite

COLOPHON
---------------------------------------------------------

::

          This page is part of the git (Git distributed version control
          system) project.  Information about the project can be found at
          ⟨http://git-scm.com/⟩.  If you have a bug report for this manual
          page, see ⟨http://git-scm.com/community⟩.  This page was obtained
          from the project's upstream Git repository
          ⟨https://github.com/git/git.git⟩ on 2021-08-27.  (At that time,
          the date of the most recent commit that was found in the
          repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Git 2.33.0.69.gc420321         08/27/2021               GIT-REMOTE-FD(1)

--------------

Pages that refer to this page:
`gitremote-helpers(1) <../man1/gitremote-helpers.1.html>`__, 
`gitremote-helpers(7) <../man7/gitremote-helpers.7.html>`__

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
