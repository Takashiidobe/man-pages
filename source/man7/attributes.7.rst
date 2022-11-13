.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

attributes(7) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ATTRIBUTES(7)           Linux Programmer's Manual          ATTRIBUTES(7)

NAME
-------------------------------------------------

::

          attributes - POSIX safety concepts


---------------------------------------------------------------

::

          Note: the text of this man page is based on the material taken
          from the "POSIX Safety Concepts" section of the GNU C Library
          manual.  Further details on the topics described here can be
          found in that manual.

          Various function manual pages include a section ATTRIBUTES that
          describes the safety of calling the function in various contexts.
          This section annotates functions with the following safety
          markings:

          MT-Safe
                 MT-Safe or Thread-Safe functions are safe to call in the
                 presence of other threads.  MT, in MT-Safe, stands for
                 Multi Thread.

                 Being MT-Safe does not imply a function is atomic, nor
                 that it uses any of the memory synchronization mechanisms
                 POSIX exposes to users.  It is even possible that calling
                 MT-Safe functions in sequence does not yield an MT-Safe
                 combination.  For example, having a thread call two MT-
                 Safe functions one right after the other does not
                 guarantee behavior equivalent to atomic execution of a
                 combination of both functions, since concurrent calls in
                 other threads may interfere in a destructive way.

                 Whole-program optimizations that could inline functions
                 across library interfaces may expose unsafe reordering,
                 and so performing inlining across the GNU C Library
                 interface is not recommended.  The documented MT-Safety
                 status is not guaranteed under whole-program optimization.
                 However, functions defined in user-visible headers are
                 designed to be safe for inlining.

          MT-Unsafe
                 MT-Unsafe functions are not safe to call in a
                 multithreaded programs.

          Other keywords that appear in safety notes are defined in
          subsequent sections.

      Conditionally safe features
          For some features that make functions unsafe to call in certain
          contexts, there are known ways to avoid the safety problem other
          than refraining from calling the function altogether.  The
          keywords that follow refer to such features, and each of their
          definitions indicates how the whole program needs to be
          constrained in order to remove the safety problem indicated by
          the keyword.  Only when all the reasons that make a function
          unsafe are observed and addressed, by applying the documented
          constraints, does the function become safe to call in a context.

          init   Functions marked with init as an MT-Unsafe feature perform
                 MT-Unsafe initialization when they are first called.

                 Calling such a function at least once in single-threaded
                 mode removes this specific cause for the function to be
                 regarded as MT-Unsafe.  If no other cause for that
                 remains, the function can then be safely called after
                 other threads are started.

          race   Functions annotated with race as an MT-Safety issue
                 operate on objects in ways that may cause data races or
                 similar forms of destructive interference out of
                 concurrent execution.  In some cases, the objects are
                 passed to the functions by users; in others, they are used
                 by the functions to return values to users; in others,
                 they are not even exposed to users.

          const  Functions marked with const as an MT-Safety issue non-
                 atomically modify internal objects that are better
                 regarded as constant, because a substantial portion of the
                 GNU C Library accesses them without synchronization.
                 Unlike race, which causes both readers and writers of
                 internal objects to be regarded as MT-Unsafe, this mark is
                 applied to writers only.  Writers remain MT-Unsafe to
                 call, but the then-mandatory constness of objects they
                 modify enables readers to be regarded as MT-Safe (as long
                 as no other reasons for them to be unsafe remain), since
                 the lack of synchronization is not a problem when the
                 objects are effectively constant.

                 The identifier that follows the const mark will appear by
                 itself as a safety note in readers.  Programs that wish to
                 work around this safety issue, so as to call writers, may
                 use a non-recursive read-write lock associated with the
                 identifier, and guard all calls to functions marked with
                 const followed by the identifier with a write lock, and
                 all calls to functions marked with the identifier by
                 itself with a read lock.

          sig    Functions marked with sig as a MT-Safety issue may
                 temporarily install a signal handler for internal
                 purposes, which may interfere with other uses of the
                 signal, identified after a colon.

                 This safety problem can be worked around by ensuring that
                 no other uses of the signal will take place for the
                 duration of the call.  Holding a non-recursive mutex while
                 calling all functions that use the same temporary signal;
                 blocking that signal before the call and resetting its
                 handler afterwards is recommended.

          term   Functions marked with term as an MT-Safety issue may
                 change the terminal settings in the recommended way,
                 namely: call tcgetattr(3), modify some flags, and then
                 call tcsetattr(3), this creates a window in which changes
                 made by other threads are lost.  Thus, functions marked
                 with term are MT-Unsafe.

                 It is thus advisable for applications using the terminal
                 to avoid concurrent and reentrant interactions with it, by
                 not using it in signal handlers or blocking signals that
                 might use it, and holding a lock while calling these
                 functions and interacting with the terminal.  This lock
                 should also be used for mutual exclusion with functions
                 marked with race:tcattr(fd), where fd is a file descriptor
                 for the controlling terminal.  The caller may use a single
                 mutex for simplicity, or use one mutex per terminal, even
                 if referenced by different file descriptors.

      Other safety remarks
          Additional keywords may be attached to functions, indicating
          features that do not make a function unsafe to call, but that may
          need to be taken into account in certain classes of programs:

          locale Functions annotated with locale as an MT-Safety issue read
                 from the locale object without any form of
                 synchronization.  Functions annotated with locale called
                 concurrently with locale changes may behave in ways that
                 do not correspond to any of the locales active during
                 their execution, but an unpredictable mix thereof.

                 We do not mark these functions as MT-Unsafe, however,
                 because functions that modify the locale object are marked
                 with const:locale and regarded as unsafe.  Being unsafe,
                 the latter are not to be called when multiple threads are
                 running or asynchronous signals are enabled, and so the
                 locale can be considered effectively constant in these
                 contexts, which makes the former safe.

          env    Functions marked with env as an MT-Safety issue access the
                 environment with getenv(3) or similar, without any guards
                 to ensure safety in the presence of concurrent
                 modifications.

                 We do not mark these functions as MT-Unsafe, however,
                 because functions that modify the environment are all
                 marked with const:env and regarded as unsafe.  Being
                 unsafe, the latter are not to be called when multiple
                 threads are running or asynchronous signals are enabled,
                 and so the environment can be considered effectively
                 constant in these contexts, which makes the former safe.

          hostid The function marked with hostid as an MT-Safety issue
                 reads from the system-wide data structures that hold the
                 "host ID" of the machine.  These data structures cannot
                 generally be modified atomically.  Since it is expected
                 that the "host ID" will not normally change, the function
                 that reads from it (gethostid(3)) is regarded as safe,
                 whereas the function that modifies it (sethostid(3)) is
                 marked with const:hostid, indicating it may require
                 special care if it is to be called.  In this specific
                 case, the special care amounts to system-wide (not merely
                 intra-process) coordination.

          sigintr
                 Functions marked with sigintr as an MT-Safety issue access
                 the GNU C Library _sigintr internal data structure without
                 any guards to ensure safety in the presence of concurrent
                 modifications.

                 We do not mark these functions as MT-Unsafe, however,
                 because functions that modify this data structure are all
                 marked with const:sigintr and regarded as unsafe.  Being
                 unsafe, the latter are not to be called when multiple
                 threads are running or asynchronous signals are enabled,
                 and so the data structure can be considered effectively
                 constant in these contexts, which makes the former safe.

          cwd    Functions marked with cwd as an MT-Safety issue may
                 temporarily change the current working directory during
                 their execution, which may cause relative pathnames to be
                 resolved in unexpected ways in other threads or within
                 asynchronous signal or cancellation handlers.

                 This is not enough of a reason to mark so-marked functions
                 as MT-Unsafe, but when this behavior is optional (e.g.,
                 nftw(3) with FTW_CHDIR), avoiding the option may be a good
                 alternative to using full pathnames or file descriptor-
                 relative (e.g., openat(2)) system calls.

          :identifier
                 Annotations may sometimes be followed by identifiers,
                 intended to group several functions that, for example,
                 access the data structures in an unsafe way, as in race
                 and const, or to provide more specific information, such
                 as naming a signal in a function marked with sig.  It is
                 envisioned that it may be applied to lock and corrupt as
                 well in the future.

                 In most cases, the identifier will name a set of
                 functions, but it may name global objects or function
                 arguments, or identifiable properties or logical
                 components associated with them, with a notation such as,
                 for example, :buf(arg) to denote a buffer associated with
                 the argument arg, or :tcattr(fd) to denote the terminal
                 attributes of a file descriptor fd.

                 The most common use for identifiers is to provide logical
                 groups of functions and arguments that need to be
                 protected by the same synchronization primitive in order
                 to ensure safe operation in a given context.

          /condition
                 Some safety annotations may be conditional, in that they
                 only apply if a boolean expression involving arguments,
                 global variables or even the underlying kernel evaluates
                 to true.  For example, /!ps and /one_per_line indicate the
                 preceding marker only applies when argument ps is NULL, or
                 global variable one_per_line is nonzero.

                 When all marks that render a function unsafe are adorned
                 with such conditions, and none of the named conditions
                 hold, then the function can be regarded as safe.


