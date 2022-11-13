.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nscd(8) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NSCD(8)                 Linux Programmer's Manual                NSCD(8)

NAME
-------------------------------------------------

::

          nscd - name service cache daemon


---------------------------------------------------------------

::

          nscd is a daemon that provides a cache for the most common name
          service requests.  The default configuration file,
          /etc/nscd.conf, determines the behavior of the cache daemon.  See
          nscd.conf(5).

          nscd provides caching for accesses of the passwd(5), group(5),
          hosts(5) services(5) and netgroup databases through standard libc
          interfaces, such as getpwnam(3), getpwuid(3), getgrnam(3),
          getgrgid(3), gethostbyname(3), and others.

          There are two caches for each database: a positive one for items
          found, and a negative one for items not found.  Each cache has a
          separate TTL (time-to-live) period for its data.  Note that the
          shadow file is specifically not cached.  getspnam(3) calls remain
          uncached as a result.


-------------------------------------------------------

::

          --help will give you a list with all options and what they do.


---------------------------------------------------

::

          The daemon will try to watch for changes in configuration files
          appropriate for each database (e.g., /etc/passwd for the passwd
          database or /etc/hosts and /etc/resolv.conf for the hosts
          database), and flush the cache when these are changed.  However,
          this will happen only after a short delay (unless the inotify(7)
          mechanism is available and glibc 2.9 or later is available), and
          this auto-detection does not cover configuration files required
          by nonstandard NSS modules, if any are specified in
          /etc/nsswitch.conf.  In that case, you need to run the following
          command after changing the configuration file of the database so
          that nscd invalidates its cache:

              $ nscd -i <database>


---------------------------------------------------------

::

          nscd.conf(5), nsswitch.conf(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2015-05-07                        NSCD(8)

--------------

Pages that refer to this page:
`nscd.conf(5) <../man5/nscd.conf.5.html>`__

--------------

`Copyright and license for this manual
page <../man8/nscd.8.license.html>`__

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
