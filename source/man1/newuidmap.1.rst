.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

newuidmap(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NEWUIDMAP(1)                  User Commands                 NEWUIDMAP(1)

NAME
-------------------------------------------------

::

          newuidmap - set the uid mapping of a user namespace


---------------------------------------------------------

::

          newuidmap pid uid loweruid count [uid loweruid count [ ... ]]


---------------------------------------------------------------

::

          The newuidmap sets /proc/[pid]/uid_map based on its command line
          arguments and the uids allowed. Subuid delegation can either be
          managed via /etc/subuid or through the configured NSS subid
          module. These options are mutually exclusive.

          Note that the root user is not exempted from the requirement for
          a valid /etc/subuid entry.

          After the pid argument, newuidmap expects sets of 3 integers:

          uid
              Beginning of the range of UIDs inside the user namespace.

          loweruid
              Beginning of the range of UIDs outside the user namespace.

          count
              Length of the ranges (both inside and outside the user
              namespace).

          newuidmap verifies that the caller is the owner of the process
          indicated by pid and that for each of the above sets, each of the
          UIDs in the range [loweruid, loweruid+count) is allowed to the
          caller according to /etc/subuid before setting
          /proc/[pid]/uid_map.

          Note that newuidmap may be used only once for a given process.


-------------------------------------------------------

::

          There currently are no options to the newuidmap command.


---------------------------------------------------

::

          /etc/subuid
              List of user's subordinate user IDs.

          /proc/[pid]/uid_map
              Mapping of uids from one between user namespaces.


---------------------------------------------------------

::

          login.defs(5), newusers(8), subuid(5), useradd(8), usermod(8),
          userdel(8).

COLOPHON
---------------------------------------------------------

::

          This page is part of the shadow-utils (utilities for managing
          accounts and shadow password files) project.  Information about
          the project can be found at 
          ⟨https://github.com/shadow-maint/shadow⟩.  If you have a bug
          report for this manual page, send it to
          pkg-shadow-devel@alioth-lists.debian.net.  This page was obtained
          from the project's upstream Git repository
          ⟨https://github.com/shadow-maint/shadow⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-14.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   shadow-utils 4.8.1             08/27/2021                   NEWUIDMAP(1)

--------------

Pages that refer to this page:
`mount_setattr(2) <../man2/mount_setattr.2.html>`__, 
`subgid(5) <../man5/subgid.5.html>`__, 
`subuid(5) <../man5/subuid.5.html>`__, 
`user_namespaces(7) <../man7/user_namespaces.7.html>`__

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
