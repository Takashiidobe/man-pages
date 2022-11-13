.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getpwent(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETPWENT(3)             Linux Programmer's Manual            GETPWENT(3)

NAME
-------------------------------------------------

::

          getpwent, setpwent, endpwent - get password file entry


---------------------------------------------------------

::

          #include <sys/types.h>
          #include <pwd.h>

          struct passwd *getpwent(void);
          void setpwent(void);
          void endpwent(void);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          getpwent(), setpwent(), endpwent():
              _XOPEN_SOURCE >= 500
                  || /* Glibc since 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          The getpwent() function returns a pointer to a structure
          containing the broken-out fields of a record from the password
          database (e.g., the local password file /etc/passwd, NIS, and
          LDAP).  The first time getpwent() is called, it returns the first
          entry; thereafter, it returns successive entries.

          The setpwent() function rewinds to the beginning of the password
          database.

          The endpwent() function is used to close the password database
          after all processing has been performed.

          The passwd structure is defined in <pwd.h> as follows:

              struct passwd {
                  char   *pw_name;       /* username */
                  char   *pw_passwd;     /* user password */
                  uid_t   pw_uid;        /* user ID */
                  gid_t   pw_gid;        /* group ID */
                  char   *pw_gecos;      /* user information */
                  char   *pw_dir;        /* home directory */
                  char   *pw_shell;      /* shell program */
              };

          For more information about the fields of this structure, see
          passwd(5).


-----------------------------------------------------------------

::

          The getpwent() function returns a pointer to a passwd structure,
          or NULL if there are no more entries or an error occurred.  If an
          error occurs, errno is set to indicate the error.  If one wants
          to check errno after the call, it should be set to zero before
          the call.

          The return value may point to a static area, and may be
          overwritten by subsequent calls to getpwent(), getpwnam(3), or
          getpwuid(3).  (Do not pass the returned pointer to free(3).)


-----------------------------------------------------

::

          EINTR  A signal was caught; see signal(7).

          EIO    I/O error.

          EMFILE The per-process limit on the number of open file
                 descriptors has been reached.

          ENFILE The system-wide limit on the total number of open files
                 has been reached.

          ENOMEM Insufficient memory to allocate passwd structure.

          ERANGE Insufficient buffer space supplied.


---------------------------------------------------

::

          /etc/passwd
                 local password database file


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌────────────┬───────────────┬───────────────────────────────────┐
          │Interface   │ Attribute     │ Value                             │
          ├────────────┼───────────────┼───────────────────────────────────┤
          │getpwent()  │ Thread safety │ MT-Unsafe race:pwent              │
          │            │               │ race:pwentbuf locale              │
          ├────────────┼───────────────┼───────────────────────────────────┤
          │setpwent(), │ Thread safety │ MT-Unsafe race:pwent locale       │
          │endpwent()  │               │                                   │
          └────────────┴───────────────┴───────────────────────────────────┘
          In the above table, pwent in race:pwent signifies that if any of
          the functions setpwent(), getpwent(), or endpwent() are used in
          parallel in different threads of a program, then data races could
          occur.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4, 4.3BSD.  The pw_gecos field is
          not specified in POSIX, but is present on most implementations.


---------------------------------------------------------

::

          fgetpwent(3), getpw(3), getpwent_r(3), getpwnam(3), getpwuid(3),
          putpwent(3), passwd(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                    GETPWENT(3)

--------------

Pages that refer to this page: `getent(1) <../man1/getent.1.html>`__, 
`pmcd(1) <../man1/pmcd.1.html>`__, 
`pmdapipe(1) <../man1/pmdapipe.1.html>`__, 
`fgetpwent(3) <../man3/fgetpwent.3.html>`__, 
`getpw(3) <../man3/getpw.3.html>`__, 
`getpwent_r(3) <../man3/getpwent_r.3.html>`__, 
`getpwnam(3) <../man3/getpwnam.3.html>`__, 
`getspnam(3) <../man3/getspnam.3.html>`__, 
`getspnam(3@@shadow-utils) <../man3/getspnam.3@@shadow-utils.html>`__, 
`putpwent(3) <../man3/putpwent.3.html>`__, 
`setaliasent(3) <../man3/setaliasent.3.html>`__, 
`shadow(3) <../man3/shadow.3.html>`__, 
`nss(5) <../man5/nss.5.html>`__, 
`nsswitch.conf(5) <../man5/nsswitch.conf.5.html>`__, 
`passwd(5) <../man5/passwd.5.html>`__, 
`genhomedircon(8) <../man8/genhomedircon.8.html>`__

--------------

`Copyright and license for this manual
page <../man3/getpwent.3.license.html>`__

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
