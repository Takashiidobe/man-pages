.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

yum-torrent.conf(5) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `[main]                           |                                   |
|  OPTIONS <#%5Bmain%5D_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `[timeouts] OPT                   |                                   |
| IONS <#%5Btimeouts%5D_OPTIONS>`__ |                                   |
| \| `AUTHOR <#AUTHOR>`__ \|        |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   YUM-TORRENT.CONF(5)           File Formats           YUM-TORRENT.CONF(5)

NAME
-------------------------------------------------

::

          yum-torrent.conf(5)


---------------------------------------------------------

::

          yum-torrent.conf(5) is the configuration file for yum-torrent(1)
          Yum plugin to download and seed packages via BitTorrent.  This
          configuration specifies which BitTorrent client to use, how to
          interact with it, and a number of timing parameters.  Of
          particular note is the {seed_time} substitution.  The benefit of
          using BitTorrent is partially attributable to clients contining
          to seed their torrents some time after they have completed their
          download.  yum-torrent(1) employs an exponential decay algorithm
          seeded from the hostname and torrent info_hash.  All clients will
          seed for at least seed_min After that, the number of seeders will
          decay as the probability of other hosts also needing the same set
          of packages will also decrease.


---------------------------------------------------

::

          /etc/yum/pluginconf.d/yum-torrent.conf


-------------------------------------------------------------------------

::

          service
                 A specific relative path on the http repository where the
                 pkgtorrent-service(8) is configured. See also
                 pkgtorrent-service.conf(5) for more. Defaults to
                 /yum/torrent_service

          client Fully qualified path to BitTorrent client that accepts a
                 single positional torrent filename that will download into
                 the current working directory.  Required.

          options
                 Additional command line parameters passed to client on
                 startup.  A substitution named {seed_time} is available.
                 This is measured in seconds and can be used to instruct
                 the BitTorrent client to seed for a variable time once the
                 download is completed.

          complete
                 The text to match anywhere from the logged stdout of the
                 client signaling the package files have been downloaded.
                 This allows the client to continue to run and seed the
                 torrent file for others.


---------------------------------------------------------------------------------

::

          All the values in this section are positive integers measured in
          seconds.

          download
                 The maximum time to wait for the message complete to
                 appear in the log file.  If a download with the plugin
                 fails for any reason yum will not find the downloaded rpm
                 files in /var/cache/yum directory. It will fall back on
                 the internal download mechanism.

          seed_min
                 The minimum value for {seed_time}. Default 900 (15
                 minutes).  It is recommended you set this to the same time
                 as your configuration management interval.

          seed_max
                 The maximum value for {seed_time}. Default 86400 (1 day).

          nullfile
                 Delete the padding nullfiles after this time period.

          cache  At the end of each run, /var/cache/yum_torrent is
                 examined. Any files not touched in this time period are
                 deleted, and empty directories are removed.  Note: If yum
                 is not run for an extended period, this garbage collection
                 will not happen.


-----------------------------------------------------

::

          Matthew Almond <malmond@fb.com>


---------------------------------------------------------

::

          yum-torrent(1)

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

                                 09 MARCH 2016          YUM-TORRENT.CONF(5)

--------------

Pages that refer to this page:
`yum-torrent(1) <../man1/yum-torrent.1.html>`__, 
`yum-torrent.conf(5) <../man5/yum-torrent.conf.5.html>`__

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
