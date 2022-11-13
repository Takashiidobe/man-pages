.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

uts_namespaces(7) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   UTS_NAMESPACES(7)       Linux Programmer's Manual      UTS_NAMESPACES(7)

NAME
-------------------------------------------------

::

          uts_namespaces - overview of Linux UTS namespaces


---------------------------------------------------------------

::

          UTS namespaces provide isolation of two system identifiers: the
          hostname and the NIS domain name.  These identifiers are set
          using sethostname(2) and setdomainname(2), and can be retrieved
          using uname(2), gethostname(2), and getdomainname(2).  Changes
          made to these identifiers are visible to all other processes in
          the same UTS namespace, but are not visible to processes in other
          UTS namespaces.

          When a process creates a new UTS namespace using clone(2) or
          unshare(2) with the CLONE_NEWUTS flag, the hostname and domain of
          the new UTS namespace are copied from the corresponding values in
          the caller's UTS namespace.

          Use of UTS namespaces requires a kernel that is configured with
          the CONFIG_UTS_NS option.


---------------------------------------------------------

::

          nsenter(1), unshare(1), clone(2), getdomainname(2),
          gethostname(2), setns(2), uname(2), unshare(2), namespaces(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2019-11-19              UTS_NAMESPACES(7)

--------------

Pages that refer to this page: `nsenter(1) <../man1/nsenter.1.html>`__, 
`unshare(1) <../man1/unshare.1.html>`__, 
`clone(2) <../man2/clone.2.html>`__, 
`getdomainname(2) <../man2/getdomainname.2.html>`__, 
`gethostname(2) <../man2/gethostname.2.html>`__, 
`uname(2) <../man2/uname.2.html>`__, 
`namespaces(7) <../man7/namespaces.7.html>`__

--------------

`Copyright and license for this manual
page <../man7/uts_namespaces.7.license.html>`__

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
