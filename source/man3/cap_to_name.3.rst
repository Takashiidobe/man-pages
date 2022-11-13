.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cap_from_text(3) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `TEXTUAL REPRESENTA               |                                   |
| TION <#TEXTUAL_REPRESENTATION>`__ |                                   |
| \|                                |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `EXAMPLE <#EXAMPLE>`__ \|      |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CAP_FROM_TEXT(3)        Linux Programmer's Manual       CAP_FROM_TEXT(3)

NAME
-------------------------------------------------

::

          cap_from_text, cap_to_text, cap_to_name, cap_from_name -
          capability state textual representation translation


---------------------------------------------------------

::

          #include <sys/capability.h>

          cap_t cap_from_text(const char* buf_p );
          char *cap_to_text(cap_t caps, ssize_t * length_p);
          int cap_from_name(const char* name , cap_value_t* cap_p);
          char *cap_to_name(cap_value_t cap);

          Link with -lcap.


---------------------------------------------------------------

::

          These functions translate a capability state between an internal
          representation and a textual one.  The internal representation is
          managed by the capability functions in working storage. The
          textual representation is a structured, human-readable string
          suitable for display.

          cap_from_text() allocates and initializes a capability state in
          working storage. It then sets the contents of this newly created
          capability state to the state represented by a human-readable,
          nul-terminated character string pointed to by buf_p.  It returns
          a pointer to the newly created capability state.  When the
          capability state in working storage is no longer required, the
          caller should free any releasable memory by calling cap_free()
          with cap_t as an argument.  The function returns an error if it
          cannot parse the contents of the string pointed to by buf_p or
          does not recognize any capability_name or flag character as
          valid.  The function also returns an error if any flag is both
          set and cleared within a single clause.

          cap_to_text() converts the capability state in working storage
          identified by cap_p into a nul-terminated human-readable string.
          This function allocates any memory necessary to contain the
          string, and returns a pointer to the string.  If the pointer
          len_p is not NULL, the function shall also return the full length
          of the string (not including the nul terminator) in the location
          pointed to by len_p.  The capability state in working storage,
          identified by cap_p, is completely represented in the character
          string.  When the capability state in working storage is no
          longer required, the caller should free any releasable memory by
          calling cap_free() with the returned string pointer as an
          argument.

          cap_from_name() converts a text representation of a capability,
          such as "cap_chown", to its numerical representation
          (CAP_CHOWN=0), writing the decoded value into *cap_p.  If cap_p
          is NULL no result is written, but the return code of the function
          indicates whether or not the specified capability can be
          represented by the library.

          cap_to_name() converts a capability index value, cap, to a
          libcap-allocated textual string. This string should be
          deallocated with cap_free().


-------------------------------------------------------------------------------------

