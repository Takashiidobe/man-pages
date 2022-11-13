.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

login(3) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
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

   LOGIN(3)                Linux Programmer's Manual               LOGIN(3)

NAME
-------------------------------------------------

::

          login, logout - write utmp and wtmp entries


---------------------------------------------------------

::

          #include <utmp.h>

          void login(const struct utmp *ut);
          int logout(const char *ut_line);

          Link with -lutil.


---------------------------------------------------------------

::

          The utmp file records who is currently using the system.  The
          wtmp file records all logins and logouts.  See utmp(5).

          The function login() takes the supplied struct utmp, ut, and
          writes it to both the utmp and the wtmp file.

          The function logout() clears the entry in the utmp file again.

      GNU details
          More precisely, login() takes the argument ut struct, fills the
          field ut->ut_type (if there is such a field) with the value
          USER_PROCESS, and fills the field ut->ut_pid (if there is such a
          field) with the process ID of the calling process.  Then it tries
          to fill the field ut->ut_line.  It takes the first of stdin,
          stdout, stderr that is a terminal, and stores the corresponding
          pathname minus a possible leading /dev/ into this field, and then
          writes the struct to the utmp file.  On the other hand, if no
          terminal name was found, this field is filled with "???"  and the
          struct is not written to the utmp file.  After this, the struct
          is written to the wtmp file.

          The logout() function searches the utmp file for an entry
          matching the ut_line argument.  If a record is found, it is
          updated by zeroing out the ut_name and ut_host fields, updating
          the ut_tv timestamp field and setting ut_type (if there is such a
          field) to DEAD_PROCESS.


-----------------------------------------------------------------

::

          The logout() function returns 1 if the entry was successfully
          written to the database, or 0 if an error occurred.


---------------------------------------------------

::

          /var/run/utmp
                 user accounting database, configured through _PATH_UTMP in
                 <paths.h>

          /var/log/wtmp
                 user accounting log file, configured through _PATH_WTMP in
                 <paths.h>


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────┬───────────────┬─────────────────────────────┐
          │Interface         │ Attribute     │ Value                       │
          ├──────────────────┼───────────────┼─────────────────────────────┤
          │login(), logout() │ Thread safety │ MT-Unsafe race:utent        │
          │                  │               │ sig:ALRM timer              │
          └──────────────────┴───────────────┴─────────────────────────────┘
          In the above table, utent in race:utent signifies that if any of
          the functions setutent(3), getutent(3), or endutent(3) are used
          in parallel in different threads of a program, then data races
          could occur.  login() and logout() calls those functions, so we
          use race:utent to remind users.


-------------------------------------------------------------------

::

          Not in POSIX.1.  Present on the BSDs.


---------------------------------------------------

::

          Note that the member ut_user of struct utmp is called ut_name in
          BSD.  Therefore, ut_name is defined as an alias for ut_user in
          <utmp.h>.


---------------------------------------------------------

::

          getutent(3), utmp(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                       LOGIN(3)

--------------

Pages that refer to this page: `utmp(5) <../man5/utmp.5.html>`__

--------------

`Copyright and license for this manual
page <../man3/login.3.license.html>`__

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
