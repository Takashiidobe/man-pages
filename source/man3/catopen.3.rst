.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

catopen(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ENVIRONMENT <#ENVIRONMENT>`__ |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CATOPEN(3)              Linux Programmer's Manual             CATOPEN(3)

NAME
-------------------------------------------------

::

          catopen, catclose - open/close a message catalog


---------------------------------------------------------

::

          #include <nl_types.h>

          nl_catd catopen(const char *name, int flag);
          int catclose(nl_catd catalog);


---------------------------------------------------------------

::

          The function catopen() opens a message catalog and returns a
          catalog descriptor.  The descriptor remains valid until
          catclose() or execve(2).  If a file descriptor is used to
          implement catalog descriptors, then the FD_CLOEXEC flag will be
          set.

          The argument name specifies the name of the message catalog to be
          opened.  If name specifies an absolute path (i.e., contains a
          '/'), then name specifies a pathname for the message catalog.
          Otherwise, the environment variable NLSPATH is used with name
          substituted for %N (see locale(7)).  It is unspecified whether
          NLSPATH will be used when the process has root privileges.  If
          NLSPATH does not exist in the environment, or if a message
          catalog cannot be opened in any of the paths specified by it,
          then an implementation defined path is used.  This latter default
          path may depend on the LC_MESSAGES locale setting when the flag
          argument is NL_CAT_LOCALE and on the LANG environment variable
          when the flag argument is 0.  Changing the LC_MESSAGES part of
          the locale may invalidate open catalog descriptors.

          The flag argument to catopen() is used to indicate the source for
          the language to use.  If it is set to NL_CAT_LOCALE, then it will
          use the current locale setting for LC_MESSAGES.  Otherwise, it
          will use the LANG environment variable.

          The function catclose() closes the message catalog identified by
          catalog.  It invalidates any subsequent references to the message
          catalog defined by catalog.


-----------------------------------------------------------------

::

          The function catopen() returns a message catalog descriptor of
          type nl_catd on success.  On failure, it returns (nl_catd) -1 and
          sets errno to indicate the error.  The possible error values
          include all possible values for the open(2) call.

          The function catclose() returns 0 on success, or -1 on failure.


---------------------------------------------------------------

::

          LC_MESSAGES
                 May be the source of the LC_MESSAGES locale setting, and
                 thus determine the language to use if flag is set to
                 NL_CAT_LOCALE.

          LANG   The language to use if flag is 0.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────┬───────────────┬─────────────┐
          │Interface                         │ Attribute     │ Value       │
          ├──────────────────────────────────┼───────────────┼─────────────┤
          │catopen()                         │ Thread safety │ MT-Safe env │
          ├──────────────────────────────────┼───────────────┼─────────────┤
          │catclose()                        │ Thread safety │ MT-Safe     │
          └──────────────────────────────────┴───────────────┴─────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          The above is the POSIX.1 description.  The glibc value for
          NL_CAT_LOCALE is 1.  The default path varies, but usually looks
          at a number of places below /usr/share/locale.


---------------------------------------------------------

::

          catgets(3), setlocale(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                     CATOPEN(3)

--------------

Pages that refer to this page: `catgets(3) <../man3/catgets.3.html>`__, 
`environ(7) <../man7/environ.7.html>`__, 
`locale(7) <../man7/locale.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/catopen.3.license.html>`__

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
