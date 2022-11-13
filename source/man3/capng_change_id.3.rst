.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

capng_change_id(3) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CAPNG_CHANGE_ID(3)            Libcap-ng API           CAPNG_CHANGE_ID(3)

NAME
-------------------------------------------------

::

          capng_change_id - change the credentials retaining capabilities


---------------------------------------------------------

::

          #include <cap-ng.h>

          int capng_change_id(int uid, int gid, capng_flags_t flag);


---------------------------------------------------------------

::

          This function will change uid and gid to the ones given while
          retaining the capabilities previously specified in capng_update.
          It is also possible to specify -1 for either the uid or gid in
          which case the function will not change the uid or gid and leave
          it "as is". This is useful if you just want the flag options to
          be applied (assuming the option doesn't require more privileges
          that you currently have).

          It is not necessary and perhaps better if capng_apply has not
          been called prior to this function so that all necessary
          privileges are still intact. The caller may be required to have
          CAP_SETPCAP capability still active before calling this function
          or capabilities cannot be changed.

          This function also takes a flag parameter that helps to tailor
          the exact actions performed by the function to secure the
          environment. The option may be or'ed together. The legal values
          are:

                 CAPNG_NO_FLAG
                        Simply change uid and retain specified capabilities
                        and that's all.

                 CAPNG_DROP_SUPP_GRP
                        After changing id, remove any supplement groups
                        that may still be in effect from the old uid.

                 CAPNG_INIT_SUPP_GRP
                        After changing id, initialize any supplement groups
                        that may come with the new account. If given with
                        CAPNG_DROP_SUPP_GRP it will have no effect.

                 CAPNG_CLEAR_BOUNDING
                        Clear the bounding set regardless to the internal
                        representation already setup prior to changing the
                        uid/gid.

                 CAPNG_CLEAR_AMBIENT
                        Clear ambient capabilities regardless of the
                        internal representation already setup prior to
                        changing the uid/gid.


-----------------------------------------------------------------

::

          This returns 0 on success and a negative number on failure.

                 -1 means capng has not been initted properly

                 -2 means a failure requesting to keep capabilities across
                 the uid change

                 -3 means that applying the intermediate capabilities
                 failed

                 -4 means changing gid failed

                 -5 means dropping supplemental groups failed

                 -6 means changing the uid failed

                 -7 means dropping the ability to retain caps across a uid
                 change failed

                 -8 means clearing the bounding set failed

                 -9 means dropping CAP_SETPCAP or ambient capabilities
                 failed

                 -10 means initializing supplemental groups failed

          Note: the only safe action to do upon failure of this function is
          to probably exit. This is because you are likely in a situation
          with partial permissions and not what you intended.


---------------------------------------------------------

::

          capng_update(3), capng_apply(3), prctl(2), capabilities(7)


-----------------------------------------------------

::

          Steve Grubb

COLOPHON
---------------------------------------------------------

::

          This page is part of the libcap-ng (capabilities commands and
          library (NG)) project.  Information about the project can be
          found at ⟨https://people.redhat.com/sgrubb/libcap-ng/⟩.  It is
          not known how to report bugs for this man page; if you know,
          please send a mail to man-pages@man7.org.  This page was obtained
          from the tarball libcap-ng-0.8.2.tar.gz fetched from
          ⟨https://people.redhat.com/sgrubb/libcap-ng/index.html⟩ on
          2021-08-27.  If you discover any rendering problems in this HTML
          version of the page, or you believe there is a better or more up-
          to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

   Red Hat                         Feb 2018              CAPNG_CHANGE_ID(3)

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
