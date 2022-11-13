.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getsubopt(3p) — Linux manual page
=================================

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

   GETSUBOPT(3P)           POSIX Programmer's Manual          GETSUBOPT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          getsubopt — parse suboption arguments from a string


---------------------------------------------------------

::

          #include <stdlib.h>

          int getsubopt(char **optionp, char * const *keylistp, char **valuep);


---------------------------------------------------------------

::

          The getsubopt() function shall parse suboption arguments in a
          flag argument. Such options often result from the use of
          getopt().

          The getsubopt() argument optionp is a pointer to a pointer to the
          option argument string. The suboption arguments shall be
          separated by <comma> characters and each may consist of either a
          single token, or a token-value pair separated by an <equals-
          sign>.

          The keylistp argument shall be a pointer to a vector of strings.
          The end of the vector is identified by a null pointer. Each entry
          in the vector is one of the possible tokens that might be found
          in *optionp. Since <comma> characters delimit suboption arguments
          in optionp, they should not appear in any of the strings pointed
          to by keylistp.  Similarly, because an <equals-sign> separates a
          token from its value, the application should not include an
          <equals-sign> in any of the strings pointed to by keylistp.  The
          getsubopt() function shall not modify the keylistp vector.

          The valuep argument is the address of a value string pointer.

          If a <comma> appears in optionp, it shall be interpreted as a
          suboption separator. After <comma> characters have been
          processed, if there are one or more <equals-sign> characters in a
          suboption string, the first <equals-sign> in any suboption string
          shall be interpreted as a separator between a token and a value.
          Subsequent <equals-sign> characters in a suboption string shall
          be interpreted as part of the value.

          If the string at *optionp contains only one suboption argument
          (equivalently, no <comma> characters), getsubopt() shall update
          *optionp to point to the null character at the end of the string.
          Otherwise, it shall isolate the suboption argument by replacing
          the <comma> separator with a null character, and shall update
          *optionp to point to the start of the next suboption argument. If
          the suboption argument has an associated value (equivalently,
          contains an <equals-sign>), getsubopt() shall update *valuep to
          point to the value's first character.  Otherwise, it shall set
          *valuep to a null pointer. The calling application may use this
          information to determine whether the presence or absence of a
          value for the suboption is an error.

          Additionally, when getsubopt() fails to match the suboption
          argument with a token in the keylistp array, the calling
          application should decide if this is an error, or if the
          unrecognized option should be processed in another way.


-----------------------------------------------------------------

::

          The getsubopt() function shall return the index of the matched
          token string, or -1 if no token strings were matched.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

      Parsing Suboptions
          The following example uses the getsubopt() function to parse a
          value argument in the optarg external variable returned by a call
          to getopt().

              #include <stdio.h>
              #include <stdlib.h>
              #include <unistd.h>

              int do_all;
              const char *type;
              int read_size;
              int write_size;
              int read_only;

              enum
              {
                  RO_OPTION = 0,
                  RW_OPTION,
                  READ_SIZE_OPTION,
                  WRITE_SIZE_OPTION
              };

              const char *mount_opts[] =
              {
                  [RO_OPTION] = "ro",
                  [RW_OPTION] = "rw",
                  [READ_SIZE_OPTION] = "rsize",
                  [WRITE_SIZE_OPTION] = "wsize",
                  NULL
              };

              int
              main(int argc, char *argv[])
              {
                  char *subopts, *value;
                  int opt;

                  while ((opt = getopt(argc, argv, "at:o:")) != -1)
                      switch(opt)
                          {
                          case 'a':
                              do_all = 1;
                              break;
                          case 't':
                              type = optarg;
                              break;
                          case 'o':
                              subopts = optarg;
                              while (*subopts != ' ')
                              {
                                  char *saved = subopts;
                                  switch(getsubopt(&subopts, (char **)mount_opts,
                                      &value))
                                  {
                                  case RO_OPTION:
                                      read_only = 1;
                                      break;
                                  case RW_OPTION:
                                      read_only = 0;
                                      break;
                                  case READ_SIZE_OPTION:
                                      if (value == NULL)
                                          abort();
                                      read_size = atoi(value);
                                      break;
                                  case WRITE_SIZE_OPTION:
                                      if (value == NULL)
                                          abort();
                                      write_size = atoi(value);
                                      break;
                                  default:
                                      /* Unknown suboption. */
                                      printf("Unknown suboption `%s'\n", saved);
                                      abort();
                                  }
                              }
                              break;
                          default:
                              abort();
                          }

                  /* Do the real work. */

                  return 0;
              }

          If the above example is invoked with:

              program -o ro,rsize=512

          then after option parsing, the variable do_all will be 0, type
          will be a null pointer, read_size will be 512, write_size will be
          0, and read_only will be 1. If it is invoked with:

              program -o oops

          it will print:

              "Unknown suboption `oops'"

          before aborting.


---------------------------------------------------------------------------

::

          The value of *valuep when getsubopt() returns -1 is unspecified.
          Historical implementations provide various incompatible
          extensions to allow an application to access the suboption text
          that was not found in the keylistp array.


-----------------------------------------------------------

::

          The keylistp argument of getsubopt() is typed as char * const *
          to match historical practice. However, the standard is clear that
          implementations will not modify either the array or the strings
          contained in the array, as if the argument had been typed const
          char * const *.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          getopt(3p)

          The Base Definitions volume of POSIX.1‐2017, stdlib.h(0p)


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

   IEEE/The Open Group               2017                     GETSUBOPT(3P)

--------------

Pages that refer to this page:
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__

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
