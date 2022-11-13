.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

captest(8) — Linux manual page
==============================

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

   CAPTEST:(8)          System Administration Utilities         CAPTEST:(8)

NAME
-------------------------------------------------

::

          captest - a program to demonstrate capabilities


---------------------------------------------------------

::

          captest [ --ambient --drop-all | --drop-caps | --id ] [ --init-
          grp ] [ --lock ] [ --text ]


---------------------------------------------------------------

::

          captest is a program that demonstrates and prints out the current
          process capabilities. Each option prints the same report. It will
          output current capabilities. then it will try to access
          /etc/shadow directly to show if that can be done. Then it creates
          a child process that attempts to read /etc/shadow and outputs the
          results of that. Then it outputs the capabilities that a child
          process would have.

          You can also apply file system capabilities to this program to
          study how they work. For example, filecap /usr/bin/captest chown.
          Then run captest as a normal user. Another interesting test is to
          make captest suid root so that you can see what the interaction
          is between root's credentials and capabilities. For example,
          chmod 4755 /usr/bin/captest. When run as a normal user, the
          program will see if privilege escalation is possible. But do not
          leave this app setuid root after you are don testing so that an
          attacker cannot take advantage of it.


-------------------------------------------------------

::

          --ambient
                 This attempts to add CAP_CHOWN ambient capability.

          --drop-all
                 This drops all capabilities including ambient and clears
                 the bounding set.

          --drop-caps
                 This drops just traditional capabilities.

          --id   This changes to uid and gid 99, drops supplemental groups,
                 and clears the bounding set.

          --init-grp
                 This changes to uid and gid 99 and then adds any
                 supplemental groups that comes with that account. You
                 would have add them prior to testing because by default
                 there are no supplemental groups on account 99.

          --text This option outputs the effective capabilities in text
                 rather than numerically.

          --lock This prevents the ability for child processes to regain
                 privileges if the uid is 0.


---------------------------------------------------------

::

          filecap(8), capabilities(7)


-----------------------------------------------------

::

          Steve Grubb

COLOPHON
---------------------------------------------------------

::

          This page is part of the libcap-ng (capabilities commands and
          library (NG)) project.  Information about the project can be
          found at ⟨https://people.redhat.com/sgrubb/libcap-ng/⟩.  It is
          not known how to report bugs for this man page; if you know,
          please send a mail to man-pages@man7.org.  This page was obtained
          from the tarball libcap-ng-0.8.2.tar.gz fetched from
          ⟨https://people.redhat.com/sgrubb/libcap-ng/index.html⟩ on
          2021-08-27.  If you discover any rendering problems in this HTML
          version of the page, or you believe there is a better or more up-
          to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

   Red Hat                         Sept 2020                    CAPTEST:(8)

--------------

Pages that refer to this page:
`capabilities(7) <../man7/capabilities.7.html>`__

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
