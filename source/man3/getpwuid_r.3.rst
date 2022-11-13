.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getpwnam(3) — Linux manual page
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
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETPWNAM(3)             Linux Programmer's Manual            GETPWNAM(3)

NAME
-------------------------------------------------

::

          getpwnam, getpwnam_r, getpwuid, getpwuid_r - get password file
          entry


---------------------------------------------------------

::

          #include <sys/types.h>
          #include <pwd.h>

          struct passwd *getpwnam(const char *name);
          struct passwd *getpwuid(uid_t uid);

          int getpwnam_r(const char *restrict name, struct passwd *restrict pwd,
                         char *restrict buf, size_t buflen,
                         struct passwd **restrict result);
          int getpwuid_r(uid_t uid, struct passwd *restrict pwd,
                         char *restrict buf, size_t buflen,
                         struct passwd **restrict result);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          getpwnam_r(), getpwuid_r():
              _POSIX_C_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          The getpwnam() function returns a pointer to a structure
          containing the broken-out fields of the record in the password
          database (e.g., the local password file /etc/passwd, NIS, and
          LDAP) that matches the username name.

          The getpwuid() function returns a pointer to a structure
          containing the broken-out fields of the record in the password
          database that matches the user ID uid.

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

          See passwd(5) for more information about these fields.

          The getpwnam_r() and getpwuid_r() functions obtain the same
          information as getpwnam() and getpwuid(), but store the retrieved
          passwd structure in the space pointed to by pwd.  The string
          fields pointed to by the members of the passwd structure are
          stored in the buffer buf of size buflen.  A pointer to the result
          (in case of success) or NULL (in case no entry was found or an
          error occurred) is stored in *result.

          The call

              sysconf(_SC_GETPW_R_SIZE_MAX)

          returns either -1, without changing errno, or an initial
          suggested size for buf.  (If this size is too small, the call
          fails with ERANGE, in which case the caller can retry with a
          larger buffer.)


-----------------------------------------------------------------

::

          The getpwnam() and getpwuid() functions return a pointer to a
          passwd structure, or NULL if the matching entry is not found or
          an error occurs.  If an error occurs, errno is set to indicate
          the error.  If one wants to check errno after the call, it should
          be set to zero before the call.

          The return value may point to a static area, and may be
          overwritten by subsequent calls to getpwent(3), getpwnam(), or
          getpwuid().  (Do not pass the returned pointer to free(3).)

          On success, getpwnam_r() and getpwuid_r() return zero, and set
          *result to pwd.  If no matching password record was found, these
          functions return 0 and store NULL in *result.  In case of error,
          an error number is returned, and NULL is stored in *result.


-----------------------------------------------------

::

          0 or ENOENT or ESRCH or EBADF or EPERM or ...
                 The given name or uid was not found.

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

          ┌──────────────┬───────────────┬─────────────────────────────────┐
          │Interface     │ Attribute     │ Value                           │
          ├──────────────┼───────────────┼─────────────────────────────────┤
          │getpwnam()    │ Thread safety │ MT-Unsafe race:pwnam locale     │
          ├──────────────┼───────────────┼─────────────────────────────────┤
          │getpwuid()    │ Thread safety │ MT-Unsafe race:pwuid locale     │
          ├──────────────┼───────────────┼─────────────────────────────────┤
          │getpwnam_r(), │ Thread safety │ MT-Safe locale                  │
          │getpwuid_r()  │               │                                 │
          └──────────────┴───────────────┴─────────────────────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4, 4.3BSD.  The pw_gecos field is
          not specified in POSIX, but is present on most implementations.


---------------------------------------------------

