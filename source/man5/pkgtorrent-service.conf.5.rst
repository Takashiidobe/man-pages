.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pkgtorrent-service.conf(5) — Linux manual page
==============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   pkgtorrent-service.conf(5)    File Formats    pkgtorrent-service.conf(5)

NAME
-------------------------------------------------

::

          pkgtorrent-service.conf(5) is an example Apache 2 configuration
          file for the pkgtorrent-service(8).


---------------------------------------------------------

::

          The default configuration maps the name torrent_service in any
          "subdirectory" of the web server root to the WSGI program.  The
          service cannot be installed in web server root because all multi-
          file torrents contain a concept of a name, which is expanded to a
          directory name when unpacked.  The service generates .torrent
          files which populates the url-list metadata with the URL prefix
          to the torrent_service name. All files within the torrent are
          relative to this prefix.  The pkgtorrent-service(8) has been
          tested extensively with Apache 2 and mod_wsgi, but should work
          equally well with any other WSGI capable web server.

          To use this configuration with Apache 2, install and enable
          mod_wsgi then enable this "site" using:

                 a2ensite pkgtorrent-service.conf


-----------------------------------------------------

::

          Matthew Almond <malmond@fb.com>


---------------------------------------------------------

::

          pkgtorrent-service(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the yum-utils (Yum Package Manager
          utilities) project.  Information about the project can be found
          at ⟨https://github.com/rpm-software-management/yum⟩.  It is not
          known how to report bugs for this man page; if you know, please
          send a mail to man-pages@man7.org.  This page was obtained from
          the project's upstream Git repository
          ⟨https://github.com/rpm-software-management/yum-utils.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2020-03-11.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                 09 MARCH 2016   pkgtorrent-service.conf(5)

--------------

Pages that refer to this page:
`yum-torrent(1) <../man1/yum-torrent.1.html>`__, 
`pkgtorrent-service.conf(5) <../man5/pkgtorrent-service.conf.5.html>`__, 
`yum-torrent.conf(5) <../man5/yum-torrent.conf.5.html>`__, 
`pkgtorrent-service(8) <../man8/pkgtorrent-service.8.html>`__

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
