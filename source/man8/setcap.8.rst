.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setcap(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXIT CODE <#EXIT_CODE>`__ \|     |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SETCAP(8)                System Manager's Manual               SETCAP(8)

NAME
-------------------------------------------------

::

          setcap - set file capabilities


---------------------------------------------------------

::

          setcap [-q] [-n <rootuid>] [-v] {capabilities|-|-r} filename [
          ... capabilitiesN fileN ]


---------------------------------------------------------------

::

          In the absence of the -v (verify) option setcap sets the
          capabilities of each specified filename to the capabilities
          specified.  The optional -n <rootuid> argument can be used to set
          the file capability for use only in a user namespace with this
          root user ID owner. The -v option is used to verify that the
          specified capabilities are currently associated with the file. If
          -v and -n are supplied, the -n <rootuid> argument is also
          verified.

          The capabilities are specified in the form described in
          cap_from_text(3).

          The special capability string, '-', can be used to indicate that
          capabilities are read from the standard input. In such cases, the
          capability set is terminated with a blank line.

          The special capability string, '-r', is used to remove a
          capability set from a file. Note, setting an empty capability set
          is not the same as removing it. An empty set can be used to
          guarantee a file is not executed with privilege in spite of the
          fact that the prevailing ambient+inheritable sets would otherwise
          bestow capabilities on executed binaries.

          The -q flag is used to make the program less verbose in its
          output.


-----------------------------------------------------------

::

          The setcap program will exit with a 0 exit code if successful. On
          failure, the exit code is 1.


---------------------------------------------------------------------

::

          Please report bugs via:

          https://bugzilla.kernel.org/buglist.cgi?component=libcap&list_id=1047723&product=Tools&resolution=---


---------------------------------------------------------

::

          cap_from_text(3), cap_get_file(3), capabilities(7),
          user_namespaces(7), getcap(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the libcap (capabilities commands and
          library) project.  Information about the project can be found at
          ⟨https://git.kernel.org/pub/scm/libs/libcap/libcap.git/⟩.  If you
          have a bug report for this manual page, send it to
          morgan@kernel.org (please put "libcap" in the Subject line).
          This page was obtained from the project's upstream Git repository
          ⟨https://git.kernel.org/pub/scm/libs/libcap/libcap.git/⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-25.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                  2020-01-07                      SETCAP(8)

--------------

Pages that refer to this page: `capsh(1) <../man1/capsh.1.html>`__, 
`cap_iab(3) <../man3/cap_iab.3.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__, 
`getcap(8) <../man8/getcap.8.html>`__, 
`getpcaps(8) <../man8/getpcaps.8.html>`__

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