::

          The formulation given above under "RETURN VALUE" is from
          POSIX.1-2001.  It does not call "not found" an error, and hence
          does not specify what value errno might have in this situation.
          But that makes it impossible to recognize errors.  One might
          argue that according to POSIX errno should be left unchanged if
          an entry is not found.  Experiments on various UNIX-like systems
          show that lots of different values occur in this situation: 0,
          ENOENT, EBADF, ESRCH, EWOULDBLOCK, EPERM, and probably others.

          The pw_dir field contains the name of the initial working
          directory of the user.  Login programs use the value of this
          field to initialize the HOME environment variable for the login
          shell.  An application that wants to determine its user's home
          directory should inspect the value of HOME (rather than the value
          getpwuid(getuid())->pw_dir) since this allows the user to modify
          their notion of "the home directory" during a login session.  To
          determine the (initial) home directory of another user, it is
          necessary to use getpwnam("username")->pw_dir or similar.


---------------------------------------------------------

::

          The program below demonstrates the use of getpwnam_r() to find
          the full username and user ID for the username supplied as a
          command-line argument.

          #include <pwd.h>
          #include <stdint.h>
          #include <stdio.h>
          #include <stdlib.h>
          #include <unistd.h>
          #include <errno.h>

          int
          main(int argc, char *argv[])
          {
              struct passwd pwd;
              struct passwd *result;
              char *buf;
              size_t bufsize;
              int s;

              if (argc != 2) {
                  fprintf(stderr, "Usage: %s username\n", argv[0]);
                  exit(EXIT_FAILURE);
              }

              bufsize = sysconf(_SC_GETPW_R_SIZE_MAX);
              if (bufsize == -1)          /* Value was indeterminate */
                  bufsize = 16384;        /* Should be more than enough */

              buf = malloc(bufsize);
              if (buf == NULL) {
                  perror("malloc");
                  exit(EXIT_FAILURE);
              }

              s = getpwnam_r(argv[1], &pwd, buf, bufsize, &result);
              if (result == NULL) {
                  if (s == 0)
                      printf("Not found\n");
                  else {
                      errno = s;
                      perror("getpwnam_r");
                  }
                  exit(EXIT_FAILURE);
              }

              printf("Name: %s; UID: %jd\n", pwd.pw_gecos,
                      (intmax_t) pwd.pw_uid);
              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          endpwent(3), fgetpwent(3), getgrnam(3), getpw(3), getpwent(3),
          getspnam(3), putpwent(3), setpwent(3), passwd(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                    GETPWNAM(3)

--------------

Pages that refer to this page: `capsh(1) <../man1/capsh.1.html>`__, 
`getent(1) <../man1/getent.1.html>`__, 
`git-daemon(1) <../man1/git-daemon.1.html>`__, 
`gitweb(1) <../man1/gitweb.1.html>`__, 
`strace(1) <../man1/strace.1.html>`__, 
`chown(2) <../man2/chown.2.html>`__, 
`fgetpwent(3) <../man3/fgetpwent.3.html>`__, 
`getgrent_r(3) <../man3/getgrent_r.3.html>`__, 
`getgrnam(3) <../man3/getgrnam.3.html>`__, 
`getpw(3) <../man3/getpw.3.html>`__, 
`getpwent(3) <../man3/getpwent.3.html>`__, 
`getpwent_r(3) <../man3/getpwent_r.3.html>`__, 
`getspnam(3) <../man3/getspnam.3.html>`__, 
`getutent(3) <../man3/getutent.3.html>`__, 
`pmsetprocessidentity(3) <../man3/pmsetprocessidentity.3.html>`__, 
`putpwent(3) <../man3/putpwent.3.html>`__, 
`org.freedesktop.home1(5) <../man5/org.freedesktop.home1.5.html>`__, 
`passwd(5) <../man5/passwd.5.html>`__, 
`passwd(5@@shadow-utils) <../man5/passwd.5@@shadow-utils.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`nscd(8) <../man8/nscd.8.html>`__, 
`sulogin(8) <../man8/sulogin.8.html>`__

--------------

`Copyright and license for this manual
page <../man3/getpwnam.3.license.html>`__

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
