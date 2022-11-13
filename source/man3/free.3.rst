.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

malloc(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
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

   MALLOC(3)               Linux Programmer's Manual              MALLOC(3)

NAME
-------------------------------------------------

::

          malloc, free, calloc, realloc, reallocarray - allocate and free
          dynamic memory


---------------------------------------------------------

::

          #include <stdlib.h>

          void *malloc(size_t size);
          void free(void *ptr);
          void *calloc(size_t nmemb, size_t size);
          void *realloc(void *ptr, size_t size);
          void *reallocarray(void *ptr, size_t nmemb, size_t size);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          reallocarray():
              Since glibc 2.29:
                  _DEFAULT_SOURCE
              Glibc 2.28 and earlier:
                  _GNU_SOURCE


---------------------------------------------------------------

::

          The malloc() function allocates size bytes and returns a pointer
          to the allocated memory.  The memory is not initialized.  If size
          is 0, then malloc() returns either NULL, or a unique pointer
          value that can later be successfully passed to free().

          The free() function frees the memory space pointed to by ptr,
          which must have been returned by a previous call to malloc(),
          calloc(), or realloc().  Otherwise, or if free(ptr) has already
          been called before, undefined behavior occurs.  If ptr is NULL,
          no operation is performed.

          The calloc() function allocates memory for an array of nmemb
          elements of size bytes each and returns a pointer to the
          allocated memory.  The memory is set to zero.  If nmemb or size
          is 0, then calloc() returns either NULL, or a unique pointer
          value that can later be successfully passed to free().  If the
          multiplication of nmemb and size would result in integer
          overflow, then calloc() returns an error.  By contrast, an
          integer overflow would not be detected in the following call to
          malloc(), with the result that an incorrectly sized block of
          memory would be allocated:

              malloc(nmemb * size);

          The realloc() function changes the size of the memory block
          pointed to by ptr to size bytes.  The contents will be unchanged
          in the range from the start of the region up to the minimum of
          the old and new sizes.  If the new size is larger than the old
          size, the added memory will not be initialized.  If ptr is NULL,
          then the call is equivalent to malloc(size), for all values of
          size; if size is equal to zero, and ptr is not NULL, then the
          call is equivalent to free(ptr) (this behavior is nonportable;
          see NOTES).  Unless ptr is NULL, it must have been returned by an
          earlier call to malloc(), calloc(), or realloc().  If the area
          pointed to was moved, a free(ptr) is done.

          The reallocarray() function changes the size of the memory block
          pointed to by ptr to be large enough for an array of nmemb
          elements, each of which is size bytes.  It is equivalent to the
          call

                  realloc(ptr, nmemb * size);

          However, unlike that realloc() call, reallocarray() fails safely
          in the case where the multiplication would overflow.  If such an
          overflow occurs, reallocarray() returns NULL, sets errno to
          ENOMEM, and leaves the original block of memory unchanged.


-----------------------------------------------------------------

::

          The malloc() and calloc() functions return a pointer to the
          allocated memory, which is suitably aligned for any built-in
          type.  On error, these functions return NULL.  NULL may also be
          returned by a successful call to malloc() with a size of zero, or
          by a successful call to calloc() with nmemb or size equal to
          zero.

          The free() function returns no value.

          The realloc() function returns a pointer to the newly allocated
          memory, which is suitably aligned for any built-in type, or NULL
          if the request failed.  The returned pointer may be the same as
          ptr if the allocation was not moved (e.g., there was room to
          expand the allocation in-place), or different from ptr if the
          allocation was moved to a new address.  If size was equal to 0,
          either NULL or a pointer suitable to be passed to free() is
          returned.  If realloc() fails, the original block is left
          untouched; it is not freed or moved.

          On success, the reallocarray() function returns a pointer to the
          newly allocated memory.  On failure, it returns NULL and the
          original block of memory is left untouched.


-----------------------------------------------------

::

          calloc(), malloc(), realloc(), and reallocarray() can fail with
          the following error:

          ENOMEM Out of memory.  Possibly, the application hit the
                 RLIMIT_AS or RLIMIT_DATA limit described in getrlimit(2).


---------------------------------------------------------

::

          reallocarray() first appeared in glibc in version 2.26.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │malloc(), free(), calloc(), realloc() │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          malloc(), free(), calloc(), realloc(): POSIX.1-2001,
          POSIX.1-2008, C89, C99.

          reallocarray() is a nonstandard extension that first appeared in
          OpenBSD 5.6 and FreeBSD 11.0.


---------------------------------------------------

::

          By default, Linux follows an optimistic memory allocation
          strategy.  This means that when malloc() returns non-NULL there
          is no guarantee that the memory really is available.  In case it
          turns out that the system is out of memory, one or more processes
          will be killed by the OOM killer.  For more information, see the
          description of /proc/sys/vm/overcommit_memory and
          /proc/sys/vm/oom_adj in proc(5), and the Linux kernel source file
          Documentation/vm/overcommit-accounting.rst.

          Normally, malloc() allocates memory from the heap, and adjusts
          the size of the heap as required, using sbrk(2).  When allocating
          blocks of memory larger than MMAP_THRESHOLD bytes, the glibc
          malloc() implementation allocates the memory as a private
          anonymous mapping using mmap(2).  MMAP_THRESHOLD is 128 kB by
          default, but is adjustable using mallopt(3).  Prior to Linux 4.7
          allocations performed using mmap(2) were unaffected by the
          RLIMIT_DATA resource limit; since Linux 4.7, this limit is also
          enforced for allocations performed using mmap(2).

          To avoid corruption in multithreaded applications, mutexes are
          used internally to protect the memory-management data structures
          employed by these functions.  In a multithreaded application in
          which threads simultaneously allocate and free memory, there
          could be contention for these mutexes.  To scalably handle memory
          allocation in multithreaded applications, glibc creates
          additional memory allocation arenas if mutex contention is
          detected.  Each arena is a large region of memory that is
          internally allocated by the system (using brk(2) or mmap(2)), and
          managed with its own mutexes.

          SUSv2 requires malloc(), calloc(), and realloc() to set errno to
          ENOMEM upon failure.  Glibc assumes that this is done (and the
          glibc versions of these routines do this); if you use a private
          malloc implementation that does not set errno, then certain
          library routines may fail without having a reason in errno.

          Crashes in malloc(), calloc(), realloc(), or free() are almost
          always related to heap corruption, such as overflowing an
          allocated chunk or freeing the same pointer twice.

          The malloc() implementation is tunable via environment variables;
          see mallopt(3) for details.

      Nonportable behavior
          The behavior of realloc() when size is equal to zero, and ptr is
          not NULL, is glibc specific; other implementations may return
          NULL, and set errno.  Portable POSIX programs should avoid it.
          See realloc(3p).


---------------------------------------------------------

::

          valgrind(1), brk(2), mmap(2), alloca(3), malloc_get_state(3),
          malloc_info(3), malloc_trim(3), malloc_usable_size(3),
          mallopt(3), mcheck(3), mtrace(3), posix_memalign(3)

          For details of the GNU C library implementation, see 
          ⟨https://sourceware.org/glibc/wiki/MallocInternals⟩.

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      MALLOC(3)

--------------

Pages that refer to this page:
`memusage(1) <../man1/memusage.1.html>`__, 
`brk(2) <../man2/brk.2.html>`__,  `clone(2) <../man2/clone.2.html>`__, 
`getrlimit(2) <../man2/getrlimit.2.html>`__, 
`mlock(2) <../man2/mlock.2.html>`__, 
`mmap(2) <../man2/mmap.2.html>`__, 
`mremap(2) <../man2/mremap.2.html>`__, 
`alloca(3) <../man3/alloca.3.html>`__, 
`argz_add(3) <../man3/argz_add.3.html>`__, 
`asprintf(3) <../man3/asprintf.3.html>`__, 
`ausearch_add_expression(3) <../man3/ausearch_add_expression.3.html>`__, 
`avc_init(3) <../man3/avc_init.3.html>`__, 
`backtrace(3) <../man3/backtrace.3.html>`__, 
`basename(3) <../man3/basename.3.html>`__, 
`canonicalize_file_name(3) <../man3/canonicalize_file_name.3.html>`__, 
`cfree(3) <../man3/cfree.3.html>`__, 
`CPU_SET(3) <../man3/CPU_SET.3.html>`__, 
`dbopen(3) <../man3/dbopen.3.html>`__, 
`end(3) <../man3/end.3.html>`__,  `exec(3) <../man3/exec.3.html>`__, 
`fopen(3) <../man3/fopen.3.html>`__, 
`fseek(3) <../man3/fseek.3.html>`__,  `fts(3) <../man3/fts.3.html>`__, 
`ftw(3) <../man3/ftw.3.html>`__, 
`getcwd(3) <../man3/getcwd.3.html>`__, 
`getgrent(3) <../man3/getgrent.3.html>`__, 
`getgrnam(3) <../man3/getgrnam.3.html>`__, 
`getifaddrs(3) <../man3/getifaddrs.3.html>`__, 
`getline(3) <../man3/getline.3.html>`__, 
`getpwent(3) <../man3/getpwent.3.html>`__, 
`getpwnam(3) <../man3/getpwnam.3.html>`__, 
`glob(3) <../man3/glob.3.html>`__, 
`hsearch(3) <../man3/hsearch.3.html>`__, 
`if_nameindex(3) <../man3/if_nameindex.3.html>`__, 
`lber-memory(3) <../man3/lber-memory.3.html>`__, 
`ldap_memory(3) <../man3/ldap_memory.3.html>`__, 
`mallinfo(3) <../man3/mallinfo.3.html>`__, 
`malloc_get_state(3) <../man3/malloc_get_state.3.html>`__, 
`malloc_hook(3) <../man3/malloc_hook.3.html>`__, 
`malloc_info(3) <../man3/malloc_info.3.html>`__, 
`malloc_stats(3) <../man3/malloc_stats.3.html>`__, 
`malloc_trim(3) <../man3/malloc_trim.3.html>`__, 
`malloc_usable_size(3) <../man3/malloc_usable_size.3.html>`__, 
`mallopt(3) <../man3/mallopt.3.html>`__, 
`mcheck(3) <../man3/mcheck.3.html>`__, 
`mpool(3) <../man3/mpool.3.html>`__, 
`mtrace(3) <../man3/mtrace.3.html>`__, 
`numa(3) <../man3/numa.3.html>`__, 
`open_memstream(3) <../man3/open_memstream.3.html>`__, 
`pam_conv(3) <../man3/pam_conv.3.html>`__, 
`pmaddderived(3) <../man3/pmaddderived.3.html>`__, 
`\__pmaf(3) <../man3/__pmaf.3.html>`__, 
`pmapi(3) <../man3/pmapi.3.html>`__, 
`pmdachildren(3) <../man3/pmdachildren.3.html>`__, 
`pmdafetch(3) <../man3/pmdafetch.3.html>`__, 
`pmdainstance(3) <../man3/pmdainstance.3.html>`__, 
`pmdalabel(3) <../man3/pmdalabel.3.html>`__, 
`pmdatext(3) <../man3/pmdatext.3.html>`__, 
`pmdatrace(3) <../man3/pmdatrace.3.html>`__, 
`pmdiscoverservices(3) <../man3/pmdiscoverservices.3.html>`__, 
`pmextractvalue(3) <../man3/pmextractvalue.3.html>`__, 
`pmfault(3) <../man3/pmfault.3.html>`__, 
`pmfetch(3) <../man3/pmfetch.3.html>`__, 
`pmfetcharchive(3) <../man3/pmfetcharchive.3.html>`__, 
`pmfetchgroup(3) <../man3/pmfetchgroup.3.html>`__, 
`pmfreelabelsets(3) <../man3/pmfreelabelsets.3.html>`__, 
`pmfreeprofile(3) <../man3/pmfreeprofile.3.html>`__, 
`pmfreeresult(3) <../man3/pmfreeresult.3.html>`__, 
`pmfstring(3) <../man3/pmfstring.3.html>`__, 
`pmgetchildren(3) <../man3/pmgetchildren.3.html>`__, 
`pmgetchildrenstatus(3) <../man3/pmgetchildrenstatus.3.html>`__, 
`pmgetindom(3) <../man3/pmgetindom.3.html>`__, 
`pmgetindomarchive(3) <../man3/pmgetindomarchive.3.html>`__, 
`pmlookupindomtext(3) <../man3/pmlookupindomtext.3.html>`__, 
`pmlookuptext(3) <../man3/pmlookuptext.3.html>`__, 
`pmnameall(3) <../man3/pmnameall.3.html>`__, 
`pmnameid(3) <../man3/pmnameid.3.html>`__, 
`pmnameindom(3) <../man3/pmnameindom.3.html>`__, 
`pmnameindomarchive(3) <../man3/pmnameindomarchive.3.html>`__, 
`pmnewcontextzone(3) <../man3/pmnewcontextzone.3.html>`__, 
`pmnewzone(3) <../man3/pmnewzone.3.html>`__, 
`pmnomem(3) <../man3/pmnomem.3.html>`__, 
`\__pmparsectime(3) <../man3/__pmparsectime.3.html>`__, 
`pmparsehostattrsspec(3) <../man3/pmparsehostattrsspec.3.html>`__, 
`pmparsehostspec(3) <../man3/pmparsehostspec.3.html>`__, 
`pmparseinterval(3) <../man3/pmparseinterval.3.html>`__, 
`pmparsemetricspec(3) <../man3/pmparsemetricspec.3.html>`__, 
`\__pmparsetime(3) <../man3/__pmparsetime.3.html>`__, 
`pmparsetimewindow(3) <../man3/pmparsetimewindow.3.html>`__, 
`pmparseunitsstr(3) <../man3/pmparseunitsstr.3.html>`__, 
`pmregisterderived(3) <../man3/pmregisterderived.3.html>`__, 
`posix_memalign(3) <../man3/posix_memalign.3.html>`__, 
`pthread_setcancelstate(3) <../man3/pthread_setcancelstate.3.html>`__, 
`random_r(3) <../man3/random_r.3.html>`__, 
`readdir(3) <../man3/readdir.3.html>`__, 
`readline(3) <../man3/readline.3.html>`__, 
`realpath(3) <../man3/realpath.3.html>`__, 
`scandir(3) <../man3/scandir.3.html>`__, 
`scanf(3) <../man3/scanf.3.html>`__, 
`sd_bus_creds_get_pid(3) <../man3/sd_bus_creds_get_pid.3.html>`__, 
`sd_bus_error(3) <../man3/sd_bus_error.3.html>`__, 
`sd_bus_path_encode(3) <../man3/sd_bus_path_encode.3.html>`__, 
`sd_get_seats(3) <../man3/sd_get_seats.3.html>`__, 
`sd_journal_get_catalog(3) <../man3/sd_journal_get_catalog.3.html>`__, 
`sd_journal_get_cursor(3) <../man3/sd_journal_get_cursor.3.html>`__, 
`sd-login(3) <../man3/sd-login.3.html>`__, 
`sd_machine_get_class(3) <../man3/sd_machine_get_class.3.html>`__, 
`sd_path_lookup(3) <../man3/sd_path_lookup.3.html>`__, 
`sd_pid_get_owner_uid(3) <../man3/sd_pid_get_owner_uid.3.html>`__, 
`sd_seat_get_active(3) <../man3/sd_seat_get_active.3.html>`__, 
`sd_session_is_active(3) <../man3/sd_session_is_active.3.html>`__, 
`sd_uid_get_state(3) <../man3/sd_uid_get_state.3.html>`__, 
`seccomp_syscall_resolve_name(3) <../man3/seccomp_syscall_resolve_name.3.html>`__, 
`security_class_to_string(3) <../man3/security_class_to_string.3.html>`__, 
`selabel_get_digests_all_partial_matches(3) <../man3/selabel_get_digests_all_partial_matches.3.html>`__, 
`selinux_boolean_sub(3) <../man3/selinux_boolean_sub.3.html>`__, 
`selinux_getpolicytype(3) <../man3/selinux_getpolicytype.3.html>`__, 
`selinux_raw_context_to_color(3) <../man3/selinux_raw_context_to_color.3.html>`__, 
`setbuf(3) <../man3/setbuf.3.html>`__, 
`strdup(3) <../man3/strdup.3.html>`__, 
`string(3) <../man3/string.3.html>`__, 
`tempnam(3) <../man3/tempnam.3.html>`__, 
`wcsdup(3) <../man3/wcsdup.3.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`environ(7) <../man7/environ.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/malloc.3.license.html>`__

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
