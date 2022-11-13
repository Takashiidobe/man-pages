.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getttyent(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETTTYENT(3)            Linux Programmer's Manual           GETTTYENT(3)

NAME
-------------------------------------------------

::

          getttyent, getttynam, setttyent, endttyent - get ttys file entry


---------------------------------------------------------

::

          #include <ttyent.h>

          struct ttyent *getttyent(void);
          struct ttyent *getttynam(const char *name);

          int setttyent(void);
          int endttyent(void);


---------------------------------------------------------------

::

          These functions provide an interface to the file _PATH_TTYS
          (e.g., /etc/ttys).

          The function setttyent() opens the file or rewinds it if already
          open.

          The function endttyent() closes the file.

          The function getttynam() searches for a given terminal name in
          the file.  It returns a pointer to a ttyent structure
          (description below).

          The function getttyent() opens the file _PATH_TTYS (if necessary)
          and returns the first entry.  If the file is already open, the
          next entry.  The ttyent structure has the form:

              struct ttyent {
                  char *ty_name;     /* terminal device name */
                  char *ty_getty;    /* command to execute, usually getty */
                  char *ty_type;     /* terminal type for termcap */
                  int   ty_status;   /* status flags */
                  char *ty_window;   /* command to start up window manager */
                  char *ty_comment;  /* comment field */
              };

          ty_status can be:

              #define TTY_ON     0x01  /* enable logins (start ty_getty program) */
              #define TTY_SECURE 0x02  /* allow UID 0 to login */


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌────────────────────────┬───────────────┬───────────────────────┐
          │Interface               │ Attribute     │ Value                 │
          ├────────────────────────┼───────────────┼───────────────────────┤
          │getttyent(),            │ Thread safety │ MT-Unsafe race:ttyent │
          │setttyent(),            │               │                       │
          │endttyent(),            │               │                       │
          │getttynam()             │               │                       │
          └────────────────────────┴───────────────┴───────────────────────┘


-------------------------------------------------------------------

::

          Not in POSIX.1.  Present on the BSDs, and perhaps other systems.


---------------------------------------------------

::

          Under Linux, the file /etc/ttys, and the functions described
          above, are not used.


---------------------------------------------------------

::

          ttyname(3), ttyslot(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                   GETTTYENT(3)

--------------

Pages that refer to this page: `ttyslot(3) <../man3/ttyslot.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/getttyent.3.license.html>`__

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
