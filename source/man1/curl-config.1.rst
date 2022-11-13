.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

curl-config(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   curl-config(1)             curl-config manual             curl-config(1)

NAME
-------------------------------------------------

::

          curl-config - Get information about a libcurl installation


---------------------------------------------------------

::

          curl-config [options]


---------------------------------------------------------------

::

          curl-config displays information about the curl and libcurl
          installation.


-------------------------------------------------------

::

          --ca   Displays the built-in path to the CA cert bundle this
                 libcurl uses.

          --cc   Displays the compiler used to build libcurl.

          --cflags
                 Set of compiler options (CFLAGS) to use when compiling
                 files that use libcurl. Currently that is only the include
                 path to the curl include files.

          --checkfor [version]
                 Specify the oldest possible libcurl version string you
                 want, and this script will return 0 if the current
                 installation is new enough or it returns 1 and outputs a
                 text saying that the current version is not new enough.
                 (Added in 7.15.4)

          --configure
                 Displays the arguments given to configure when building
                 curl.

          --feature
                 Lists what particular main features the installed libcurl
                 was built with. At the time of writing, this list may
                 include SSL, KRB4 or IPv6. Do not assume any particular
                 order. The keywords will be separated by newlines. There
                 may be none, one, or several keywords in the list.

          --help Displays the available options.

          --libs Shows the complete set of libs and other linker options
                 you will need in order to link your application with
                 libcurl.

          --prefix
                 This is the prefix used when libcurl was installed.
                 Libcurl is then installed in $prefix/lib and its header
                 files are installed in $prefix/include and so on. The
                 prefix is set with "configure --prefix".

          --protocols
                 Lists what particular protocols the installed libcurl was
                 built to support. At the time of writing, this list may
                 include HTTP, HTTPS, FTP, FTPS, FILE, TELNET, LDAP, DICT.
                 Do not assume any particular order. The protocols will be
                 listed using uppercase and are separated by newlines.
                 There may be none, one, or several protocols in the list.
                 (Added in 7.13.0)

          --ssl-backends
                 Lists the SSL backends that were enabled when libcurl was
                 built. It might be no, one or several names. If more than
                 one name, they will appear comma-separated. (Added in
                 7.58.0)

          --static-libs
                 Shows the complete set of libs and other linker options
                 you will need in order to link your application with
                 libcurl statically. (Added in 7.17.1)

          --version
                 Outputs version information about the installed libcurl.

          --vernum
                 Outputs version information about the installed libcurl,
                 in numerical mode.  This outputs the version number, in
                 hexadecimal, with 8 bits for each part: major, minor, and
                 patch. So that libcurl 7.7.4 would appear as 070704 and
                 libcurl 12.13.14 would appear as 0c0d0e... Note that the
                 initial zero might be omitted. (This option was broken in
                 the 7.15.0 release.)


---------------------------------------------------------

::

          What linker options do I need when I link with libcurl?

            $ curl-config --libs

          What compiler options do I need when I compile using libcurl
          functions?

            $ curl-config --cflags

          How do I know if libcurl was built with SSL support?

            $ curl-config --feature | grep SSL

          What's the installed libcurl version?

            $ curl-config --version

          How do I build a single file with a one-line command?

            $ `curl-config --cc --cflags` -o example example.c `curl-config
          --libs`


---------------------------------------------------------

::

          curl(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the curl (Command line tool and library for
          transferring data with URLs) project.  Information about the
          project can be found at ⟨https://curl.haxx.se/⟩.  If you have a
          bug report for this manual page, see
          ⟨https://curl.haxx.se/docs/bugs.html⟩.  This page was obtained
          from the project's upstream Git repository
          ⟨https://github.com/curl/curl.git⟩ on 2021-08-27.  (At that time,
          the date of the most recent commit that was found in the
          repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Curl 7.17.1                    25 Oct 2007                curl-config(1)

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
