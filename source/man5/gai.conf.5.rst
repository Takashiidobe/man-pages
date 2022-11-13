.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gai.conf(5) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GAI.CONF(5)             Linux Programmer's Manual            GAI.CONF(5)

NAME
-------------------------------------------------

::

          gai.conf - getaddrinfo(3) configuration file


---------------------------------------------------------------

::

          A call to getaddrinfo(3) might return multiple answers.
          According to RFC 3484 these answers must be sorted so that the
          answer with the highest success rate is first in the list.  The
          RFC provides an algorithm for the sorting.  The static rules are
          not always adequate, though.  For this reason, the RFC also
          requires that system administrators should have the possibility
          to dynamically change the sorting.  For the glibc implementation,
          this can be achieved with the /etc/gai.conf file.

          Each line in the configuration file consists of a keyword and its
          parameters.  White spaces in any place are ignored.  Lines
          starting with '#' are comments and are ignored.

          The keywords currently recognized are:

          label netmask precedence
                 The value is added to the label table used in the RFC 3484
                 sorting.  If any label definition is present in the
                 configuration file, the default table is not used.  All
                 the label definitions of the default table which are to be
                 maintained have to be duplicated.  Following the keyword,
                 the line has to contain a network mask and a precedence
                 value.

          precedence netmask precedence
                 This keyword is similar to label, but instead the value is
                 added to the precedence table as specified in RFC 3484.
                 Once again, the presence of a single precedence line in
                 the configuration file causes the default table to not be
                 used.

          reload <yes|no>
                 This keyword controls whether a process checks whether the
                 configuration file has been changed since the last time it
                 was read.  If the value is "yes", the file is reread.
                 This might cause problems in multithreaded applications
                 and is generally a bad idea.  The default is "no".

          scopev4 mask value
                 Add another rule to the RFC 3484 scope table for IPv4
                 address.  By default, the scope IDs described in section
                 3.2 in RFC 3438 are used.  Changing these defaults should
                 hardly ever be necessary.


---------------------------------------------------

::

          /etc/gai.conf


---------------------------------------------------------

::

          The gai.conf file is supported by glibc since version 2.5.


---------------------------------------------------------

::

          The default table according to RFC 3484 would be specified with
          the following configuration file:

              label  ::1/128       0
              label  ::/0          1
              label  2002::/16     2
              label ::/96          3
              label ::ffff:0:0/96  4
              precedence  ::1/128       50
              precedence  ::/0          40
              precedence  2002::/16     30
              precedence ::/96          20
              precedence ::ffff:0:0/96  10


---------------------------------------------------------

::

          getaddrinfo(3), RFC 3484

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2020-06-09                    GAI.CONF(5)

--------------

Pages that refer to this page:
`pmdanetcheck(1) <../man1/pmdanetcheck.1.html>`__, 
`getaddrinfo(3) <../man3/getaddrinfo.3.html>`__

--------------

`Copyright and license for this manual
page <../man5/gai.conf.5.license.html>`__

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
