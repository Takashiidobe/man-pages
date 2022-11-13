.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setenv(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SETENV(3)               Linux Programmer's Manual              SETENV(3)

NAME
-------------------------------------------------

::

          setenv - change or add an environment variable


---------------------------------------------------------

::

          #include <stdlib.h>

          int setenv(const char *name, const char *value, int overwrite);
          int unsetenv(const char *name);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          setenv(), unsetenv():
              _POSIX_C_SOURCE >= 200112L
                  || /* Glibc <= 2.19: */ _BSD_SOURCE


---------------------------------------------------------------

::

          The setenv() function adds the variable name to the environment
          with the value value, if name does not already exist.  If name
          does exist in the environment, then its value is changed to value
          if overwrite is nonzero; if overwrite is zero, then the value of
          name is not changed (and setenv() returns a success status).
          This function makes copies of the strings pointed to by name and
          value (by contrast with putenv(3)).

          The unsetenv() function deletes the variable name from the
          environment.  If name does not exist in the environment, then the
          function succeeds, and the environment is unchanged.


-----------------------------------------------------------------

::

          setenv() and unsetenv() functions return zero on success, or -1
          on error, with errno set to indicate the error.


-----------------------------------------------------

::

          EINVAL name is NULL, points to a string of length 0, or contains
                 an '=' character.

          ENOMEM Insufficient memory to add a new variable to the
                 environment.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────┬───────────────┬─────────────────────┐
          │Interface                 │ Attribute     │ Value               │
          ├──────────────────────────┼───────────────┼─────────────────────┤
          │setenv(), unsetenv()      │ Thread safety │ MT-Unsafe const:env │
          └──────────────────────────┴───────────────┴─────────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, 4.3BSD.


---------------------------------------------------

::

          POSIX.1 does not require setenv() or unsetenv() to be reentrant.

          Prior to glibc 2.2.2, unsetenv() was prototyped as returning
          void; more recent glibc versions follow the POSIX.1-compliant
          prototype shown in the SYNOPSIS.


-------------------------------------------------

::

          POSIX.1 specifies that if name contains an '=' character, then
          setenv() should fail with the error EINVAL; however, versions of
          glibc before 2.3.4 allowed an '=' sign in name.


---------------------------------------------------------

::

          clearenv(3), getenv(3), putenv(3), environ(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      SETENV(3)

--------------

Pages that refer to this page: `ul(1) <../man1/ul.1.html>`__, 
`clearenv(3) <../man3/clearenv.3.html>`__, 
`getenv(3) <../man3/getenv.3.html>`__, 
`pmgetconfig(3) <../man3/pmgetconfig.3.html>`__, 
`putenv(3) <../man3/putenv.3.html>`__, 
`environ(7) <../man7/environ.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/setenv.3.license.html>`__

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
