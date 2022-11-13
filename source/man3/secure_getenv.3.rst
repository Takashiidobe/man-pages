.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getenv(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `VERSIONS <#VERSIONS>`__ \|    |                                   |
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

   GETENV(3)               Linux Programmer's Manual              GETENV(3)

NAME
-------------------------------------------------

::

          getenv, secure_getenv - get an environment variable


---------------------------------------------------------

::

          #include <stdlib.h>

          char *getenv(const char *name);
          char *secure_getenv(const char *name);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          secure_getenv():
              _GNU_SOURCE


---------------------------------------------------------------

::

          The getenv() function searches the environment list to find the
          environment variable name, and returns a pointer to the
          corresponding value string.

          The GNU-specific secure_getenv() function is just like getenv()
          except that it returns NULL in cases where "secure execution" is
          required.  Secure execution is required if one of the following
          conditions was true when the program run by the calling process
          was loaded:

          *  the process's effective user ID did not match its real user ID
             or the process's effective group ID did not match its real
             group ID (typically this is the result of executing a set-
             user-ID or set-group-ID program);

          *  the effective capability bit was set on the executable file;
             or

          *  the process has a nonempty permitted capability set.

          Secure execution may also be required if triggered by some Linux
          security modules.

          The secure_getenv() function is intended for use in general-
          purpose libraries to avoid vulnerabilities that could occur if
          set-user-ID or set-group-ID programs accidentally trusted the
          environment.


-----------------------------------------------------------------

::

          The getenv() function returns a pointer to the value in the
          environment, or NULL if there is no match.


---------------------------------------------------------

::

          secure_getenv() first appeared in glibc 2.17.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────┬───────────────┬─────────────┐
          │Interface                         │ Attribute     │ Value       │
          ├──────────────────────────────────┼───────────────┼─────────────┤
          │getenv(), secure_getenv()         │ Thread safety │ MT-Safe env │
          └──────────────────────────────────┴───────────────┴─────────────┘


-------------------------------------------------------------------

::

          getenv(): POSIX.1-2001, POSIX.1-2008, C89, C99, SVr4, 4.3BSD.

          secure_getenv() is a GNU extension.


---------------------------------------------------

::

          The strings in the environment list are of the form name=value.

          As typically implemented, getenv() returns a pointer to a string
          within the environment list.  The caller must take care not to
          modify this string, since that would change the environment of
          the process.

          The implementation of getenv() is not required to be reentrant.
          The string pointed to by the return value of getenv() may be
          statically allocated, and can be modified by a subsequent call to
          getenv(), putenv(3), setenv(3), or unsetenv(3).

          The "secure execution" mode of secure_getenv() is controlled by
          the AT_SECURE flag contained in the auxiliary vector passed from
          the kernel to user space.


---------------------------------------------------------

::

          clearenv(3), getauxval(3), putenv(3), setenv(3), unsetenv(3),
          capabilities(7), environ(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      GETENV(3)

--------------

Pages that refer to this page:
`clearenv(3) <../man3/clearenv.3.html>`__, 
`getauxval(3) <../man3/getauxval.3.html>`__, 
`pmgetconfig(3) <../man3/pmgetconfig.3.html>`__, 
`putenv(3) <../man3/putenv.3.html>`__, 
`setenv(3) <../man3/setenv.3.html>`__, 
`tzset(3) <../man3/tzset.3.html>`__, 
`attributes(7) <../man7/attributes.7.html>`__, 
`environ(7) <../man7/environ.7.html>`__, 
`groff_diff(7) <../man7/groff_diff.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/getenv.3.license.html>`__

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
