.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

libcap(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \|                                |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LIBCAP(3)               Linux Programmer's Manual              LIBCAP(3)

NAME
-------------------------------------------------

::

          cap_clear, cap_clear_flag, cap_compare, cap_copy_ext,
          cap_copy_int, cap_free, cap_from_name, cap_from_text, cap_get_fd,
          cap_get_file, cap_get_flag, cap_get_pid, cap_get_proc,
          cap_set_fd, cap_set_file, cap_set_flag, cap_set_proc, cap_size,
          cap_to_name, cap_to_text, cap_get_pid, cap_dup - capability data
          object manipulation


---------------------------------------------------------

::

          #include <sys/capability.h>

          int cap_clear(cap_t cap_p);
          int cap_clear_flag(cap_t cap_p, cap_flag_t flag);
          int cap_compare(cap_t cap_a, cap_t cap_b);
          ssize_t cap_copy_ext(void *ext_p, cap_t cap_p, ssize_t size);
          cap_t cap_copy_int(const void *ext_p);
          int cap_free(void *obj_d);
          int cap_from_name(const char *name, cap_value_t *cap_p);
          cap_t cap_from_text(const char *buf_p);
          cap_t cap_get_fd(int fd);
          cap_t cap_get_file(const char *path_p);
          int cap_get_flag(cap_t cap_p, cap_value_t cap ,
                           cap_flag_t flag, cap_flag_value_t *value_p);

          #include <sys/types.h>

          cap_t cap_get_pid(pid_t pid);
          cap_t cap_get_proc(void);
          int cap_set_fd(int fd, cap_t caps);
          int cap_set_file(const char *path_p, cap_t cap_p);
          int cap_set_flag(cap_t cap_p, cap_flag_t flag, int ncap ,
                           const cap_value_t *caps, cap_flag_value_t value);
          int cap_set_proc(cap_t cap_p);
          ssize_t cap_size(cap_t cap_p);
          char *cap_to_name(cap_value_t cap);
          char *cap_to_text(cap_t caps, ssize_t *length_p);
          cap_t cap_get_pid(pid_t pid);
          cap_t cap_dup(cap_t cap_p);

          Link with -lcap.


---------------------------------------------------------------

::

          These functions work on a capability state held in working
          storage.  A cap_t holds information about the capabilities in
          each of the three sets, Permitted, Inheritable, and Effective.
          Each capability in a set may be clear (disabled, 0) or set
          (enabled, 1).

          These functions work with the following data types:

          cap_value_t
                 identifies a capability, such as CAP_CHOWN.

          cap_flag_t
                 identifies one of the three flags associated with a
                 capability (i.e., it identifies one of the three
                 capability sets).  Valid values for this type are
                 CAP_EFFECTIVE, CAP_INHERITABLE or CAP_PERMITTED.

          cap_flag_value_t
                 identifies the setting of a particular capability flag
                 (i.e, the value of a capability in a set).  Valid values
                 for this type are CAP_CLEAR(0) or CAP_SET(1).


-----------------------------------------------------------------

::

          The return value is generally specific to the individual function
          called.  On failure, errno is set appropriately.


-------------------------------------------------------------------

::

          These functions are as per the withdrawn POSIX.1e draft
          specification.  The following functions are Linux extensions:
          cap_clear_flag(), cap_from_name(), cap_to_name(), and
          cap_compare().


---------------------------------------------------------------------

::

          The libcap library is distributed from
          https://sites.google.com/site/fullycapable/ where the release
          notes may already cover recent issues.  Please report newly
          discovered bugs via:

          https://bugzilla.kernel.org/buglist.cgi?component=libcap&list_id=1090757


---------------------------------------------------------

::

          cap_clear(3), cap_copy_ext(3), cap_from_text(3), cap_get_file(3),
          cap_get_proc(3), cap_init(3), capabilities(7), getpid(2),
          capsh(1) and libpsx(3).

COLOPHON
---------------------------------------------------------

::

          This page is part of the libcap (capabilities commands and
          library) project.  Information about the project can be found at
          ⟨https://git.kernel.org/pub/scm/libs/libcap/libcap.git/⟩.  If you
          have a bug report for this manual page, send it to
          morgan@kernel.org (please put "libcap" in the Subject line).
          This page was obtained from the project's upstream Git repository
          ⟨https://git.kernel.org/pub/scm/libs/libcap/libcap.git/⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-25.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                  2021-03-06                      LIBCAP(3)

--------------

Pages that refer to this page: `capsh(1) <../man1/capsh.1.html>`__, 
`prctl(2) <../man2/prctl.2.html>`__, 
`cap_clear(3) <../man3/cap_clear.3.html>`__, 
`cap_copy_ext(3) <../man3/cap_copy_ext.3.html>`__, 
`cap_from_text(3) <../man3/cap_from_text.3.html>`__, 
`cap_get_file(3) <../man3/cap_get_file.3.html>`__, 
`cap_get_proc(3) <../man3/cap_get_proc.3.html>`__, 
`cap_iab(3) <../man3/cap_iab.3.html>`__, 
`cap_init(3) <../man3/cap_init.3.html>`__, 
`cap_launch(3) <../man3/cap_launch.3.html>`__, 
`libpsx(3) <../man3/libpsx.3.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__

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
