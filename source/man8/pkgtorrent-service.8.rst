.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pkgtorrent-service(8) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `USAGE <#USAGE>`__ \|             |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `INPUT FILES <#INPUT_FILES>`__ \| |                                   |
| `OUTPUT FILES <#OUTPUT_FILES>`__  |                                   |
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   pkgtorrent-service(8)    System Manager's Manual   pkgtorrent-service(8)

NAME
-------------------------------------------------

::

          pkgtorrent-service(8) Is a python WSGI web application that can
          generate BitTorrent files for binary files available from the web
          server.


---------------------------------------------------------

::

          The program should installed on a site local yum mirror and must
          be configured before use. See pkgtorrent-service.conf(5) for more
          information.


---------------------------------------------------

::

          The primary use case for this service is implemented in
          yum-torrent(1).

          There is a secondary interface to assist with simple file
          downloads involving a single path.


-------------------------------------------------------

::

                 $ curl http://example.com/path/to/large/file > file

          can be converted to using BitTorrent with:

                 $ curl http://example.com/path/torrent_service/single/path/to/large/file > file.torrent
                 $ btclient file.torrent

          Note the repetition of path before the service name, and the
          addition of torrent_service/single to pass control to the single
          path mode.  Simple file mode supports simple globbing, so you can
          specify .../directory/*.foo.  If the path resolves to only one
          file, the multi-file support in the .torrent file is skipped,
          making the downloaded file easier to handle.


---------------------------------------------------------------

::

          /var/lib/torrent_service/trackers
                 The service needs to include one or more BitTorrent
                 tracker servers.  The format is one "announce" URL per
                 line. Example: http://example.com:6969/announce This text
                 file is scanned each minute for updates.


-----------------------------------------------------------------

::

          The service makes extensive use of cache files. The files are
          relatively small. It is recommended you periodically clean these
          caches for files not used in the past month or so.

          /var/cache/torrent_service/info/input_digest
                 This directory caches info_hashes for the previously
                 requested path digests.  These are used with the current
                 list of trackers to generate .torrent files in constant
                 time.

          /var/cache/torrent_service/pieces/path/to/file/blocksize
                 Every file within a torrent is represented by a list of
                 SHA1 digests, one for each blocksize of the file.  The
                 SHA1 list is expensive to generate.  The same binaries may
                 be downloaded in different permutations by different
                 clients.  The cache is invalidated if the original file
                 has a different mtime or is a different size.


-------------------------------------------------

::

          Single file mode should be called simple.


-----------------------------------------------------

::

          Matthew Almond <malmond@fb.com>


---------------------------------------------------------

::

          pkgtorrent-service.conf(5)

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

                                 09 MARCH 2016        pkgtorrent-service(8)

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