---------------------------------------------------------

::

          pthreads(7), signal-safety(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                  ATTRIBUTES(7)

--------------

Pages that refer to this page:
`adjtimex(2) <../man2/adjtimex.2.html>`__, 
`clock_getres(2) <../man2/clock_getres.2.html>`__, 
`eventfd(2) <../man2/eventfd.2.html>`__, 
`getrlimit(2) <../man2/getrlimit.2.html>`__, 
`getrusage(2) <../man2/getrusage.2.html>`__, 
`mmap(2) <../man2/mmap.2.html>`__, 
`sigaltstack(2) <../man2/sigaltstack.2.html>`__, 
`utimensat(2) <../man2/utimensat.2.html>`__, 
`a64l(3) <../man3/a64l.3.html>`__, 
`abort(3) <../man3/abort.3.html>`__,  `abs(3) <../man3/abs.3.html>`__, 
`acos(3) <../man3/acos.3.html>`__, 
`acosh(3) <../man3/acosh.3.html>`__, 
`addseverity(3) <../man3/addseverity.3.html>`__, 
`adjtime(3) <../man3/adjtime.3.html>`__, 
`aio_cancel(3) <../man3/aio_cancel.3.html>`__, 
`aio_error(3) <../man3/aio_error.3.html>`__, 
`aio_fsync(3) <../man3/aio_fsync.3.html>`__, 
`aio_read(3) <../man3/aio_read.3.html>`__, 
`aio_return(3) <../man3/aio_return.3.html>`__, 
`aio_suspend(3) <../man3/aio_suspend.3.html>`__, 
`aio_write(3) <../man3/aio_write.3.html>`__, 
`alloca(3) <../man3/alloca.3.html>`__, 
`argz_add(3) <../man3/argz_add.3.html>`__, 
`asin(3) <../man3/asin.3.html>`__, 
`asinh(3) <../man3/asinh.3.html>`__, 
`asprintf(3) <../man3/asprintf.3.html>`__, 
`assert(3) <../man3/assert.3.html>`__, 
`assert_perror(3) <../man3/assert_perror.3.html>`__, 
`atan2(3) <../man3/atan2.3.html>`__, 
`atan(3) <../man3/atan.3.html>`__, 
`atanh(3) <../man3/atanh.3.html>`__, 
`atexit(3) <../man3/atexit.3.html>`__, 
`atof(3) <../man3/atof.3.html>`__,  `atoi(3) <../man3/atoi.3.html>`__, 
`backtrace(3) <../man3/backtrace.3.html>`__, 
`basename(3) <../man3/basename.3.html>`__, 
`bcmp(3) <../man3/bcmp.3.html>`__, 
`bcopy(3) <../man3/bcopy.3.html>`__, 
`bindresvport(3) <../man3/bindresvport.3.html>`__, 
`bsd_signal(3) <../man3/bsd_signal.3.html>`__, 
`bsearch(3) <../man3/bsearch.3.html>`__, 
`btowc(3) <../man3/btowc.3.html>`__, 
`byteorder(3) <../man3/byteorder.3.html>`__, 
`bzero(3) <../man3/bzero.3.html>`__, 
`cabs(3) <../man3/cabs.3.html>`__, 
`cacos(3) <../man3/cacos.3.html>`__, 
`cacosh(3) <../man3/cacosh.3.html>`__, 
`canonicalize_file_name(3) <../man3/canonicalize_file_name.3.html>`__, 
`carg(3) <../man3/carg.3.html>`__, 
`casin(3) <../man3/casin.3.html>`__, 
`casinh(3) <../man3/casinh.3.html>`__, 
`catan(3) <../man3/catan.3.html>`__, 
`catanh(3) <../man3/catanh.3.html>`__, 
`catgets(3) <../man3/catgets.3.html>`__, 
`catopen(3) <../man3/catopen.3.html>`__, 
`cbrt(3) <../man3/cbrt.3.html>`__,  `ccos(3) <../man3/ccos.3.html>`__, 
`ceil(3) <../man3/ceil.3.html>`__,  `cexp(3) <../man3/cexp.3.html>`__, 
`cfree(3) <../man3/cfree.3.html>`__, 
`cimag(3) <../man3/cimag.3.html>`__, 
`clearenv(3) <../man3/clearenv.3.html>`__, 
`clock(3) <../man3/clock.3.html>`__, 
`clock_getcpuclockid(3) <../man3/clock_getcpuclockid.3.html>`__, 
`clog10(3) <../man3/clog10.3.html>`__, 
`clog(3) <../man3/clog.3.html>`__, 
`closedir(3) <../man3/closedir.3.html>`__, 
`confstr(3) <../man3/confstr.3.html>`__, 
`conj(3) <../man3/conj.3.html>`__, 
`copysign(3) <../man3/copysign.3.html>`__, 
`cos(3) <../man3/cos.3.html>`__,  `cosh(3) <../man3/cosh.3.html>`__, 
`cpow(3) <../man3/cpow.3.html>`__, 
`cproj(3) <../man3/cproj.3.html>`__, 
`creal(3) <../man3/creal.3.html>`__, 
`crypt(3) <../man3/crypt.3.html>`__, 
`csin(3) <../man3/csin.3.html>`__, 
`csinh(3) <../man3/csinh.3.html>`__, 
`csqrt(3) <../man3/csqrt.3.html>`__, 
`ctan(3) <../man3/ctan.3.html>`__, 
`ctanh(3) <../man3/ctanh.3.html>`__, 
`ctermid(3) <../man3/ctermid.3.html>`__, 
`ctime(3) <../man3/ctime.3.html>`__, 
`daemon(3) <../man3/daemon.3.html>`__, 
`des_crypt(3) <../man3/des_crypt.3.html>`__, 
`difftime(3) <../man3/difftime.3.html>`__, 
`dirfd(3) <../man3/dirfd.3.html>`__,  `div(3) <../man3/div.3.html>`__, 
`dladdr(3) <../man3/dladdr.3.html>`__, 
`dlerror(3) <../man3/dlerror.3.html>`__, 
`dlinfo(3) <../man3/dlinfo.3.html>`__, 
`dl_iterate_phdr(3) <../man3/dl_iterate_phdr.3.html>`__, 
`dlopen(3) <../man3/dlopen.3.html>`__, 
`dlsym(3) <../man3/dlsym.3.html>`__, 
`drand48(3) <../man3/drand48.3.html>`__, 
`drand48_r(3) <../man3/drand48_r.3.html>`__, 
`dysize(3) <../man3/dysize.3.html>`__, 
`ecvt(3) <../man3/ecvt.3.html>`__, 
`ecvt_r(3) <../man3/ecvt_r.3.html>`__, 
`encrypt(3) <../man3/encrypt.3.html>`__, 
`envz_add(3) <../man3/envz_add.3.html>`__, 
`erf(3) <../man3/erf.3.html>`__,  `erfc(3) <../man3/erfc.3.html>`__, 
`err(3) <../man3/err.3.html>`__,  `error(3) <../man3/error.3.html>`__, 
`ether_aton(3) <../man3/ether_aton.3.html>`__, 
`euidaccess(3) <../man3/euidaccess.3.html>`__, 
`exec(3) <../man3/exec.3.html>`__,  `exit(3) <../man3/exit.3.html>`__, 
`exp10(3) <../man3/exp10.3.html>`__, 
`exp2(3) <../man3/exp2.3.html>`__,  `exp(3) <../man3/exp.3.html>`__, 
`expm1(3) <../man3/expm1.3.html>`__, 
`fabs(3) <../man3/fabs.3.html>`__, 
`fclose(3) <../man3/fclose.3.html>`__, 
`fcloseall(3) <../man3/fcloseall.3.html>`__, 
`fdim(3) <../man3/fdim.3.html>`__,  `fenv(3) <../man3/fenv.3.html>`__, 
`ferror(3) <../man3/ferror.3.html>`__, 
`fexecve(3) <../man3/fexecve.3.html>`__, 
`fflush(3) <../man3/fflush.3.html>`__, 
`ffs(3) <../man3/ffs.3.html>`__,  `fgetc(3) <../man3/fgetc.3.html>`__, 
`fgetgrent(3) <../man3/fgetgrent.3.html>`__, 
`fgetpwent(3) <../man3/fgetpwent.3.html>`__, 
`fgetwc(3) <../man3/fgetwc.3.html>`__, 
`fgetws(3) <../man3/fgetws.3.html>`__, 
`fileno(3) <../man3/fileno.3.html>`__, 
`finite(3) <../man3/finite.3.html>`__, 
`flockfile(3) <../man3/flockfile.3.html>`__, 
`floor(3) <../man3/floor.3.html>`__,  `fma(3) <../man3/fma.3.html>`__, 
`fmax(3) <../man3/fmax.3.html>`__, 
`fmemopen(3) <../man3/fmemopen.3.html>`__, 
`fmin(3) <../man3/fmin.3.html>`__,  `fmod(3) <../man3/fmod.3.html>`__, 
`fmtmsg(3) <../man3/fmtmsg.3.html>`__, 
`fnmatch(3) <../man3/fnmatch.3.html>`__, 
`fopen(3) <../man3/fopen.3.html>`__, 
`fopencookie(3) <../man3/fopencookie.3.html>`__, 
`fpathconf(3) <../man3/fpathconf.3.html>`__, 
`fpclassify(3) <../man3/fpclassify.3.html>`__, 
`fpurge(3) <../man3/fpurge.3.html>`__, 
`fputwc(3) <../man3/fputwc.3.html>`__, 
`fputws(3) <../man3/fputws.3.html>`__, 
`fread(3) <../man3/fread.3.html>`__, 
`frexp(3) <../man3/frexp.3.html>`__, 
`fseek(3) <../man3/fseek.3.html>`__, 
`fseeko(3) <../man3/fseeko.3.html>`__, 
`ftime(3) <../man3/ftime.3.html>`__, 
`ftok(3) <../man3/ftok.3.html>`__,  `fts(3) <../man3/fts.3.html>`__, 
`ftw(3) <../man3/ftw.3.html>`__, 
`futimes(3) <../man3/futimes.3.html>`__, 
`gamma(3) <../man3/gamma.3.html>`__, 
`gcvt(3) <../man3/gcvt.3.html>`__, 
`getaddrinfo(3) <../man3/getaddrinfo.3.html>`__, 
`getaddrinfo_a(3) <../man3/getaddrinfo_a.3.html>`__, 
`getauxval(3) <../man3/getauxval.3.html>`__, 
`getcontext(3) <../man3/getcontext.3.html>`__, 
`getcwd(3) <../man3/getcwd.3.html>`__, 
`getdate(3) <../man3/getdate.3.html>`__, 
`getdirentries(3) <../man3/getdirentries.3.html>`__, 
`getdtablesize(3) <../man3/getdtablesize.3.html>`__, 
`getenv(3) <../man3/getenv.3.html>`__, 
`getfsent(3) <../man3/getfsent.3.html>`__, 
`getgrent(3) <../man3/getgrent.3.html>`__, 
`getgrent_r(3) <../man3/getgrent_r.3.html>`__, 
`getgrnam(3) <../man3/getgrnam.3.html>`__, 
`getgrouplist(3) <../man3/getgrouplist.3.html>`__, 
`gethostbyname(3) <../man3/gethostbyname.3.html>`__, 
`gethostid(3) <../man3/gethostid.3.html>`__, 
`getifaddrs(3) <../man3/getifaddrs.3.html>`__, 
`getline(3) <../man3/getline.3.html>`__, 
`getloadavg(3) <../man3/getloadavg.3.html>`__, 
`getlogin(3) <../man3/getlogin.3.html>`__, 
`getmntent(3) <../man3/getmntent.3.html>`__, 
`getnameinfo(3) <../man3/getnameinfo.3.html>`__, 
`getnetent(3) <../man3/getnetent.3.html>`__, 
`getnetent_r(3) <../man3/getnetent_r.3.html>`__, 
`get_nprocs_conf(3) <../man3/get_nprocs_conf.3.html>`__, 
`getopt(3) <../man3/getopt.3.html>`__, 
`getpass(3) <../man3/getpass.3.html>`__, 
`getprotoent(3) <../man3/getprotoent.3.html>`__, 
`getprotoent_r(3) <../man3/getprotoent_r.3.html>`__, 
`getpt(3) <../man3/getpt.3.html>`__, 
`getpw(3) <../man3/getpw.3.html>`__, 
`getpwent(3) <../man3/getpwent.3.html>`__, 
`getpwent_r(3) <../man3/getpwent_r.3.html>`__, 
`getpwnam(3) <../man3/getpwnam.3.html>`__, 
`getrpcent(3) <../man3/getrpcent.3.html>`__, 
`getrpcent_r(3) <../man3/getrpcent_r.3.html>`__, 
`getrpcport(3) <../man3/getrpcport.3.html>`__, 
`gets(3) <../man3/gets.3.html>`__, 
`getservent(3) <../man3/getservent.3.html>`__, 
`getservent_r(3) <../man3/getservent_r.3.html>`__, 
`getspnam(3) <../man3/getspnam.3.html>`__, 
`getsubopt(3) <../man3/getsubopt.3.html>`__, 
`getttyent(3) <../man3/getttyent.3.html>`__, 
`getusershell(3) <../man3/getusershell.3.html>`__, 
`getutent(3) <../man3/getutent.3.html>`__, 
`getutmp(3) <../man3/getutmp.3.html>`__, 
`getw(3) <../man3/getw.3.html>`__, 
`getwchar(3) <../man3/getwchar.3.html>`__, 
`glob(3) <../man3/glob.3.html>`__, 
`gnu_get_libc_version(3) <../man3/gnu_get_libc_version.3.html>`__, 
`grantpt(3) <../man3/grantpt.3.html>`__, 
`gsignal(3) <../man3/gsignal.3.html>`__, 
`hsearch(3) <../man3/hsearch.3.html>`__, 
`hypot(3) <../man3/hypot.3.html>`__, 
`iconv(3) <../man3/iconv.3.html>`__, 
`iconv_close(3) <../man3/iconv_close.3.html>`__, 
`iconv_open(3) <../man3/iconv_open.3.html>`__, 
`if_nameindex(3) <../man3/if_nameindex.3.html>`__, 
`if_nametoindex(3) <../man3/if_nametoindex.3.html>`__, 
`ilogb(3) <../man3/ilogb.3.html>`__, 
`index(3) <../man3/index.3.html>`__, 
`inet(3) <../man3/inet.3.html>`__, 
`inet_ntop(3) <../man3/inet_ntop.3.html>`__, 
`inet_pton(3) <../man3/inet_pton.3.html>`__, 
`initgroups(3) <../man3/initgroups.3.html>`__, 
`insque(3) <../man3/insque.3.html>`__, 
`isalpha(3) <../man3/isalpha.3.html>`__, 
`isatty(3) <../man3/isatty.3.html>`__, 
`isgreater(3) <../man3/isgreater.3.html>`__, 
`iswalnum(3) <../man3/iswalnum.3.html>`__, 
`iswalpha(3) <../man3/iswalpha.3.html>`__, 
`iswblank(3) <../man3/iswblank.3.html>`__, 
`iswcntrl(3) <../man3/iswcntrl.3.html>`__, 
`iswctype(3) <../man3/iswctype.3.html>`__, 
`iswdigit(3) <../man3/iswdigit.3.html>`__, 
`iswgraph(3) <../man3/iswgraph.3.html>`__, 
`iswlower(3) <../man3/iswlower.3.html>`__, 
`iswprint(3) <../man3/iswprint.3.html>`__, 
`iswpunct(3) <../man3/iswpunct.3.html>`__, 
`iswspace(3) <../man3/iswspace.3.html>`__, 
`iswupper(3) <../man3/iswupper.3.html>`__, 
`iswxdigit(3) <../man3/iswxdigit.3.html>`__, 
`j0(3) <../man3/j0.3.html>`__, 
`key_setsecret(3) <../man3/key_setsecret.3.html>`__, 
`ldexp(3) <../man3/ldexp.3.html>`__, 
`lio_listio(3) <../man3/lio_listio.3.html>`__, 
`localeconv(3) <../man3/localeconv.3.html>`__, 
`lockf(3) <../man3/lockf.3.html>`__, 
`log10(3) <../man3/log10.3.html>`__, 
`log1p(3) <../man3/log1p.3.html>`__, 
`log2(3) <../man3/log2.3.html>`__,  `log(3) <../man3/log.3.html>`__, 
`logb(3) <../man3/logb.3.html>`__, 
`login(3) <../man3/login.3.html>`__, 
`lrint(3) <../man3/lrint.3.html>`__, 
`lround(3) <../man3/lround.3.html>`__, 
`lsearch(3) <../man3/lsearch.3.html>`__, 
`lseek64(3) <../man3/lseek64.3.html>`__, 
`makecontext(3) <../man3/makecontext.3.html>`__, 
`makedev(3) <../man3/makedev.3.html>`__, 
`mallinfo(3) <../man3/mallinfo.3.html>`__, 
`malloc(3) <../man3/malloc.3.html>`__, 
`malloc_get_state(3) <../man3/malloc_get_state.3.html>`__, 
`malloc_info(3) <../man3/malloc_info.3.html>`__, 
`malloc_stats(3) <../man3/malloc_stats.3.html>`__, 
`malloc_trim(3) <../man3/malloc_trim.3.html>`__, 
`malloc_usable_size(3) <../man3/malloc_usable_size.3.html>`__, 
`matherr(3) <../man3/matherr.3.html>`__, 
`mblen(3) <../man3/mblen.3.html>`__, 
`mbrlen(3) <../man3/mbrlen.3.html>`__, 
`mbrtowc(3) <../man3/mbrtowc.3.html>`__, 
`mbsinit(3) <../man3/mbsinit.3.html>`__, 
`mbsnrtowcs(3) <../man3/mbsnrtowcs.3.html>`__, 
`mbsrtowcs(3) <../man3/mbsrtowcs.3.html>`__, 
`mbstowcs(3) <../man3/mbstowcs.3.html>`__, 
`mbtowc(3) <../man3/mbtowc.3.html>`__, 
`mcheck(3) <../man3/mcheck.3.html>`__, 
`memccpy(3) <../man3/memccpy.3.html>`__, 
`memchr(3) <../man3/memchr.3.html>`__, 
`memcmp(3) <../man3/memcmp.3.html>`__, 
`memcpy(3) <../man3/memcpy.3.html>`__, 
`memfrob(3) <../man3/memfrob.3.html>`__, 
`memmem(3) <../man3/memmem.3.html>`__, 
`memmove(3) <../man3/memmove.3.html>`__, 
`mempcpy(3) <../man3/mempcpy.3.html>`__, 
`memset(3) <../man3/memset.3.html>`__, 
`mkdtemp(3) <../man3/mkdtemp.3.html>`__, 
`mkfifo(3) <../man3/mkfifo.3.html>`__, 
`mkstemp(3) <../man3/mkstemp.3.html>`__, 
`mktemp(3) <../man3/mktemp.3.html>`__, 
`modf(3) <../man3/modf.3.html>`__, 
`mq_close(3) <../man3/mq_close.3.html>`__, 
`mq_getattr(3) <../man3/mq_getattr.3.html>`__, 
`mq_notify(3) <../man3/mq_notify.3.html>`__, 
`mq_open(3) <../man3/mq_open.3.html>`__, 
`mq_receive(3) <../man3/mq_receive.3.html>`__, 
`mq_send(3) <../man3/mq_send.3.html>`__, 
`mq_unlink(3) <../man3/mq_unlink.3.html>`__, 
`mtrace(3) <../man3/mtrace.3.html>`__, 
`nan(3) <../man3/nan.3.html>`__, 
`nextafter(3) <../man3/nextafter.3.html>`__, 
`nextup(3) <../man3/nextup.3.html>`__, 
`nl_langinfo(3) <../man3/nl_langinfo.3.html>`__, 
`ntp_gettime(3) <../man3/ntp_gettime.3.html>`__, 
`on_exit(3) <../man3/on_exit.3.html>`__, 
`opendir(3) <../man3/opendir.3.html>`__, 
`open_memstream(3) <../man3/open_memstream.3.html>`__, 
`openpty(3) <../man3/openpty.3.html>`__, 
`perror(3) <../man3/perror.3.html>`__, 
`popen(3) <../man3/popen.3.html>`__, 
`posix_fallocate(3) <../man3/posix_fallocate.3.html>`__, 
`posix_memalign(3) <../man3/posix_memalign.3.html>`__, 
`posix_openpt(3) <../man3/posix_openpt.3.html>`__, 
`pow10(3) <../man3/pow10.3.html>`__,  `pow(3) <../man3/pow.3.html>`__, 
`\__ppc_set_ppr_med(3) <../man3/__ppc_set_ppr_med.3.html>`__, 
`\__ppc_yield(3) <../man3/__ppc_yield.3.html>`__, 
`printf(3) <../man3/printf.3.html>`__, 
`profil(3) <../man3/profil.3.html>`__, 
`psignal(3) <../man3/psignal.3.html>`__, 
`pthread_attr_init(3) <../man3/pthread_attr_init.3.html>`__, 
`pthread_attr_setaffinity_np(3) <../man3/pthread_attr_setaffinity_np.3.html>`__, 
`pthread_attr_setdetachstate(3) <../man3/pthread_attr_setdetachstate.3.html>`__, 
`pthread_attr_setguardsize(3) <../man3/pthread_attr_setguardsize.3.html>`__, 
`pthread_attr_setinheritsched(3) <../man3/pthread_attr_setinheritsched.3.html>`__, 
`pthread_attr_setschedparam(3) <../man3/pthread_attr_setschedparam.3.html>`__, 
`pthread_attr_setschedpolicy(3) <../man3/pthread_attr_setschedpolicy.3.html>`__, 
`pthread_attr_setscope(3) <../man3/pthread_attr_setscope.3.html>`__, 
`pthread_attr_setsigmask_np(3) <../man3/pthread_attr_setsigmask_np.3.html>`__, 
`pthread_attr_setstack(3) <../man3/pthread_attr_setstack.3.html>`__, 
`pthread_attr_setstackaddr(3) <../man3/pthread_attr_setstackaddr.3.html>`__, 
`pthread_attr_setstacksize(3) <../man3/pthread_attr_setstacksize.3.html>`__, 
`pthread_cancel(3) <../man3/pthread_cancel.3.html>`__, 
`pthread_cleanup_push(3) <../man3/pthread_cleanup_push.3.html>`__, 
`pthread_create(3) <../man3/pthread_create.3.html>`__, 
`pthread_detach(3) <../man3/pthread_detach.3.html>`__, 
`pthread_equal(3) <../man3/pthread_equal.3.html>`__, 
`pthread_exit(3) <../man3/pthread_exit.3.html>`__, 
`pthread_getattr_default_np(3) <../man3/pthread_getattr_default_np.3.html>`__, 
`pthread_getattr_np(3) <../man3/pthread_getattr_np.3.html>`__, 
`pthread_getcpuclockid(3) <../man3/pthread_getcpuclockid.3.html>`__, 
`pthread_join(3) <../man3/pthread_join.3.html>`__, 
`pthread_kill(3) <../man3/pthread_kill.3.html>`__, 
`pthread_kill_other_threads_np(3) <../man3/pthread_kill_other_threads_np.3.html>`__, 
`pthread_self(3) <../man3/pthread_self.3.html>`__, 
`pthread_setaffinity_np(3) <../man3/pthread_setaffinity_np.3.html>`__, 
`pthread_setcancelstate(3) <../man3/pthread_setcancelstate.3.html>`__, 
`pthread_setconcurrency(3) <../man3/pthread_setconcurrency.3.html>`__, 
`pthread_setname_np(3) <../man3/pthread_setname_np.3.html>`__, 
`pthread_setschedparam(3) <../man3/pthread_setschedparam.3.html>`__, 
`pthread_setschedprio(3) <../man3/pthread_setschedprio.3.html>`__, 
`pthread_sigmask(3) <../man3/pthread_sigmask.3.html>`__, 
`pthread_sigqueue(3) <../man3/pthread_sigqueue.3.html>`__, 
`pthread_testcancel(3) <../man3/pthread_testcancel.3.html>`__, 
`pthread_tryjoin_np(3) <../man3/pthread_tryjoin_np.3.html>`__, 
`pthread_yield(3) <../man3/pthread_yield.3.html>`__, 
`ptsname(3) <../man3/ptsname.3.html>`__, 
`putenv(3) <../man3/putenv.3.html>`__, 
`putgrent(3) <../man3/putgrent.3.html>`__, 
`putpwent(3) <../man3/putpwent.3.html>`__, 
`puts(3) <../man3/puts.3.html>`__, 
`putwchar(3) <../man3/putwchar.3.html>`__, 
`qecvt(3) <../man3/qecvt.3.html>`__, 
`qsort(3) <../man3/qsort.3.html>`__, 
`raise(3) <../man3/raise.3.html>`__, 
`rand(3) <../man3/rand.3.html>`__, 
`random(3) <../man3/random.3.html>`__, 
`random_r(3) <../man3/random_r.3.html>`__, 
`rcmd(3) <../man3/rcmd.3.html>`__, 
`readdir(3) <../man3/readdir.3.html>`__, 
`readdir_r(3) <../man3/readdir_r.3.html>`__, 
`realpath(3) <../man3/realpath.3.html>`__, 
`re_comp(3) <../man3/re_comp.3.html>`__, 
`regex(3) <../man3/regex.3.html>`__, 
`remainder(3) <../man3/remainder.3.html>`__, 
`remove(3) <../man3/remove.3.html>`__, 
`remquo(3) <../man3/remquo.3.html>`__, 
`resolver(3) <../man3/resolver.3.html>`__, 
`rewinddir(3) <../man3/rewinddir.3.html>`__, 
`rexec(3) <../man3/rexec.3.html>`__, 
`rint(3) <../man3/rint.3.html>`__, 
`round(3) <../man3/round.3.html>`__,  `rpc(3) <../man3/rpc.3.html>`__, 
`rpmatch(3) <../man3/rpmatch.3.html>`__, 
`rtime(3) <../man3/rtime.3.html>`__, 
`scalb(3) <../man3/scalb.3.html>`__, 
`scalbln(3) <../man3/scalbln.3.html>`__, 
`scandir(3) <../man3/scandir.3.html>`__, 
`scanf(3) <../man3/scanf.3.html>`__, 
`sched_getcpu(3) <../man3/sched_getcpu.3.html>`__, 
`seekdir(3) <../man3/seekdir.3.html>`__, 
`sem_close(3) <../man3/sem_close.3.html>`__, 
`sem_destroy(3) <../man3/sem_destroy.3.html>`__, 
`sem_getvalue(3) <../man3/sem_getvalue.3.html>`__, 
`sem_init(3) <../man3/sem_init.3.html>`__, 
`sem_open(3) <../man3/sem_open.3.html>`__, 
`sem_post(3) <../man3/sem_post.3.html>`__, 
`sem_unlink(3) <../man3/sem_unlink.3.html>`__, 
`sem_wait(3) <../man3/sem_wait.3.html>`__, 
`setaliasent(3) <../man3/setaliasent.3.html>`__, 
`setbuf(3) <../man3/setbuf.3.html>`__, 
`setenv(3) <../man3/setenv.3.html>`__, 
`setjmp(3) <../man3/setjmp.3.html>`__, 
`setlocale(3) <../man3/setlocale.3.html>`__, 
`setlogmask(3) <../man3/setlogmask.3.html>`__, 
`setnetgrent(3) <../man3/setnetgrent.3.html>`__, 
`shm_open(3) <../man3/shm_open.3.html>`__, 
`siginterrupt(3) <../man3/siginterrupt.3.html>`__, 
`signbit(3) <../man3/signbit.3.html>`__, 
`significand(3) <../man3/significand.3.html>`__, 
`sigpause(3) <../man3/sigpause.3.html>`__, 
`sigqueue(3) <../man3/sigqueue.3.html>`__, 
`sigset(3) <../man3/sigset.3.html>`__, 
`sigsetops(3) <../man3/sigsetops.3.html>`__, 
`sigvec(3) <../man3/sigvec.3.html>`__, 
`sigwait(3) <../man3/sigwait.3.html>`__, 
`sin(3) <../man3/sin.3.html>`__, 
`sincos(3) <../man3/sincos.3.html>`__, 
`sinh(3) <../man3/sinh.3.html>`__, 
`sleep(3) <../man3/sleep.3.html>`__, 
`sockatmark(3) <../man3/sockatmark.3.html>`__, 
`sqrt(3) <../man3/sqrt.3.html>`__, 
`statvfs(3) <../man3/statvfs.3.html>`__, 
`stdarg(3) <../man3/stdarg.3.html>`__, 
`stdio_ext(3) <../man3/stdio_ext.3.html>`__, 
`stpcpy(3) <../man3/stpcpy.3.html>`__, 
`stpncpy(3) <../man3/stpncpy.3.html>`__, 
`strcasecmp(3) <../man3/strcasecmp.3.html>`__, 
`strcat(3) <../man3/strcat.3.html>`__, 
`strchr(3) <../man3/strchr.3.html>`__, 
`strcmp(3) <../man3/strcmp.3.html>`__, 
`strcoll(3) <../man3/strcoll.3.html>`__, 
`strcpy(3) <../man3/strcpy.3.html>`__, 
`strdup(3) <../man3/strdup.3.html>`__, 
`strerror(3) <../man3/strerror.3.html>`__, 
`strfmon(3) <../man3/strfmon.3.html>`__, 
`strfromd(3) <../man3/strfromd.3.html>`__, 
`strfry(3) <../man3/strfry.3.html>`__, 
`strftime(3) <../man3/strftime.3.html>`__, 
`strlen(3) <../man3/strlen.3.html>`__, 
`strnlen(3) <../man3/strnlen.3.html>`__, 
`strpbrk(3) <../man3/strpbrk.3.html>`__, 
`strptime(3) <../man3/strptime.3.html>`__, 
`strsep(3) <../man3/strsep.3.html>`__, 
`strsignal(3) <../man3/strsignal.3.html>`__, 
`strspn(3) <../man3/strspn.3.html>`__, 
`strstr(3) <../man3/strstr.3.html>`__, 
`strtod(3) <../man3/strtod.3.html>`__, 
`strtoimax(3) <../man3/strtoimax.3.html>`__, 
`strtok(3) <../man3/strtok.3.html>`__, 
`strtol(3) <../man3/strtol.3.html>`__, 
`strtoul(3) <../man3/strtoul.3.html>`__, 
`strverscmp(3) <../man3/strverscmp.3.html>`__, 
`strxfrm(3) <../man3/strxfrm.3.html>`__, 
`swab(3) <../man3/swab.3.html>`__, 
`sysconf(3) <../man3/sysconf.3.html>`__, 
`syslog(3) <../man3/syslog.3.html>`__, 
`system(3) <../man3/system.3.html>`__, 
`sysv_signal(3) <../man3/sysv_signal.3.html>`__, 
`tan(3) <../man3/tan.3.html>`__,  `tanh(3) <../man3/tanh.3.html>`__, 
`tcgetpgrp(3) <../man3/tcgetpgrp.3.html>`__, 
`tcgetsid(3) <../man3/tcgetsid.3.html>`__, 
`telldir(3) <../man3/telldir.3.html>`__, 
`tempnam(3) <../man3/tempnam.3.html>`__, 
`termios(3) <../man3/termios.3.html>`__, 
`tgamma(3) <../man3/tgamma.3.html>`__, 
`timegm(3) <../man3/timegm.3.html>`__, 
`tmpfile(3) <../man3/tmpfile.3.html>`__, 
`tmpnam(3) <../man3/tmpnam.3.html>`__, 
`toascii(3) <../man3/toascii.3.html>`__, 
`toupper(3) <../man3/toupper.3.html>`__, 
`towctrans(3) <../man3/towctrans.3.html>`__, 
`towlower(3) <../man3/towlower.3.html>`__, 
`towupper(3) <../man3/towupper.3.html>`__, 
`trunc(3) <../man3/trunc.3.html>`__, 
`tsearch(3) <../man3/tsearch.3.html>`__, 
`ttyname(3) <../man3/ttyname.3.html>`__, 
`ttyslot(3) <../man3/ttyslot.3.html>`__, 
`tzset(3) <../man3/tzset.3.html>`__, 
`ualarm(3) <../man3/ualarm.3.html>`__, 
`ulimit(3) <../man3/ulimit.3.html>`__, 
`ungetwc(3) <../man3/ungetwc.3.html>`__, 
`unlocked_stdio(3) <../man3/unlocked_stdio.3.html>`__, 
`unlockpt(3) <../man3/unlockpt.3.html>`__, 
`updwtmp(3) <../man3/updwtmp.3.html>`__, 
`usleep(3) <../man3/usleep.3.html>`__, 
`wcpcpy(3) <../man3/wcpcpy.3.html>`__, 
`wcpncpy(3) <../man3/wcpncpy.3.html>`__, 
`wcrtomb(3) <../man3/wcrtomb.3.html>`__, 
`wcscasecmp(3) <../man3/wcscasecmp.3.html>`__, 
`wcscat(3) <../man3/wcscat.3.html>`__, 
`wcschr(3) <../man3/wcschr.3.html>`__, 
`wcscmp(3) <../man3/wcscmp.3.html>`__, 
`wcscpy(3) <../man3/wcscpy.3.html>`__, 
`wcscspn(3) <../man3/wcscspn.3.html>`__, 
`wcsdup(3) <../man3/wcsdup.3.html>`__, 
`wcslen(3) <../man3/wcslen.3.html>`__, 
`wcsncasecmp(3) <../man3/wcsncasecmp.3.html>`__, 
`wcsncat(3) <../man3/wcsncat.3.html>`__, 
`wcsncmp(3) <../man3/wcsncmp.3.html>`__, 
`wcsncpy(3) <../man3/wcsncpy.3.html>`__, 
`wcsnlen(3) <../man3/wcsnlen.3.html>`__, 
`wcsnrtombs(3) <../man3/wcsnrtombs.3.html>`__, 
`wcspbrk(3) <../man3/wcspbrk.3.html>`__, 
`wcsrchr(3) <../man3/wcsrchr.3.html>`__, 
`wcsrtombs(3) <../man3/wcsrtombs.3.html>`__, 
`wcsspn(3) <../man3/wcsspn.3.html>`__, 
`wcsstr(3) <../man3/wcsstr.3.html>`__, 
`wcstoimax(3) <../man3/wcstoimax.3.html>`__, 
`wcstok(3) <../man3/wcstok.3.html>`__, 
`wcstombs(3) <../man3/wcstombs.3.html>`__, 
`wcswidth(3) <../man3/wcswidth.3.html>`__, 
`wctob(3) <../man3/wctob.3.html>`__, 
`wctomb(3) <../man3/wctomb.3.html>`__, 
`wctrans(3) <../man3/wctrans.3.html>`__, 
`wctype(3) <../man3/wctype.3.html>`__, 
`wcwidth(3) <../man3/wcwidth.3.html>`__, 
`wmemchr(3) <../man3/wmemchr.3.html>`__, 
`wmemcmp(3) <../man3/wmemcmp.3.html>`__, 
`wmemcpy(3) <../man3/wmemcpy.3.html>`__, 
`wmemmove(3) <../man3/wmemmove.3.html>`__, 
`wmemset(3) <../man3/wmemset.3.html>`__, 
`wordexp(3) <../man3/wordexp.3.html>`__, 
`wprintf(3) <../man3/wprintf.3.html>`__, 
`xcrypt(3) <../man3/xcrypt.3.html>`__, 
`xdr(3) <../man3/xdr.3.html>`__,  `y0(3) <../man3/y0.3.html>`__, 
`man-pages(7) <../man7/man-pages.7.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__, 
`standards(7) <../man7/standards.7.html>`__

--------------

`Copyright and license for this manual
page <../man7/attributes.7.license.html>`__

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
