.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

libexpect(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `IF YOU WANT T                    |                                   |
| O ALLOCATE YOUR OWN PTY <#IF_YOU_ |                                   |
| WANT_TO_ALLOCATE_YOUR_OWN_PTY>`__ |                                   |
| \|                                |                                   |
| `EXPECT P                         |                                   |
| ROCESSING <#EXPECT_PROCESSING>`__ |                                   |
| \|                                |                                   |
| `RUNNING IN THE BACKGROUN         |                                   |
| D <#RUNNING_IN_THE_BACKGROUND>`__ |                                   |
| \|                                |                                   |
| `MULTIPLEXING <#MULTIPLEXING>`__  |                                   |
| \|                                |                                   |
| `                                 |                                   |
| SLAVE CONTROL <#SLAVE_CONTROL>`__ |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `SIGNALS <#SIGNALS>`__ \|         |                                   |
| `LOGGING <#LOGGING>`__ \|         |                                   |
| `DEBUGGING <#DEBUGGING>`__ \|     |                                   |
| `CAVEATS <#CAVEATS>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `ACKNOW                           |                                   |
| LEDGEMENTS <#ACKNOWLEDGEMENTS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LIBEXPECT(3)            Library Functions Manual            LIBEXPECT(3)

NAME
-------------------------------------------------

::

          libexpect - programmed dialogue library with interactive programs


---------------------------------------------------------------

::

          This library contains functions that allow Expect to be used as a
          Tcl extension or to be used directly from C or C++ (without Tcl).
          Adding Expect as a Tcl extension is very short and simple, so
          that will be covered first.


---------------------------------------------------------

::

          #include expect_tcl.h
          Expect_Init(interp);

          cc files... -lexpect5.20 -ltcl7.5 -lm

          Note: library versions may differ in the actual release.

          The Expect_Init function adds expect commands to the named
          interpreter.  It avoids overwriting commands that already exist,
          however aliases beginning with "exp_" are always created for
          expect commands.  So for example, "send" can be used as
          "exp_send".

          Generally, you should only call Expect commands via Tcl_Eval.
          Certain auxiliary functions may be called directly.  They are
          summarized below.  They may be useful in constructing your own
          main.  Look at the file exp_main_exp.c in the Expect distribution
          as a prototype main.  Another prototype is tclAppInit.c in the
          Tcl source distribution.  A prototype for working with Tk is in
          exp_main_tk.c in the Expect distribution.

          int exp_cmdlinecmds;
          int exp_interactive;
          FILE *exp_cmdfile;
          char *exp_cmdfilename;
          int exp_tcl_debugger_available;

          void exp_parse_argv(Tcl_Interp *,int argc,char **argv);
          int  exp_interpreter(Tcl_Interp *);
          void exp_interpret_cmdfile(Tcl_Interp *,FILE *);
          void exp_interpret_cmdfilename(Tcl_Interp *,char *);
          void exp_interpret_rcfiles(Tcl_Interp *,int my_rc,int sys_rc);
          char *    exp_cook(char *s,int *len);
          void (*exp_app_exit)EXP_PROTO((Tcl_Interp *);
          void exp_exit(Tcl_Interp *,int status);
          void exp_exit_handlers(Tcl_Interp *);
          void exp_error(Tcl_Interp,char *,...);

          exp_cmdlinecmds is 1 if Expect has been invoked with commands on
          the program command-line (using "-c" for example).
          exp_interactive is 1 if Expect has been invoked with the -i flag
          or if no commands or script is being invoked.  exp_cmdfile is a
          stream from which Expect will read commands.  exp_cmdfilename is
          the name of a file which Expect will open and read commands from.
          exp_tcl_debugger_available is 1 if the debugger has been armed.

          exp_parse_argv reads the representation of the command line.
          Based on what is found, any of the other variables listed here
          are initialized appropriately.  exp_interpreter interactively
          prompts the user for commands and evaluates them.
          exp_interpret_cmdfile reads the given stream and evaluates any
          commands found.  exp_interpret_cmdfilename opens the named file
          and evaluates any commands found.  exp_interpret_rcfiles reads
          and evalutes the .rc files.  If my_rc is zero, then ~/.expectrc
          is skipped.  If sys_rc is zero, then the system-wide expectrc
          file is skipped.  exp_cook returns a static buffer containing the
          argument reproduced with newlines replaced by carriage-return
          linefeed sequences.  The primary purpose of this is to allow
          messages to be produced without worrying about whether the
          terminal is in raw mode or cooked mode.  If length is zero, it is
          computed via strlen.  exp_error is a printf-like function that
          writes the result to interp->result.

.. _synopsis-top-1:


---------------------------------------------------------

::

          #include <expect.h>

          int
          exp_spawnl(file, arg0 [, arg1, ..., argn] (char *)0);
          char *file;
          char *arg0, *arg1, ... *argn;

          int
          exp_spawnv(file,argv);
          char *file, *argv[ ];

          int
          exp_spawnfd(fd);
          int fd;

          FILE *
          exp_popen(command);
          char *command;

          extern int exp_pid;
          extern int exp_ttyinit;
          extern int exp_ttycopy;
          extern int exp_console;
          extern char *exp_stty_init;
          extern void (*exp_close_in_child)();
          extern void (*exp_child_exec_prelude)();
          extern void exp_close_tcl_files();

          cc files... -lexpect -ltcl -lm

.. _description-top-1:


---------------------------------------------------------------

::

          exp_spawnl and exp_spawnv fork a new process so that its stdin,
          stdout, and stderr can be written and read by the current
          process.  file is the name of a file to be executed.  The arg
          pointers are null-terminated strings.  Following the style of
          execve(), arg0 (or argv[0]) is customarily a duplicate of the
          name of the file.

          Four interfaces are available, exp_spawnl is useful when the
          number of arguments is known at compile time.  exp_spawnv is
          useful when the number of arguments is not known at compile time.
          exp_spawnfd is useful when an open file descriptor is already
          available as a source.  exp_popen is explained later on.

          If the process is successfully created, a file descriptor is
          returned which corresponds to the process's stdin, stdout and
          stderr.  A stream may be associated with the file descriptor by
          using fdopen().  (This should almost certainly be followed by
          setbuf() to unbuffer the I/O.)

          Closing the file descriptor will typically be detected by the
          process as an EOF.  Once such a process exits, it should be
          waited upon (via wait) in order to free up the kernel process
          slot.  (Some systems allow you to avoid this if you ignore the
          SIGCHLD signal).

          exp_popen is yet another interface, styled after popen().  It
          takes a Bourne shell command line, and returns a stream that
          corresponds to the process's stdin, stdout and stderr.  The
          actual implementation of exp_popen below demonstrates exp_spawnl.

          FILE *
          exp_popen(program)
          char *program;
          {
               FILE *fp;
               int ec;

               if (0 > (ec = exp_spawnl("sh","sh","-c",program,(char *)0)))
                    return(0);
               if (NULL == (fp = fdopen(ec,"r+")) return(0);
               setbuf(fp,(char *)0);
               return(fp);
          }

          After a process is started, the variable exp_pid is set to the
          process-id of the new process.  The variable exp_pty_slave_name
          is set to the name of the slave side of the pty.

          The spawn functions uses a pty to communicate with the process.
          By default, the pty is initialized the same way as the user's tty
          (if possible, i.e., if the environment has a controlling
          terminal.)  This initialization can be skipped by setting
          exp_ttycopy to 0.

          The pty is further initialized to some system wide defaults if
          exp_ttyinit is non-zero.  The default is generally comparable to
          "stty sane".

          The tty setting can be further modified by setting the variable
          exp_stty_init.  This variable is interpreted in the style of stty
          arguments.  For example, exp_stty_init = "sane"; repeats the
          default initialization.

          On some systems, it is possible to redirect console output to
          ptys.  If this is supported, you can force the next spawn to
          obtain the console output by setting the variable exp_console to
          1.

          Between the time a process is started and the new program is
          given control, the spawn functions can clean up the environment
          by closing file descriptors.  By default, the only file
          descriptors closed are ones internal to Expect and any marked
          "close-on-exec".

          If needed, you can close additional file descriptors by creating
          an appropriate function and assigning it to exp_close_in_child.
          The function will be called after the fork and before the exec.
          (This also modifies the behavior of the spawn command in Expect.)

          If you are also using Tcl, it may be convenient to use the
          function exp_close_tcl_files which closes all files between the
          default standard file descriptors and the highest descriptor
          known to Tcl.  (Expect does this.)

          The function exp_child_exec_prelude is the last function called
          prior to the actual exec in the child.  You can redefine this for
          effects such as manipulating the uid or the signals.


-----------------------------------------------------------------------------------------------------------------

::

          extern int exp_autoallocpty;
          extern int exp_pty[2];

          The spawn functions use a pty to communicate with the process.
          By default, a pty is automatically allocated each time a process
          is spawned.  If you want to allocate ptys yourself, before
          calling one of the spawn functions, set exp_autoallocpty to 0,
          exp_pty[0] to the master pty file descriptor and exp_pty[1] to
          the slave pty file descriptor.  The expect library will not do
          any pty initializations (e.g., exp_stty_init will not be used).
          The slave pty file descriptor will be automatically closed when
          the process is spawned.  After the process is started, all
          further communication takes place with the master pty file
          descriptor.

          exp_spawnl and exp_spawnv duplicate the shell's actions in
          searching for an executable file in a list of directories.  The
          directory list is obtained from the environment.


---------------------------------------------------------------------------

::

          While it is possible to use read() to read information from a
          process spawned by exp_spawnl or exp_spawnv, more convenient
          functions are provided.  They are as follows:

          int
          exp_expectl(fd,type1,pattern1,[re1,],value1,type2,...,exp_end);
          int fd;
          enum exp_type type;
          char *pattern1, *pattern2, ...;
          regexp *re1, *re2, ...;
          int value1, value2, ...;

          int
          exp_fexpectl(fp,type1,pattern1,[re1,]value1,type2,...,exp_end);
          FILE *fp;
          enum exp_type type;
          char *pattern1, *pattern2, ...;
          regexp *re1, *re2, ...;
          int value1, value2, ...;

          enum exp_type {
          exp_end,
          exp_glob,
          exp_exact,
          exp_regexp,
          exp_compiled,
          exp_null,
          };

          struct exp_case {
          char *pattern;
          regexp *re;
          enum exp_type type;
          int value;
          };

          int
          exp_expectv(fd,cases);
          int fd;
          struct exp_case *cases;

          int
          exp_fexpectv(fp,cases);
          FILE *fp;
          struct exp_case *cases;

          extern int exp_timeout;
          extern char *exp_match;
          extern char *exp_match_end;
          extern char *exp_buffer;
          extern char *exp_buffer_end;
          extern int exp_match_max;
          extern int exp_full_buffer;
          extern int exp_remove_nulls;

          The functions wait until the output from a process matches one of
          the patterns, a specified time period has passed, or an EOF is
          seen.

          The first argument to each function is either a file descriptor
          or a stream.  Successive sets of arguments describe patterns and
          associated integer values to return when the pattern matches.

          The type argument is one of four values.  exp_end indicates that
          no more patterns appear.  exp_glob indicates that the pattern is
          a glob-style string pattern.  exp_exact indicates that the
          pattern is an exact string.  exp_regexp indicates that the
          pattern is a regexp-style string pattern.  exp_compiled indicates
          that the pattern is a regexp-style string pattern, and that its
          compiled form is also provided.  exp_null indicates that the
          pattern is a null (for debugging purposes, a string pattern must
          also follow).

          If the compiled form is not provided with the functions
          exp_expectl and exp_fexpectl, any pattern compilation done
          internally is thrown away after the function returns.  The
          functions exp_expectv and exp_fexpectv will automatically compile
          patterns and will not throw them away.  Instead, they must be
          discarded by the user, by calling free on each pattern.  It is
          only necessary to discard them, the last time the cases are used.

          Regexp subpatterns matched are stored in the compiled regexp.
          Assuming "re" contains a compiled regexp, the matched string can
          be found in re->startp[0].  The match substrings (according to
          the parentheses) in the original pattern can be found in
          re->startp[1], re->startp[2], and so on, up to re->startp[9].
          The corresponding strings ends are re->endp[x] where x is that
          same index as for the string start.

          The type exp_null matches if a null appears in the input.  The
          variable exp_remove_nulls must be set to 0 to prevent nulls from
          being automatically stripped.  By default, exp_remove_nulls is
          set to 1 and nulls are automatically stripped.

          exp_expectv and exp_fexpectv are useful when the number of
          patterns is not known in advance.  In this case, the sets are
          provided in an array.  The end of the array is denoted by a
          struct exp_case with type exp_end.  For the rest of this
          discussion, these functions will be referred to generically as
          expect.

          If a pattern matches, then the corresponding integer value is
          returned.  Values need not be unique, however they should be
          positive to avoid being mistaken for EXP_EOF, EXP_TIMEOUT, or
          EXP_FULLBUFFER.  Upon EOF or timeout, the value EXP_EOF or
          EXP_TIMEOUT is returned.  The default timeout period is 10
          seconds but may be changed by setting the variable exp_timeout.
          A value of -1 disables a timeout from occurring.  A value of 0
          causes the expect function to return immediately (i.e., poll)
          after one read().  However it must be preceded by a function such
          as select, poll, or an event manager callback to guarantee that
          there is data to be read.

          If the variable exp_full_buffer is 1, then EXP_FULLBUFFER is
          returned if exp_buffer fills with no pattern having matched.

          When the expect function returns, exp_buffer points to the buffer
          of characters that was being considered for matching.
          exp_buffer_end points to one past the last character in
          exp_buffer.  If a match occurred, exp_match points into
          exp_buffer where the match began.  exp_match_end points to one
          character past where the match ended.

          Each time new input arrives, it is compared to each pattern in
          the order they are listed.  Thus, you may test for absence of a
          match by making the last pattern something guaranteed to appear,
          such as a prompt.  In situations where there is no prompt, you
          must check for EXP_TIMEOUT (just like you would if you were
          interacting manually).  More philosophy and strategies on
          specifying expect patterns can be found in the documentation on
          the expect program itself.  See SEE ALSO below.

          Patterns are the usual C-shell-style regular expressions.  For
          example, the following fragment looks for a successful login,
          such as from a telnet dialogue.

               switch (exp_expectl(
                    exp_glob,"connected",CONN,
                    exp_glob,"busy",BUSY,
                    exp_glob,"failed",ABORT,
                    exp_glob,"invalid password",ABORT,
                    exp_end)) {
               case CONN:     /* logged in successfully */
                    break;
               case BUSY:     /* couldn't log in at the moment */
                    break;
               case EXP_TIMEOUT:
               case ABORT:    /* can't log in at any moment! */
                    break;
               default: /* problem with expect */
               }

          Asterisks (as in the example above) are a useful shorthand for
          omitting line-termination characters and other detail.  Patterns
          must match the entire output of the current process (since the
          previous read on the descriptor or stream).  More than 2000 bytes
          of output can force earlier bytes to be "forgotten".  This may be
          changed by setting the variable exp_match_max.  Note that
          excessively large values can slow down the pattern matcher.


-------------------------------------------------------------------------------------------

::

          extern int exp_disconnected;
          int exp_disconnect();

          It is possible to move a process into the background after it has
          begun running.  A typical use for this is to read passwords and
          then go into the background to sleep before using the passwords
          to do real work.

          To move a process into the background, fork, call
          exp_disconnect() in the child process and exit() in the parent
          process.  This disassociates your process from the controlling
          terminal.  If you wish to move a process into the background in a
          different way, you must set the variable exp_disconnected to 1.
          This allows processes spawned after this point to be started
          correctly.


-----------------------------------------------------------------

::

          By default, the expect functions block inside of a read on a
          single file descriptor.  If you want to wait on patterns from
          multiple file descriptors, use select, poll, or an event manager.
          They will tell you what file descriptor is ready to read.

          When a file descriptor is ready to read, you can use the expect
          functions to do one and only read by setting timeout to 0.


-------------------------------------------------------------------

::

          void
          exp_slave_control(fd,enable)
          int fd;
          int enable;

          Pty trapping is normally done automatically by the expect
          functions.  However, if you want to issue an ioctl, for example,
          directly on the slave device, you should temporary disable
          trapping.

          Pty trapping can be controlled with exp_slave_control.  The first
          argument is the file descriptor corresponding to the spawned
          process.  The second argument is a 0 if trapping is to be
          disabled and 1 if it is to be enabled.


-----------------------------------------------------

::

          All functions indicate errors by returning -1 and setting errno.

          Errors that occur after the spawn functions fork (e.g.,
          attempting to spawn a non-existent program) are written to the
          process's stderr, and will be read by the first expect.


-------------------------------------------------------

::

          extern int exp_reading;
          extern jmp_buf exp_readenv;

          expect uses alarm() to timeout, thus if you generate alarms
          during expect, it will timeout prematurely.

          Internally, expect calls read() which can be interrupted by
          signals.  If you define signal handlers, you can choose to
          restart or abort expect's internal read.  The variable,
          exp_reading, is true if (and only if) expect's read has been
          interrupted.  longjmp(exp_readenv,EXP_ABORT) will abort the read.
          longjmp(exp_readenv,EXP_RESTART) will restart the read.


-------------------------------------------------------

::

          extern int exp_loguser;
          extern int exp_logfile_all
          extern FILE *exp_logfile;

          If exp_loguser is nonzero, expect sends any output from the
          spawned process to stdout.  Since interactive programs typically
          echo their input, this usually suffices to show both sides of the
          conversation.  If exp_logfile is also nonzero, this same output
          is written to the stream defined by exp_logfile.  If
          exp_logfile_all is non-zero, exp_logfile is written regardless of
          the value of exp_loguser.


-----------------------------------------------------------

::

          While I consider the library to be easy to use, I think that the
          standalone expect program is much, much, easier to use than
          working with the C compiler and its usual edit, compile, debug
          cycle.  Unlike typical C programs, most of the debugging isn't
          getting the C compiler to accept your programs - rather, it is
          getting the dialogue correct.  Also, translating scripts from
          expect to C is usually not necessary.  For example, the speed of
          interactive dialogues is virtually never an issue.  So please try
          the standalone 'expect' program first.  I suspect it is a more
          appropriate solution for most people than the library.

          Nonetheless, if you feel compelled to debug in C, here are some
          tools to help you.

          extern int exp_is_debugging;
          extern FILE *exp_debugfile;

          While expect dialogues seem very intuitive, trying to codify them
          in a program can reveal many surprises in a program's interface.
          Therefore a variety of debugging aids are available.  They are
          controlled by the above variables, all 0 by default.

          Debugging information internal to expect is sent to stderr when
          exp_is_debugging is non-zero.  The debugging information includes
          every character received, and every attempt made to match the
          current input against the patterns.  In addition, non-printable
          characters are translated to a printable form.  For example, a
          control-C appears as a caret followed by a C.  If exp_logfile is
          non-zero, this information is also written to that stream.

          If exp_debugfile is non-zero, all normal and debugging
          information is written to that stream, regardless of the value of
          exp_is_debugging.


-------------------------------------------------------

::

          The stream versions of the expect functions are much slower than
          the file descriptor versions because there is no way to portably
          read an unknown number of bytes without the potential of timing
          out.  Thus, characters are read one at a time.  You are therefore
          strongly encouraged to use the file descriptor versions of expect
          (although, automated versions of interactive programs don't
          usually demand high speed anyway).

          You can actually get the best of both worlds, writing with the
          usual stream functions and reading with the file descriptor
          versions of expect as long as you don't attempt to intermix other
          stream input functions (e.g., fgetc).  To do this, pass
          fileno(stream) as the file descriptor each time.  Fortunately,
          there is little reason to use anything but the expect functions
          when reading from interactive programs.

          There is no matching exp_pclose to exp_popen (unlike popen and
          pclose).  It only takes two functions to close down a connection
          (fclose() followed by waiting on the pid), but it is not uncommon
          to separate these two actions by large time intervals, so the
          function seems of little value.

          If you are running on a Cray running Unicos (all I know for sure
          from experience), you must run your compiled program as root or
          setuid.  The problem is that the Cray only allows root processes
          to open ptys.  You should observe as much precautions as
          possible:  If you don't need permissions, setuid(0) only
          immediately before calling one of the spawn functions and
          immediately set it back afterwards.

          Normally, spawn takes little time to execute.  If you notice
          spawn taking a significant amount of time, it is probably
          encountering ptys that are wedged.  A number of tests are run on
          ptys to avoid entanglements with errant processes.  (These take
          10 seconds per wedged pty.)  Running expect with the -d option
          will show if expect is encountering many ptys in odd states.  If
          you cannot kill the processes to which these ptys are attached,
          your only recourse may be to reboot.


-------------------------------------------------

::

          The exp_fexpect functions don't work at all under HP-UX - it
          appears to be a bug in getc.  Follow the advice (above) about
          using the exp_expect functions (which doesn't need to call getc).
          If you fix the problem (before I do - please check the latest
          release) let me know.


---------------------------------------------------------

::

          An alternative to this library is the expect program.  expect
          interprets scripts written in a high-level language which direct
          the dialogue.  In addition, the user can take control and
          interact directly when desired.  If it is not absolutely
          necessary to write your own C program, it is much easier to use
          expect to perform the entire interaction.  It is described
          further in the following references:

          "expect: Curing Those Uncontrollable Fits of Interactivity" by
          Don Libes, Proceedings of the Summer 1990 USENIX Conference,
          Anaheim, California, June 11-15, 1990.

          "Using expect to Automate System Administration Tasks" by Don
          Libes, Proceedings of the 1990 USENIX Large Installation Systems
          Administration Conference, Colorado Springs, Colorado, October
          17-19, 1990.

          expect(1), alarm(3), read(2), write(2), fdopen(3), execve(2),
          execvp(3), longjmp(3), pty(4).

          There are several examples C programs in the test directory of
          expect's source distribution which use the expect library.


-----------------------------------------------------

::

          Don Libes, libes@nist.gov, National Institute of Standards and
          Technology


-------------------------------------------------------------------------

::

          Thanks to John Ousterhout (UCBerkeley) for supplying the pattern
          matcher.

          Design and implementation of the expect library was paid for by
          the U.S. government and is therefore in the public domain.
          However the author and NIST would like credit if this program and
          documentation or portions of them are used.

COLOPHON
---------------------------------------------------------

::

          This page is part of the expect (programmed dialogue with
          interactive programs) project.  Information about the project can
          be found at ⟨https://core.tcl.tk/expect/index⟩.  If you have a
          bug report for this manual page, see
          ⟨https://sourceforge.net/p/expect/bugs/⟩.  This page was obtained
          from the tarball expect5.45.3.tar.gz fetched from
          ⟨http://sourceforge.net/projects/expect/files/Expect/⟩ on
          2021-08-27.  If you discover any rendering problems in this HTML
          version of the page, or you believe there is a better or more up-
          to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

                               12 December 1991                LIBEXPECT(3)

--------------

Pages that refer to this page: `expect(1) <../man1/expect.1.html>`__

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
