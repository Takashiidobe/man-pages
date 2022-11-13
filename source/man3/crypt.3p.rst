.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

crypt(3p) — Linux manual page
=============================

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

   CRYPT(3P)               POSIX Programmer's Manual              CRYPT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          crypt — string encoding function (CRYPT)


---------------------------------------------------------

::

          #include <unistd.h>

          char *crypt(const char *key, const char *salt);


---------------------------------------------------------------

::

          The crypt() function is a string encoding function. The algorithm
          is implementation-defined.

          The key argument points to a string to be encoded. The salt
          argument shall be a string of at least two bytes in length not
          including the null character chosen from the set:

              a b c d e f g h i j k l m n o p q r s t u v w x y z
              A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
              0 1 2 3 4 5 6 7 8 9 . /

          The first two bytes of this string may be used to perturb the
          encoding algorithm.

          The return value of crypt() points to static data that is
          overwritten by each call.

          The crypt() function need not be thread-safe.


-----------------------------------------------------------------

::

          Upon successful completion, crypt() shall return a pointer to the
          encoded string. The first two bytes of the returned value shall
          be those of the salt argument. Otherwise, it shall return a null
          pointer and set errno to indicate the error.


-----------------------------------------------------

::

          The crypt() function shall fail if:

          ENOSYS The functionality is not supported on this implementation.

          The following sections are informative.


---------------------------------------------------------

::

      Encoding Passwords
          The following example finds a user database entry matching a
          particular user name and changes the current password to a new
          password. The crypt() function generates an encoded version of
          each password. The first call to crypt() produces an encoded
          version of the old password; that encoded password is then
          compared to the password stored in the user database. The second
          call to crypt() encodes the new password before it is stored.

          The putpwent() function, used in the following example, is not
          part of POSIX.1‐2008.

              #include <unistd.h>
              #include <pwd.h>
              #include <string.h>
              #include <stdio.h>
              ...
              int valid_change;
              int pfd;  /* Integer for file descriptor returned by open(). */
              FILE *fpfd;  /* File pointer for use in putpwent(). */
              struct passwd *p;
              char user[100];
              char oldpasswd[100];
              char newpasswd[100];
              char savepasswd[100];
              ...
              valid_change = 0;
              while ((p = getpwent()) != NULL) {
                  /* Change entry if found. */
                  if (strcmp(p->pw_name, user) == 0) {
                      if (strcmp(p->pw_passwd, crypt(oldpasswd, p->pw_passwd)) == 0) {
                          strcpy(savepasswd, crypt(newpasswd, user));
                          p->pw_passwd = savepasswd;
                          valid_change = 1;
                      }
                      else {
                          fprintf(stderr, "Old password is not valid\n");
                      }
                  }
                  /* Put passwd entry into ptmp. */
                  putpwent(p, fpfd);
              }


---------------------------------------------------------------------------

::

          The values returned by this function need not be portable among
          XSI-conformant systems.

          Several implementations offer extensions via characters outside
          of the set specified for the salt argument for specifying
          alternative algorithms; while not portable, these extensions may
          offer better security. The use of crypt() for anything other than
          password hashing is not recommended.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          encrypt(3p), setkey(3p)

          The Base Definitions volume of POSIX.1‐2017, unistd.h(0p)


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

   IEEE/The Open Group               2017                         CRYPT(3P)

--------------

Pages that refer to this page:
`unistd.h(0p) <../man0/unistd.h.0p.html>`__, 
`encrypt(3p) <../man3/encrypt.3p.html>`__, 
`setkey(3p) <../man3/setkey.3p.html>`__

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
