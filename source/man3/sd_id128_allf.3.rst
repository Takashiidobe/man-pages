.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd-id128(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD-ID128(3)                     sd-id128                     SD-ID128(3)

NAME
-------------------------------------------------

::

          sd-id128, SD_ID128_ALLF, SD_ID128_CONST_STR, SD_ID128_FORMAT_STR,
          SD_ID128_FORMAT_VAL, SD_ID128_MAKE, SD_ID128_MAKE_STR,
          SD_ID128_MAKE_UUID_STR, SD_ID128_NULL, SD_ID128_UUID_FORMAT_STR,
          sd_id128_equal, sd_id128_in_set, sd_id128_in_set_sentinel,
          sd_id128_in_setv, sd_id128_is_allf, sd_id128_is_null, sd_id128_t
          - APIs for processing 128-bit IDs


---------------------------------------------------------

::

          #include <systemd/sd-id128.h>

          pkg-config --cflags --libs libsystemd


---------------------------------------------------------------

::

          sd-id128.h provides APIs to process and generate 128-bit ID
          values. The 128-bit ID values processed and generated by these
          APIs are a generalization of OSF UUIDs as defined by RFC 4122[1]
          but use a simpler string format. These functions impose no
          structure on the used IDs, much unlike OSF UUIDs or Microsoft
          GUIDs, but are mostly compatible with those types of IDs.

          See sd_id128_to_string(3), sd_id128_randomize(3) and
          sd_id128_get_machine(3) for more information about the
          implemented functions.

          A 128-bit ID is implemented as the following union type:

              typedef union sd_id128 {
                uint8_t bytes[16];
                uint64_t qwords[2];
              } sd_id128_t;

          This union type allows accessing the 128-bit ID as 16 separate
          bytes or two 64-bit words. It is generally safer to access the ID
          components by their 8-bit array to avoid endianness issues. This
          union is intended to be passed call-by-value (as opposed to
          call-by-reference) and may be directly manipulated by clients.

          A couple of macros are defined to denote and decode 128-bit IDs:

          SD_ID128_MAKE() may be used to denote a constant 128-bit ID in
          source code. A commonly used idiom is to assign a name to a
          128-bit ID using this macro:

              #define SD_MESSAGE_COREDUMP SD_ID128_MAKE(fc,2e,22,bc,6e,e6,47,b6,b9,07,29,ab,34,a2,50,b1)

          SD_ID128_NULL may be used to refer to the 128-bit ID consisting
          of only NUL bytes (i.e. all bits off).

          SD_ID128_ALLF may be used to refer to the 128-bit ID consisting
          of only 0xFF bytes (i.e. all bits on).

          SD_ID128_MAKE_STR() is similar to SD_ID128_MAKE(), but creates a
          const char* expression that can be conveniently used in message
          formats and such:

              #include <stdio.h>
              #define SD_MESSAGE_COREDUMP_STR SD_ID128_MAKE_STR(fc,2e,22,bc,6e,e6,47,b6,b9,07,29,ab,34,a2,50,b1)

              int main(int argc, char **argv) {
                puts("Match for coredumps: MESSAGE_ID=" SD_MESSAGE_COREDUMP_STR);
              }

          SD_ID128_CONST_STR() may be used to convert constant 128-bit IDs
          into constant strings for output. The following example code will
          output the string "fc2e22bc6ee647b6b90729ab34a250b1":

              int main(int argc, char *argv[]) {
                puts("Match for coredumps: %s", SD_ID128_CONST_STR(SD_MESSAGE_COREDUMP));
              }

          SD_ID128_FORMAT_STR and SD_ID128_FORMAT_VAL() may be used to
          format a 128-bit ID in a printf(3) format string, as shown in the
          following example:

              int main(int argc, char *argv[]) {
                sd_id128_t id;
                id = SD_ID128_MAKE(ee,89,be,71,bd,6e,43,d6,91,e6,c5,5d,eb,03,02,07);
                printf("The ID encoded in this C file is " SD_ID128_FORMAT_STR ".\n", SD_ID128_FORMAT_VAL(id));
                return 0;
              }

          SD_ID128_UUID_FORMAT_STR and SD_ID128_MAKE_UUID_STR() are similar
          to SD_ID128_FORMAT_STR and SD_ID128_MAKE_STR(), but include
          separating hyphens to conform to the "canonical
          representation[2]". They format the string based on RFC4122[1]
          Variant 1 rules, i.e. converting from Big Endian byte order. This
          matches behaviour of most other Linux userspace infrastructure.
          It's probably best to avoid UUIDs of other variants, in order to
          avoid unnecessary ambiguities. All 128-bit IDs generated by the
          sd-id128 APIs strictly conform to Variant 1 Version 4 UUIDs, as
          per RFC 4122.

          Use sd_id128_equal() to compare two 128-bit IDs:

              int main(int argc, char *argv[]) {
                sd_id128_t a, b, c;
                a = SD_ID128_MAKE(ee,89,be,71,bd,6e,43,d6,91,e6,c5,5d,eb,03,02,07);
                b = SD_ID128_MAKE(f2,28,88,9c,5f,09,44,15,9d,d7,04,77,58,cb,e7,3e);
                c = a;
                assert(sd_id128_equal(a, c));
                assert(!sd_id128_equal(a, b));
                return 0;
              }

          Use sd_id128_is_null() to check if an 128-bit ID consists of only
          NUL bytes:

              assert(sd_id128_is_null(SD_ID128_NULL));

          Similarly, use sd_id128_is_allf() to check if an 128-bit ID
          consists of only 0xFF bytes (all bits on):

              assert(sd_id128_is_allf(SD_ID128_ALLF));

          For convenience, sd_id128_in_set() takes a list of IDs and
          returns true if any are equal to the first argument:

              int main(int argc, char *argv[]) {
                sd_id12_t a = SD_ID128_MAKE(ee,89,be,71,bd,6e,43,d6,91,e6,c5,5d,eb,03,02,07);
                assert(sd_id128_in_set(a, a));
                assert(sd_id128_in_set(a, a, a));
                assert(!sd_id128_in_set(a));
                assert(!sd_id128_in_set(a,
                                        SD_ID128_MAKE(f2,28,88,9c,5f,09,44,15,9d,d7,04,77,58,cb,e7,3e)
                                        SD_ID128_MAKE(2f,88,28,5f,9c,44,09,9d,d7,15,77,04,bc,85,7e,e3)
                                        SD_ID128_ALLF));
                return 0;
              }

          sd_id128_in_set() is defined as a macro over
          sd_id128_in_set_sentinel(), adding the SD_ID128_NULL sentinel.
          Since sd_id128_in_set_sentinel() uses SD_ID128_NULL as the
          sentinel, SD_ID128_NULL cannot be otherwise placed in the
          argument list.

          sd_id128_in_setv() is similar to sd_id128_in_set_sentinel(), but
          takes a struct varargs argument.

          Note that new, randomized IDs may be generated with
          systemd-id128(1)'s new command.


---------------------------------------------------

::

          These APIs are implemented as a shared library, which can be
          compiled and linked to with the libsystemd pkg-config(1) file.


---------------------------------------------------------

::

          systemd(1), sd_id128_to_string(3), sd_id128_randomize(3),
          sd_id128_get_machine(3), printf(3), journalctl(1), sd-journal(7),
          pkg-config(1), machine-id(5)

.. _notes-top-1:


---------------------------------------------------

::

           1. RFC 4122
              https://tools.ietf.org/html/rfc4122

           2. canonical representation
              https://en.wikipedia.org/wiki/Universally_unique_identifier#Format

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                                  SD-ID128(3)

--------------

Pages that refer to this page:
`systemd-id128(1) <../man1/systemd-id128.1.html>`__, 
`sd_id128_get_machine(3) <../man3/sd_id128_get_machine.3.html>`__, 
`sd_id128_randomize(3) <../man3/sd_id128_randomize.3.html>`__, 
`sd_id128_to_string(3) <../man3/sd_id128_to_string.3.html>`__, 
`sd-journal(3) <../man3/sd-journal.3.html>`__, 
`machine-id(5) <../man5/machine-id.5.html>`__

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
