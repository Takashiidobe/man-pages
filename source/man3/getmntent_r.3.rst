.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getmntent(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
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

   GETMNTENT(3)            Linux Programmer's Manual           GETMNTENT(3)

NAME
-------------------------------------------------

::

          getmntent, setmntent, addmntent, endmntent, hasmntopt,
          getmntent_r - get filesystem descriptor file entry


---------------------------------------------------------

::

          #include <stdio.h>
          #include <mntent.h>

          FILE *setmntent(const char *filename, const char *type);

          struct mntent *getmntent(FILE *stream);

          int addmntent(FILE *restrict stream,
                        const struct mntent *restrict mnt);

          int endmntent(FILE *streamp);

          char *hasmntopt(const struct mntent *mnt, const char *opt);

          /* GNU extension */
          #include <mntent.h>

          struct mntent *getmntent_r(FILE *restrict streamp,
                        struct mntent *restrict mntbuf,
                        char *restrict buf, int buflen);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          getmntent_r():
              Since glibc 2.19:
                  _DEFAULT_SOURCE
              Glibc 2.19 and earlier:
                  _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          These routines are used to access the filesystem description file
          /etc/fstab and the mounted filesystem description file /etc/mtab.

          The setmntent() function opens the filesystem description file
          filename and returns a file pointer which can be used by
          getmntent().  The argument type is the type of access required
          and can take the same values as the mode argument of fopen(3).
          The returned stream should be closed using endmntent() rather
          than fclose(3).

          The getmntent() function reads the next line of the filesystem
          description file from stream and returns a pointer to a structure
          containing the broken out fields from a line in the file.  The
          pointer points to a static area of memory which is overwritten by
          subsequent calls to getmntent().

          The addmntent() function adds the mntent structure mnt to the end
          of the open stream.

          The endmntent() function closes the stream associated with the
          filesystem description file.

          The hasmntopt() function scans the mnt_opts field (see below) of
          the mntent structure mnt for a substring that matches opt.  See
          <mntent.h> and mount(8) for valid mount options.

          The reentrant getmntent_r() function is similar to getmntent(),
          but stores the struct mount in the provided *mntbuf and stores
          the strings pointed to by the entries in that struct in the
          provided array buf of size buflen.

          The mntent structure is defined in <mntent.h> as follows:

              struct mntent {
                  char *mnt_fsname;   /* name of mounted filesystem */
                  char *mnt_dir;      /* filesystem path prefix */
                  char *mnt_type;     /* mount type (see mntent.h) */
                  char *mnt_opts;     /* mount options (see mntent.h) */
                  int   mnt_freq;     /* dump frequency in days */
                  int   mnt_passno;   /* pass number on parallel fsck */
              };

          Since fields in the mtab and fstab files are separated by
          whitespace, octal escapes are used to represent the characters
          space (\040), tab (\011), newline (\012), and backslash (\\) in
          those files when they occur in one of the four strings in a
          mntent structure.  The routines addmntent() and getmntent() will
          convert from string representation to escaped representation and
          back.  When converting from escaped representation, the sequence
          \134 is also converted to a backslash.


-----------------------------------------------------------------

::

          The getmntent() and getmntent_r() functions return a pointer to
          the mntent structure or NULL on failure.

          The addmntent() function returns 0 on success and 1 on failure.

          The endmntent() function always returns 1.

          The hasmntopt() function returns the address of the substring if
          a match is found and NULL otherwise.


---------------------------------------------------

::

          /etc/fstab
                 filesystem description file

          /etc/mtab
                 mounted filesystem description file


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────┬───────────────┬─────────────────────────────────┐
          │Interface     │ Attribute     │ Value                           │
          ├──────────────┼───────────────┼─────────────────────────────────┤
          │setmntent(),  │ Thread safety │ MT-Safe                         │
          │endmntent(),  │               │                                 │
          │hasmntopt()   │               │                                 │
          ├──────────────┼───────────────┼─────────────────────────────────┤
          │getmntent()   │ Thread safety │ MT-Unsafe race:mntentbuf locale │
          ├──────────────┼───────────────┼─────────────────────────────────┤
          │addmntent()   │ Thread safety │ MT-Safe race:stream locale      │
          ├──────────────┼───────────────┼─────────────────────────────────┤
          │getmntent_r() │ Thread safety │ MT-Safe locale                  │
          └──────────────┴───────────────┴─────────────────────────────────┘


-------------------------------------------------------------------

::

          The nonreentrant functions are from SunOS 4.1.3.  A routine
          getmntent_r() was introduced in HP-UX 10, but it returns an int.
          The prototype shown above is glibc-only.


---------------------------------------------------

::

          System V also has a getmntent() function but the calling sequence
          differs, and the returned structure is different.  Under System V
          /etc/mnttab is used.  4.4BSD and Digital UNIX have a routine
          getmntinfo(), a wrapper around the system call getfsstat().


---------------------------------------------------------

::

          fopen(3), fstab(5), mount(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                   GETMNTENT(3)

--------------

Pages that refer to this page:
`getfsent(3) <../man3/getfsent.3.html>`__, 
`fstab(5) <../man5/fstab.5.html>`__

--------------

`Copyright and license for this manual
page <../man3/getmntent.3.license.html>`__

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
