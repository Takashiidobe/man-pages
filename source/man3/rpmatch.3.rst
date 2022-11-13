.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rpmatch(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RPMATCH(3)              Linux Programmer's Manual             RPMATCH(3)

NAME
-------------------------------------------------

::

          rpmatch - determine if the answer to a question is affirmative or
          negative


---------------------------------------------------------

::

          #include <stdlib.h>

          int rpmatch(const char *response);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          rpmatch():
              Since glibc 2.19:
                  _DEFAULT_SOURCE
              Glibc 2.19 and earlier:
                  _SVID_SOURCE


---------------------------------------------------------------

::

          rpmatch() handles a user response to yes or no questions, with
          support for internationalization.

          response should be a null-terminated string containing a user-
          supplied response, perhaps obtained with fgets(3) or getline(3).

          The user's language preference is taken into account per the
          environment variables LANG, LC_MESSAGES, and LC_ALL, if the
          program has called setlocale(3) to effect their changes.

          Regardless of the locale, responses matching ^[Yy] are always
          accepted as affirmative, and those matching ^[Nn] are always
          accepted as negative.


-----------------------------------------------------------------

::

          After examining response, rpmatch() returns 0 for a recognized
          negative response ("no"), 1 for a recognized positive response
          ("yes"), and -1 when the value of response is unrecognized.


-----------------------------------------------------

::

          A return value of -1 may indicate either an invalid input, or
          some other error.  It is incorrect to only test if the return
          value is nonzero.

          rpmatch() can fail for any of the reasons that regcomp(3) or
          regexec(3) can fail; the cause of the error is not available from
          errno or anywhere else, but indicates a failure of the regex
          engine (but this case is indistinguishable from that of an
          unrecognized value of response).


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │rpmatch()                      │ Thread safety │ MT-Safe locale │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          rpmatch() is not required by any standard, but is available on a
          few other systems.


-------------------------------------------------

::

          The rpmatch() implementation looks at only the first character of
          response.  As a consequence, "nyes" returns 0, and "ynever; not
          in a million years" returns 1.  It would be preferable to accept
          input strings much more strictly, for example (using the extended
          regular expression notation described in regex(7)):
          ^([yY]|yes|YES)$ and ^([nN]|no|NO)$.


---------------------------------------------------------

::

          The following program displays the results when rpmatch() is
          applied to the string given in the program's command-line
          argument.

          #define _SVID_SOURCE
          #include <locale.h>
          #include <stdlib.h>
          #include <string.h>
          #include <stdio.h>

          int
          main(int argc, char *argv[])
          {
              if (argc != 2 || strcmp(argv[1], "--help") == 0) {
                  fprintf(stderr, "%s response\n", argv[0]);
                  exit(EXIT_FAILURE);
              }

              setlocale(LC_ALL, "");
              printf("rpmatch() returns: %d\n", rpmatch(argv[1]));
              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          fgets(3), getline(3), nl_langinfo(3), regcomp(3), setlocale(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                     RPMATCH(3)

--------------

Pages that refer to this page:
`setlocale(3) <../man3/setlocale.3.html>`__, 
`locale(7) <../man7/locale.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/rpmatch.3.license.html>`__

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
