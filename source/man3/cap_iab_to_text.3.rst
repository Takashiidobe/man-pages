.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cap_iab(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ERRORS <#ERRORS>`__ \|           |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CAP_IAB(3)              Linux Programmer's Manual             CAP_IAB(3)

NAME
-------------------------------------------------

::

          #include <sys/capability.h>

          cap_iab_t cap_iab_init(void);

          cap_iab_t cap_iab_get_proc(void);

          cap_iab_t cap_iab_get_pid(pid_t pid);

          int cap_iab_set_proc(cap_iab_t iab);

          char *cap_iab_to_text(cap_iab_t iab);

          cap_iab_t cap_iab_from_text(const char *text);

          cap_flag_value_t cap_iab_get_vector(cap_iab_t iab, cap_iab_vector_t vec,
              cap_value_t val);

          int cap_iab_compare(cap_iab_t a, cap_iab_t b);

          int cap_iab_set_vector(cap_iab_t iab, cap_iab_vector_t vec, cap_value_t val,
              cap_flag_value_t enable);

          int cap_iab_fill(cap_iab_t iab, cap_iab_vector_t vec,
              cap_t set, cap_flag_t flag);

          Link with -lcap.


---------------------------------------------------------------

::

          The functions defined in this man page concern the three naively
          inheritable process capability vectors: Inh, Amb and Bound. This
          IAB 3-tuple of capability vectors, captured in type cap_iab_t
          combine to pass capabilities from one process to another through
          execve(2) system calls. The convolution rules using the IAB set
          are a fail over set of rules when the executed file has no
          configured file-capabilities.

          There are some constraints enforced by the kernel with respect to
          the three components of an IAB set and the Permitted process
          capability flag. They are: the Inh vector is entirely equal to
          the process Inheritable flag at all times; the the Amb vector
          contains no more capability values than the intersection of the
          Inh vector and the Permitted flag for the process; no Amb value
          blocked in the Bound Vector will survive execve(2); and the Bound
          (or blocked) vector is the twos-complement of the process
          bounding set.

          In some environments, it is considered desirable to naively
          inherit capabilities. That is pass capabilities, independent of
          the status of the executed binary, from parent to child through
          exec* system calls. The surviving capabilities become the
          Permitted flag for the post-exec process. This method of
          inheritance differs significantly from the handshake inheritance
          between pre-exec* process and file-capability bestowed executable
          of the traditional capability mechanism.

          The convolution rules for IAB style inheritance are: I'=I; A'= A
          & ~B; P'=A & ~B. Where P etc are the pre-exec values and P' etc
          are the post-exec values.

          With an understanding of these convolution rules, we can explain
          how libcap(3) support for the IAB set is managed: the IAB API.

          cap_iab_init() returns an empty IAB value. That is a mostly-
          harmless tuple. It will not block and capabilities through exec,
          but it won't bestow any either. The returned cap_iab_t should be
          freed with cap_free(3).

          cap_iab_get_proc() returns a copy of the IAB value for the
          current process.  The returned cap_iab_t should be freed with
          cap_free(3).

          cap_iab_get_pid() returns a copy of the IAB value for the
          specified process.  The returned cap_iab_t should be freed with
          cap_free(3).

          cap_iab_set_proc() can be used to set the IAB value carried by
          the current process. Such a setting will fail if the process is
          insufficiently capable. The process requires CAP_SETPCAP and a
          superset of P values over the A and I vectors.

          cap_iab_to_text() will convert an IAB set to a canonical text
          representation. The representation is slightly redundant but
          libcap will try to generate as short a representation as it is
          able.

          cap_iab_from_text() generates an IAB set from a text string
          (likely generated by the previous function). The returned IAB set
          should be freed with cap_free(3).

          The text format accepted by cap_iab_from_text() is a comma
          separated list of capability values. Each capability is prefixed
          by nothing (or %) (Inh); ! (Bound); ^ (Amb). Or, some combination
          thereof. Since the Amb vector is constrained to be no greater
          than the Inh set, ^ is equivalent to %^. Further, unless B is
          non-zero, % can be omitted. The following are legal text
          representations: "!%cap_chown" (Bound but Inh),
          "!cap_setuid,^cap_chown" (Bound, Inh+Amb).
          "cap_setuid,!cap_chown" (Inh, Bound). As noted above, this text
          representation is the syntax for the pam_cap.so config file.

          cap_iab_get_vector() can be used to determine the specific
          capability value of an IAB vector.

          cap_iab_compare() can be used to compare two cap_iab_t tuples.
          When the return value is non-zero, the macro CAP_IAB_DIFFERS
          (status, vector) evaluates to non-zero if the returned status
          differs in its vector components.

          cap_iab_set_vector() can be used to set a specific vector value
          to the enable setting.  cap_iab_fill() can be used to wholesale
          copy a cap_t flag value into the vec vector of the IAB set.
          Copying into Amb in this way may implicitly raise Inh values in
          the IAB set. Similarly copying into the Inh vector may implicitly
          lower Amb values that are not present in the resulting Inh
          vector.


-----------------------------------------------------

::

          The functions returning cap_iab_t values or allocated memory in
          the form of a string return NULL on error.

          Integer return values are -1 on error and 0 on success.

          In the case of error consult errno.


---------------------------------------------------

::

          Unlike the traditional cap_t capability set, the IAB set, taken
          together, is incompatible with filesystem capabilities created
          via tools like setcap(8).  That is, the Amb vector of the IAB set
          is rendered moot when an executable with a file capability is
          executed.

          Further, there are libcap cap_mode(3)s that render the Amb vector
          and its method of process inheritance disabled.


-------------------------------------------------------

::

          The IAB format for inheritable variants of capabilities was first
          developed as the configuration syntax for the pam_cap.so Linux-
          PAM module in libcap-2.29. It was introduced to extend the simple
          comma separated list of process Inheritable capabilities, that
          the module could besow on an authenticated process tree, to
          include enforced limits on the Bounding set and introduce support
          for the Amibient set of capability bits.

          While the Inheritable and Bounding sets were anticipated by the
          POSIX.1e draft that introduced capabilities, the Ambient set is a
          Linux invention, and incompatible with the POSIX.1e file
          capability model. As such, it was felt that trying to meld
          together all of the 5 capability vectors into one text
          representation was not going to work. Instead the pam_cap.so
          config syntax was generalized into a whole set of libcap
          functions for bundling together all three naively inheritable
          capabilities: the IAB set. The support for this debuted in
          libcap-2.33.


---------------------------------------------------------

::

          libcap(3), cap_launch(3), cap_init(3), capabilities(7) and
          errno(3).

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

                                  2021-03-10                     CAP_IAB(3)

--------------

Pages that refer to this page: `capsh(1) <../man1/capsh.1.html>`__, 
`cap_launch(3) <../man3/cap_launch.3.html>`__, 
`getpcaps(8) <../man8/getpcaps.8.html>`__

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
