.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dpkg-mergechangelogs(1) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `LIMITATIONS <#LIMITATIONS>`__ \| |                                   |
| `INTEGRATION WI                   |                                   |
| TH GIT <#INTEGRATION_WITH_GIT>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   dpkg-mergechangelogs(1)        dpkg suite        dpkg-mergechangelogs(1)

NAME
-------------------------------------------------

::

          dpkg-mergechangelogs - 3-way merge of debian/changelog files


---------------------------------------------------------

::

          dpkg-mergechangelogs [option...] old new-a new-b [out]


---------------------------------------------------------------

::

          This program will use the 3 provided versions of the Debian
          changelog to generate a merged changelog file. The resulting
          changelog is stored in the file out or output to the standard
          output if that parameter is not given.

          Each entry is identified by its version number and they are
          assumed to be not conflicting, they are simply merged in the
          right order (by decreasing version number). When
          --merge-prereleases is used, the part of the version number after
          the last tilde is dropped so that 1.0-1~exp1 and 1.0-1~exp5 are
          considered to be the same entry. When the same version is
          available in both new-a and new-b, a standard line-based 3-way
          merge is attempted (provided that the module Algorithm::Merge is
          available — it's part of the package libalgorithm-merge-perl —
          otherwise you get a global conflict on the content of the entry).


-------------------------------------------------------

::

          -m, --merge-prereleases
                 Drop the part after the last tilde in the version number
                 when doing version comparison to identify if two entries
                 are supposed to be the same or not.

                 This is useful when you keep using the same changelog
                 entry but you increase its version number regularly. For
                 instance, you might have 2.3-1~exp1, 2.3-1~exp2, ... until
                 the official release 2.3-1 and they are all the same
                 changelog entry that has evolved over time.

          --help Show the usage message and exit.

          --version
                 Show the version and exit.


---------------------------------------------------------------

::

          DPKG_COLORS
                 Sets the color mode (since dpkg 1.18.5).  The currently
                 accepted values are: auto (default), always and never.

          DPKG_NLS
                 If set, it will be used to decide whether to activate
                 Native Language Support, also known as
                 internationalization (or i18n) support (since dpkg
                 1.19.0).  The accepted values are: 0 and 1 (default).


---------------------------------------------------------------

::

          Anything that is not parsed by Dpkg::Changelog is lost during the
          merge.  This might include stuff like comments which were not
          supposed to be there, etc.


---------------------------------------------------------------------------------

::

          If you want to use this program to merge Debian changelog files
          in a git repository, you have first to register a new merge
          driver in .git/config or ~/.gitconfig:

           [merge "dpkg-mergechangelogs"]
               name = debian/changelog merge driver
               driver = dpkg-mergechangelogs -m %O %A %B %A

          Then you have to setup the merge attribute for the
          debian/changelog file either in .gitattributes in the repository
          itself, or in .git/info/attributes:

           debian/changelog merge=dpkg-mergechangelogs

COLOPHON
---------------------------------------------------------

::

          This page is part of the dpkg (Debian Package Manager) project.
          Information about the project can be found at 
          ⟨https://wiki.debian.org/Teams/Dpkg/⟩.  If you have a bug report
          for this manual page, see
          ⟨http://bugs.debian.org/cgi-bin/pkgreport.cgi?src=dpkg⟩.  This
          page was obtained from the project's upstream Git repository
          ⟨https://salsa.debian.org/dpkg-team/dpkg.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-06-17.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   1.19.6-2-g6e42d5               2019-03-25        dpkg-mergechangelogs(1)

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
