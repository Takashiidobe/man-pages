.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

uuid_parse(3) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `AUTHORS <#AUTHORS>`__ \|      |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   UUID_PARSE(3)              Programmer's Manual             UUID_PARSE(3)

NAME
-------------------------------------------------

::

          uuid_parse - convert an input UUID string into binary
          representation


---------------------------------------------------------

::

          #include <uuid.h>

          int uuid_parse(char *in, uuid_t uu);
          int uuid_parse_range(char *in_start, char *in_end, uuid_t uu);


---------------------------------------------------------------

::

          The uuid_parse() function converts the UUID string given by in
          into the binary representation. The input UUID is a string of the
          form 1b4e28ba-2fa1-11d2-883f-b9a761bde3fb (in printf(3) format
          "%08x-%04x-%04x-%04x-%012x", 36 bytes plus the trailing '\0').

          The uuid_parse_range() function works like uuid_parse() but
          parses only range in string specified by in_start and in_end
          pointers.


-----------------------------------------------------------------

::

          Upon successfully parsing the input string, 0 is returned, and
          the UUID is stored in the location pointed to by uu, otherwise -1
          is returned.


-------------------------------------------------------------------

::

          This library parses UUIDs compatible with OSF DCE 1.1, and hash
          based UUIDs V3 and V5 compatible with RFC-4122
          <https://tools.ietf.org/html/rfc4122>.


-------------------------------------------------------

::

          Theodore Y. Ts’o


---------------------------------------------------------

::

          uuid(3), uuid_clear(3), uuid_compare(3), uuid_copy(3),
          uuid_generate(3), uuid_is_null(3), uuid_time(3), uuid_unparse(3)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The libuuid library is part of the util-linux package since
          version 2.15.1. It can be downloaded from Linux Kernel Archive
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

   util-linux 2.37.85-637cc       2021-04-02                  UUID_PARSE(3)

--------------

Pages that refer to this page: `uuid(3) <../man3/uuid.3.html>`__, 
`uuid_clear(3) <../man3/uuid_clear.3.html>`__, 
`uuid_compare(3) <../man3/uuid_compare.3.html>`__, 
`uuid_copy(3) <../man3/uuid_copy.3.html>`__, 
`uuid_generate(3) <../man3/uuid_generate.3.html>`__, 
`uuid_is_null(3) <../man3/uuid_is_null.3.html>`__, 
`uuid_time(3) <../man3/uuid_time.3.html>`__, 
`uuid_unparse(3) <../man3/uuid_unparse.3.html>`__

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
