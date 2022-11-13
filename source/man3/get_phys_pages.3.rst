.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

get_phys_pages(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
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

   GET_PHYS_PAGES(3)       Linux Programmer's Manual      GET_PHYS_PAGES(3)

NAME
-------------------------------------------------

::

          get_phys_pages, get_avphys_pages - get total and available
          physical page counts


---------------------------------------------------------

::

          #include <sys/sysinfo.h>

          long get_phys_pages(void);
          long get_avphys_pages(void);


---------------------------------------------------------------

::

          The function get_phys_pages() returns the total number of
          physical pages of memory available on the system.

          The function get_avphys_pages() returns the number of currently
          available physical pages of memory on the system.


-----------------------------------------------------------------

::

          On success, these functions return a nonnegative value as given
          in DESCRIPTION.  On failure, they return -1 and set errno to
          indicate the error.


-----------------------------------------------------

::

          ENOSYS The system could not provide the required information
                 (possibly because the /proc filesystem was not mounted).


-------------------------------------------------------------------

::

          These functions are GNU extensions.


---------------------------------------------------

::

          Before glibc 2.23, these functions obtained the required
          information by scanning the MemTotal and MemFree fields of
          /proc/meminfo.  Since glibc 2.23, these functions obtain the
          required information by calling sysinfo(2).

          The following sysconf(3) calls provide a portable means of
          obtaining the same information as the functions described on this
          page.

              total_pages = sysconf(_SC_PHYS_PAGES);    /* total pages */
              avl_pages = sysconf(_SC_AVPHYS_PAGES);    /* available pages */


---------------------------------------------------------

::

          The following example shows how get_phys_pages() and
          get_avphys_pages() can be used.

          #include <stdio.h>
          #include <stdlib.h>
          #include <sys/sysinfo.h>

          int
          main(int argc, char *argv[])
          {
              printf("This system has %ld pages of physical memory and "
                      "%ld pages of physical memory available.\n",
                      get_phys_pages(), get_avphys_pages());
              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          sysconf(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22              GET_PHYS_PAGES(3)

--------------

Pages that refer to this page:
`undocumented(3) <../man3/undocumented.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/get_phys_pages.3.license.html>`__

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
