.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cap_clear(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CAP_CLEAR(3)            Linux Programmer's Manual           CAP_CLEAR(3)

NAME
-------------------------------------------------

::

          cap_clear, cap_clear_flag, cap_get_flag, cap_set_flag, cap_fill,
          cap_compare - capability data object manipulation


---------------------------------------------------------

::

          #include <sys/capability.h>

          int cap_clear(cap_t cap_p);
          int cap_clear_flag(cap_t cap_p, cap_flag_t flag);
          int cap_get_flag(cap_t cap_p, cap_value_t cap,
                           cap_flag_t flag, cap_flag_value_t *value_p);
          int cap_set_flag(cap_t cap_p, cap_flag_t flag, int ncap,
                           const cap_value_t *caps, cap_flag_value_t value);
          int cap_fill(cap_t cap_p, cap_flag_t to, cap_flag_t from);
          int cap_compare(cap_t cap_a, cap_t cap_b);

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
                 for this type are CAP_CLEAR (0) or CAP_SET (1).

          cap_clear() initializes the capability state in working storage
          identified by cap_p so that all capability flags are cleared.

          cap_clear_flag() clears all of the capabilities of the specified
          capability flag, flag.

          cap_get_flag() obtains the current value of the capability flag,
          flag, of the capability, cap, from the capability state
          identified by cap_p and places it in the location pointed to by
          value_p.

          cap_set_flag() sets the flag, flag, of each capability in the
          array caps in the capability state identified by cap_p to value.
          The argument, ncap, is used to specify the number of capabilities
          in the array, caps.

          cap_fill() fills the to flag values by copying all of the from
          flag values.

          cap_compare() compares two full capability sets and, in the
          spirit of memcmp(), returns zero if the two capability sets are
          identical. A positive return value, status, indicates there is a
          difference between them. The returned value carries further
          information about which of three sets, cap_flag_t flag, differ.
          Specifically, the macro CAP_DIFFERS (status, flag) evaluates to
          non-zero if the returned status differs in its flag components.


-----------------------------------------------------------------

::

          cap_clear(), cap_clear_flag(), cap_get_flag() cap_set_flag() and
          cap_compare() return zero on success, and -1 on failure. Other
          return values for cap_compare() are described above.

          On failure, errno is set to EINVAL, indicating that one of the
          arguments is invalid.


-------------------------------------------------------------------

::

          These functions are as per the withdrawn POSIX.1e draft
          specification.  cap_clear_flag() and cap_compare() are Linux
          extensions.


---------------------------------------------------------

::

          libcap(3), cap_copy_ext(3), cap_from_text(3), cap_get_file(3),
          cap_get_proc(3), cap_init(3), capabilities(7)

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

                                  2021-03-06                   CAP_CLEAR(3)

--------------

Pages that refer to this page:
`cap_copy_ext(3) <../man3/cap_copy_ext.3.html>`__, 
`cap_from_text(3) <../man3/cap_from_text.3.html>`__, 
`cap_get_file(3) <../man3/cap_get_file.3.html>`__, 
`cap_get_proc(3) <../man3/cap_get_proc.3.html>`__, 
`cap_init(3) <../man3/cap_init.3.html>`__, 
`libcap(3) <../man3/libcap.3.html>`__, 
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