::

          A textual representation of capability sets consists of one or
          more whitespace-separated clauses.  Each clause specifies some
          operations on a capability set; the set starts out with all
          capabilities lowered, and the meaning of the string is the state
          of the capability set after all the clauses have been applied in
          order.

          Each clause consists of a list of comma-separated capability
          names (or the word `all'), followed by an action-list.  An
          action-list consists of a sequence of operator flag pairs.  Legal
          operators are: `=', '+', and `-'.  Legal flags are: `e', `i', and
          `p'.  These flags are case-sensitive and specify the Effective,
          Inheritable and Permitted sets respectively.

          In the capability name lists, all names are case-insensitive.
          The special name `all' specifies all capabilities; it is
          equivalent to a list naming every capability individually.

          Unnamed capabilities can also be specified by number. This
          feature ensures that libcap can support capabilities that were
          not allocated at the time libcap was compiled. However, generally
          upgrading libcap will add names for recently allocated
          capabilities.

          The `=' operator indicates that the listed capabilities are first
          reset in all three capability sets.  The subsequent flags (which
          are optional when associated with this operator) indicate that
          the listed capabilities for the corresponding set are to be
          raised.  For example: "all=p" means lower every capability in the
          Effective and Inheritable sets but raise all of the Permitted
          capabilities; or, "cap_fowner=ep" means raise the Effective and
          Permitted override-file-ownership capability, while lowering this
          Inheritable capability.

          In the case that the leading operator is `=', and no list of
          capabilities is provided, the action-list is assumed to refer to
          `all' capabilities.  For example, the following three clauses are
          equivalent to each other (and indicate a completely empty
          capability set): "all="; "="; "cap_chown,<every-other-
          capability>=".

          The operators, `+' and `-' both require an explicit preceding
          capability list and one or more explicit trailing flags.  The `+'
          operator will raise all of the listed capabilities in the flagged
          capability sets.  The `-' operator will lower all of the listed
          capabilities in the flagged capability sets.  For example:
          "all+p" will raise all of the Permitted capabilities and
          "cap_fowner-i" will lower the override-file-ownership in the
          Inheritable set.

          The action list can consist of multiple operator flag pairs; the
          actions are performed in left-to-right order.  Thus, for example,
          "cap_fowner+p-i" is equivalent to "cap_fowner+p cap_fowner-i".
          As another example, "cap_fowner+pe-i" and "cap_fowner=+pe" are
          equivalent.


-----------------------------------------------------------------

::

          cap_from_text(), cap_to_text() and cap_to_name() return a non-
          NULL value on success, and NULL on failure.  cap_from_name()
          returns 0 for success, and -1 on failure (unknown capability).

          On failure, errno is set to EINVAL, or ENOMEM.


-------------------------------------------------------------------

::

          cap_from_text() and cap_to_text() are specified by the withdrawn
          POSIX.1e draft specification.  cap_from_name() and cap_to_name()
          are Linux extensions.


-------------------------------------------------------

::

          The example program below demonstrates the use of cap_from_text()
          and cap_to_text().  The following shell session shows some
          example runs:

          $ ./a.out "cap_chown=p cap_chown+e"
          caps_to_text() returned "cap_chown=ep"
          $ ./a.out "all=pe cap_chown-e cap_kill-pe"
          caps_to_text() returned "=ep cap_chown-e cap_kill-ep"

          The source code of the program is as follows:

          #include <stdlib.h>
          #include <stdio.h>
          #include <sys/capability.h>

          #define handle_error(msg) \
              do { perror(msg); exit(EXIT_FAILURE); } while (0)

          int
          main(int argc, char *argv[])
          {
              cap_t caps;
              char *txt_caps;

              if (argc != 2) {
                  fprintf(stderr, "%s <textual-cap-set>\n", argv[0]);
                  exit(EXIT_FAILURE);
              }

              caps = cap_from_text(argv[1]);
              if (caps == NULL)
                  handle_error("cap_from_text");

              txt_caps = cap_to_text(caps, NULL);
              if (txt_caps == NULL)
                  handle_error("cap_to_text");

              printf("caps_to_text() returned \"%s\"\n", txt_caps);

              if (cap_free(txt_caps) != 0 || cap_free(caps) != 0)
                  handle_error("cap_free");

              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          libcap(3), cap_clear(3), cap_copy_ext(3), cap_get_file(3),
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

                                  2021-03-06               CAP_FROM_TEXT(3)

--------------

Pages that refer to this page: `capsh(1) <../man1/capsh.1.html>`__, 
`cap_clear(3) <../man3/cap_clear.3.html>`__, 
`cap_copy_ext(3) <../man3/cap_copy_ext.3.html>`__, 
`cap_get_file(3) <../man3/cap_get_file.3.html>`__, 
`cap_get_proc(3) <../man3/cap_get_proc.3.html>`__, 
`cap_init(3) <../man3/cap_init.3.html>`__, 
`libcap(3) <../man3/libcap.3.html>`__, 
`org.freedesktop.systemd1(5) <../man5/org.freedesktop.systemd1.5.html>`__, 
`systemd-system.conf(5) <../man5/systemd-system.conf.5.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__, 
`getcap(8) <../man8/getcap.8.html>`__, 
`getpcaps(8) <../man8/getpcaps.8.html>`__, 
`setcap(8) <../man8/setcap.8.html>`__

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
