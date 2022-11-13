.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

uuidgen(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   UUIDGEN(1)                    User Commands                   UUIDGEN(1)

NAME
-------------------------------------------------

::

          uuidgen - create a new UUID value


---------------------------------------------------------

::

          uuidgen [options]


---------------------------------------------------------------

::

          The uuidgen program creates (and prints) a new universally unique
          identifier (UUID) using the libuuid(3) library. The new UUID can
          reasonably be considered unique among all UUIDs created on the
          local system, and among UUIDs created on other systems in the
          past and in the future.

          There are three types of UUIDs which uuidgen can generate:
          time-based UUIDs, random-based UUIDs, and hash-based UUIDs. By
          default uuidgen will generate a random-based UUID if a
          high-quality random number generator is present. Otherwise, it
          will choose a time-based UUID. It is possible to force the
          generation of one of these first two UUID types by using the
          --random or --time options.

          The third type of UUID is generated with the --md5 or --sha1
          options, followed by --namespace namespace and --name name. The
          namespace may either be a well-known UUID, or else an alias to
          one of the well-known UUIDs defined in RFC 4122, that is @dns,
          @url, @oid, or @x500. The name is an arbitrary string value. The
          generated UUID is the digest of the concatenation of the
          namespace UUID and the name value, hashed with the MD5 or SHA1
          algorithms. It is, therefore, a predictable value which may be
          useful when UUIDs are being used as handles or nonces for more
          complex values or values which shouldn’t be disclosed directly.
          See the RFC for more information.


-------------------------------------------------------

::

          -r, --random
              Generate a random-based UUID. This method creates a UUID
              consisting mostly of random bits. It requires that the
              operating system has a high quality random number generator,
              such as /dev/random.

          -t, --time
              Generate a time-based UUID. This method creates a UUID based
              on the system clock plus the system’s ethernet hardware
              address, if present.

          -h, --help
              Display help text and exit.

          -V, --version
              Display version information and exit.

          -m, --md5
              Use MD5 as the hash algorithm.

          -s, --sha1
              Use SHA1 as the hash algorithm.

          -n, --namespace namespace
              Generate the hash with the namespace prefix. The namespace is
              UUID, or '@ns' where "ns" is well-known predefined UUID
              addressed by namespace name (see above).

          -N, --name name
              Generate the hash of the name.

          -x, --hex
              Interpret name name as a hexadecimal string.


-------------------------------------------------------------------

::

          OSF DCE 1.1


---------------------------------------------------------

::

          uuidgen --sha1 --namespace @dns --name "www.example.com"


-------------------------------------------------------

::

          uuidgen was written by Andreas Dilger for libuuid(3).


---------------------------------------------------------

::

          libuuid(3), RFC 4122 <https://tools.ietf.org/html/rfc4122>


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The uuidgen command is part of the util-linux package which can
          be downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>. This page
          is part of the util-linux (a random collection of Linux
          utilities) project. Information about the project can be found at
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩. If you have
          a bug report for this manual page, send it to
          util-linux@vger.kernel.org. This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩ on
          2021-08-27. (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-24.) If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   util-linux 2.37.85-637cc       2021-04-02                     UUIDGEN(1)

--------------

Pages that refer to this page:
`uuidparse(1) <../man1/uuidparse.1.html>`__, 
`uuid(3) <../man3/uuid.3.html>`__, 
`uuid_generate(3) <../man3/uuid_generate.3.html>`__, 
`swaplabel(8) <../man8/swaplabel.8.html>`__, 
`uuidd(8) <../man8/uuidd.8.html>`__

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
