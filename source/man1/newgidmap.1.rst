.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

newgidmap(1) — Linux manual page
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

   NEWGIDMAP(1)                  User Commands                 NEWGIDMAP(1)

NAME
-------------------------------------------------

::

          newgidmap - set the gid mapping of a user namespace


---------------------------------------------------------

::

          newgidmap pid gid lowergid count [gid lowergid count [ ... ]]


---------------------------------------------------------------

::

          The newgidmap sets /proc/[pid]/gid_map based on its command line
          arguments and the gids allowed. Subgid delegation can either be
          managed via /etc/subgid or through the configured NSS subid
          module. These options are mutually exclusive.

          Note that the root group is not exempted from the requirement for
          a valid /etc/subgid entry.

          After the pid argument, newgidmap expects sets of 3 integers:

          gid
              Beginning of the range of GIDs inside the user namespace.

          lowergid
              Beginning of the range of GIDs outside the user namespace.

          count
              Length of the ranges (both inside and outside the user
              namespace).

          newgidmap verifies that the caller is the owner of the process
          indicated by pid and that for each of the above sets, each of the
          GIDs in the range [lowergid, lowergid+count) is allowed to the
          caller according to /etc/subgid before setting
          /proc/[pid]/gid_map.

          Note that newgidmap may be used only once for a given process.


-------------------------------------------------------

::

          There currently are no options to the newgidmap command.


---------------------------------------------------

::

          /etc/subgid
              List of user's subordinate group IDs.

          /proc/[pid]/gid_map
              Mapping of gids from one between user namespaces.


---------------------------------------------------------

::

          login.defs(5), newusers(8), subgid(5), useradd(8), userdel(8),
          usermod(8).

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

   shadow-utils 4.8.1             08/27/2021                   NEWGIDMAP(1)

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
