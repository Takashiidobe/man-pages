.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lessecho(1) — Linux manual page
===============================

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

   LESSECHO(1)              General Commands Manual             LESSECHO(1)

NAME
-------------------------------------------------

::

          lessecho - expand metacharacters


---------------------------------------------------------

::

          lessecho [-ox] [-cx] [-pn] [-dn] [-mx] [-nn] [-ex] [-a] file ...


---------------------------------------------------------------

::

          lessecho is a program that simply echos its arguments on standard
          output.  But any metacharacter in the output is preceded by an
          "escape" character, which by default is a backslash.


-------------------------------------------------------

::

          A summary of options is included below.

          -ex    Specifies "x", rather than backslash, to be the escape
                 char for metachars.  If x is "-", no escape char is used
                 and arguments containing metachars are surrounded by
                 quotes instead.

          -ox    Specifies "x", rather than double-quote, to be the open
                 quote character, which is used if the -e- option is
                 specified.

          -cx    Specifies "x" to be the close quote character.

          -pn    Specifies "n" to be the open quote character, as an
                 integer.

          -dn    Specifies "n" to be the close quote character, as an
                 integer.

          -mx    Specifies "x" to be a metachar.  By default, no characters
                 are considered metachars.

          -nn    Specifies "n" to be a metachar, as an integer.

          -fn    Specifies "n" to be the escape char for metachars, as an
                 integer.

          -a     Specifies that all arguments are to be quoted.  The
                 default is that only arguments containing metacharacters
                 are quoted.


---------------------------------------------------------

::

          less(1)


-----------------------------------------------------

::

          This manual page was written by Thomas Schoepf
          <schoepf@debian.org>, for the Debian GNU/Linux system (but may be
          used by others).

          Report bugs at https://github.com/gwsw/less/issues.

COLOPHON
---------------------------------------------------------

::

          This page is part of the less (A file pager) project.
          Information about the project can be found at 
          ⟨http://www.greenwoodsoftware.com/less/⟩.  If you have a bug
          report for this manual page, see
          ⟨http://www.greenwoodsoftware.com/less/faq.html#bugs⟩.  This page
          was obtained from the tarball less-590.tar.gz fetched from
          ⟨http://www.greenwoodsoftware.com/less/download.html⟩ on
          2021-08-27.  If you discover any rendering problems in this HTML
          version of the page, or you believe there is a better or more up-
          to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

                           Version 590: 03 Jun 2021             LESSECHO(1)

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
