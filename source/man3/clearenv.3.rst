.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

clearenv(3) — Linux manual page
===============================

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

   CLEARENV(3)             Linux Programmer's Manual            CLEARENV(3)

NAME
-------------------------------------------------

::

          clearenv - clear the environment


---------------------------------------------------------

::

          #include <stdlib.h>

          int clearenv(void);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          clearenv():
              /* Glibc since 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _SVID_SOURCE || _BSD_SOURCE


---------------------------------------------------------------

::

          The clearenv() function clears the environment of all name-value
          pairs and sets the value of the external variable environ to
          NULL.  After this call, new variables can be added to the
          environment using putenv(3) and setenv(3).


-----------------------------------------------------------------

::

          The clearenv() function returns zero on success, and a nonzero
          value on failure.


---------------------------------------------------------

::

          Available since glibc 2.0.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────┬───────────────┬─────────────────────┐
          │Interface                 │ Attribute     │ Value               │
          ├──────────────────────────┼───────────────┼─────────────────────┤
          │clearenv()                │ Thread safety │ MT-Unsafe const:env │
          └──────────────────────────┴───────────────┴─────────────────────┘


-------------------------------------------------------------------

::

          Various UNIX variants (DG/UX, HP-UX, QNX, ...).  POSIX.9
          (bindings for FORTRAN77).  POSIX.1-1996 did not accept clearenv()
          and putenv(3), but changed its mind and scheduled these functions
          for some later issue of this standard (see §B.4.6.1).  However,
          POSIX.1-2001 adds only putenv(3), and rejected clearenv().


---------------------------------------------------

::

          On systems where clearenv() is unavailable, the assignment

              environ = NULL;

          will probably do.

          The clearenv() function may be useful in security-conscious
          applications that want to precisely control the environment that
          is passed to programs executed using exec(3).  The application
          would do this by first clearing the environment and then adding
          select environment variables.

          Note that the main effect of clearenv() is to adjust the value of
          the pointer environ(7); this function does not erase the contents
          of the buffers containing the environment definitions.

          The DG/UX and Tru64 man pages write: If environ has been modified
          by anything other than the putenv(3), getenv(3), or clearenv()
          functions, then clearenv() will return an error and the process
          environment will remain unchanged.


---------------------------------------------------------

::

          getenv(3), putenv(3), setenv(3), unsetenv(3), environ(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                    CLEARENV(3)

--------------

Pages that refer to this page: `getenv(3) <../man3/getenv.3.html>`__, 
`putenv(3) <../man3/putenv.3.html>`__, 
`setenv(3) <../man3/setenv.3.html>`__, 
`environ(7) <../man7/environ.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/clearenv.3.license.html>`__

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
