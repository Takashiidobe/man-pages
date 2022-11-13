.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

strcpy(3p) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `RATIONALE <#RATIONALE>`__ \|  |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STRCPY(3P)              POSIX Programmer's Manual             STRCPY(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          stpcpy, strcpy — copy a string and return a pointer to the end of
          the result


---------------------------------------------------------

::

          #include <string.h>

          char *stpcpy(char *restrict s1, const char *restrict s2);
          char *strcpy(char *restrict s1, const char *restrict s2);


---------------------------------------------------------------

::

          For strcpy(): The functionality described on this reference page
          is aligned with the ISO C standard. Any conflict between the
          requirements described here and the ISO C standard is
          unintentional. This volume of POSIX.1‐2017 defers to the ISO C
          standard.

          The stpcpy() and strcpy() functions shall copy the string pointed
          to by s2 (including the terminating NUL character) into the array
          pointed to by s1.

          If copying takes place between objects that overlap, the behavior
          is undefined.


-----------------------------------------------------------------

::

          The stpcpy() function shall return a pointer to the terminating
          NUL character copied into the s1 buffer.

          The strcpy() function shall return s1.

          No return values are reserved to indicate an error.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

      Construction of a Multi-Part Message in a Single Buffer
              #include <string.h>
              #include <stdio.h>

              int
              main (void)
              {
                  char buffer [10];
                  char *name = buffer;

                  name = stpcpy (stpcpy (stpcpy (name, "ice"),"-"), "cream");
                  puts (buffer);
                  return 0;
              }

      Initializing a String
          The following example copies the string "----------" into the
          permstring variable.

              #include <string.h>
              ...
              static char permstring[11];
              ...
              strcpy(permstring, "----------");
              ...

      Storing a Key and Data
          The following example allocates space for a key using malloc()
          then uses strcpy() to place the key there. Then it allocates
          space for data using malloc(), and uses strcpy() to place data
          there. (The user-defined function dbfree() frees memory
          previously allocated to an array of type struct element *.)

              #include <string.h>
              #include <stdlib.h>
              #include <stdio.h>
              ...
              /* Structure used to read data and store it. */
              struct element {
                  char *key;
                  char *data;
              };

              struct element *tbl, *curtbl;
              char *key, *data;
              int count;
              ...
              void dbfree(struct element *, int);
              ...
              if ((curtbl->key = malloc(strlen(key) + 1)) == NULL) {
                  perror("malloc"); dbfree(tbl, count); return NULL;
              }
              strcpy(curtbl->key, key);

              if ((curtbl->data = malloc(strlen(data) + 1)) == NULL) {
                  perror("malloc"); free(curtbl->key); dbfree(tbl, count); return NULL;
              }
              strcpy(curtbl->data, data);
              ...


---------------------------------------------------------------------------

::

          Character movement is performed differently in different
          implementations. Thus, overlapping moves may yield surprises.

          This version is aligned with the ISO C standard; this does not
          affect compatibility with XPG3 applications. Reliable error
          detection by this function was never guaranteed.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          strncpy(3p), wcscpy(3p)

          The Base Definitions volume of POSIX.1‐2017, string.h(0p)


-----------------------------------------------------------

::

          Portions of this text are reprinted and reproduced in electronic
          form from IEEE Std 1003.1-2017, Standard for Information
          Technology -- Portable Operating System Interface (POSIX), The
          Open Group Base Specifications Issue 7, 2018 Edition, Copyright
          (C) 2018 by the Institute of Electrical and Electronics
          Engineers, Inc and The Open Group.  In the event of any
          discrepancy between this version and the original IEEE and The
          Open Group Standard, the original IEEE and The Open Group
          Standard is the referee document. The original Standard can be
          obtained online at http://www.opengroup.org/unix/online.html .

          Any typographical or formatting errors that appear in this page
          are most likely to have been introduced during the conversion of
          the source files to man page format. To report such errors, see
          https://www.kernel.org/doc/man-pages/reporting_bugs.html .

   IEEE/The Open Group               2017                        STRCPY(3P)

--------------

Pages that refer to this page:
`string.h(0p) <../man0/string.h.0p.html>`__, 
`localeconv(3p) <../man3/localeconv.3p.html>`__, 
`stpcpy(3p) <../man3/stpcpy.3p.html>`__, 
`strncpy(3p) <../man3/strncpy.3p.html>`__, 
`wcscpy(3p) <../man3/wcscpy.3p.html>`__

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
