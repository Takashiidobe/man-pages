.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stapref(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `LANGUAGE <#LANGUAGE>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STAPREF(1)               General Commands Manual              STAPREF(1)

NAME
-------------------------------------------------

::

          stapref - systemtap language reference


---------------------------------------------------------

::

          stapref


---------------------------------------------------------------

::

          The reference for the systemtap scripting language.


---------------------------------------------------------

::

          Keywords
                 • break
                 • continue
                 • delete
                 • else
                 • exit
                 • foreach
                 • for
                 • function
                 • global
                 • private
                 • if
                 • in
                 • next
                 • probe
                 • return
                 • try/catch
                 • while

          Data Types and Operators
                 Integers
                 • var1 = 5
                 • global var2 = 10

                 Strings
                 • var1 = "string1"
                 • global var2 = "string2"

                 Associative Arrays
                 • global array1[]
                 • global array2[SIZE]
                 • array[index] = 5

                 Context Variables
                 • $var
                 • $var$  (pretty printed string form)

                 Binary numeric operators
                 • * / % + - << >> >>> & ^ | && ||

                 Binary string operators
                 • . (string concatenation)

                 Numeric assignment operators
                 • = += -= *= /= %= >>= <<= &= ^= |=

                 String assignment operators
                 • = .=

                 Unary numeric operators
                 • + - ! ~ ++ --

                 Numeric & string comparison operators
                 • < > <= >= == !=

                 Regular expression matching operators
                 • =~ !~

                 Ternary operator
                 • cond ? exp1 : exp2

                 Grouping operator
                 • ( expression )

                 Array operators
                 • array[index] (array read/write)
                 • [index] in array

                 Aggregation operator
                 • var <<< value

          Statements
                 Jump Statements
                 • continue
                 • break
                 • next  (early return from a probe)
                 • return expression (from a function)
                 • try statement catch (message) statement

                 Selection Statements
                 • if (expression) statement
                 • else statement

                 Iteration Statements
                 • foreach (variable in array) statement
                 • foreach ([var1,var2,...] in array) statement
                 • for (expression; expression; expression) statement
                 • while (expression) statement

                 Declaration Statements
                 • function name (variable : type, ...) { statement }
                 • function name : type (variable : type, ...) { statement }
                 • function name : type (variable : type, ...) %{ c_statement %}
                 • probe probepoint { statement }
                 • probe label = probepoint { statement }

          Lexical Structure
                 Comments
                 • # ... comment
                 • // ... comment
                 • /* ... comment ... */

                 Preprocessor
                 • %( expression %? true_tokens %: false_tokens %)
                 • @define label (variable, ...) %{ statement %}

          Builtin Functions
                 Aggregation Builtin Functions
                 • @avg (variable)
                 • @count (variable)
                 • @hist_linear (variable, N, N, N)
                 • @hist_log (variable)
                 • @max (variable)
                 • @min (variable)
                 • @sum (variable)

                 Output Builtin Functions
                 • print (variable)
                 • printf (format:string, variable, ...)
                   where format is of the form: %[flags][width][.precision][length]specifier
                 • printd (delimiter:string, variable, ...)
                 • printdln (delimiter:string, variable, ...)
                 • println ()
                 • sprint:string (variable)
                 • sprintf:string (format:string, variable, ...)

                 Variable Access Builtin Functions
                 • @var ("varname[@src/FILE.c]"[, "module"]) (static or global)
                 • @cast (variable, "type_name"[, "module"])
                 • @defined (variable)
                 • @probewrite (variable)

          Probepoints
                 Some of the more commonly used probepoints
                 • kernel.function(PATTERN) kernel.function(PATTERN).call
                 • kernel.function(PATTERN).return
                 • kernel.FUNCTION (PATTERN).return.maxactive(VALUE)
                 • kernel.FUNCTION (PATTERN).inline
                 • kernel.FUNCTION (PATTERN).label(LPATTERN)
                 • module(MPATTERN).FUNCTION (PATTERN)
                 • module(MPATTERN).FUNCTION (PATTERN).call
                 • module(MPATTERN).FUNCTION (PATTERN).return.maxactive(VALUE)
                 • module(MPATTERN).FUNCTION (PATTERN).inline
                 • kernel.statement(PATTERN)
                 • kernel.statement(ADDRESS).absolute
                 • module(MPATTERN).statement(PATTERN)
                 • kprobe.FUNCTION (FUNCTION)
                 • kprobe.FUNCTION (FUNCTION).return
                 • kprobe.module(NAME).FUNCTION (FUNCTION)
                 • kprobe.module(NAME).FUNCTION (FUNCTION).return
                 • kprobe.statement(ADDRESS).absolute
                 • process.begin process("PATH").begin
                 • process(PID).begin process.thread.begin
                 • process("PATH").thread.begin
                 • process(PID).thread.begin
                 • process.end
                 • process("PATH").end
                 • process(PID).end
                 • process.thread.end
                 • process("PATH").thread.end
                 • process(PID).thread.end
                 • process("PATH").syscall
                 • process(PID).syscall
                 • process.syscall.return
                 • process("PATH").syscall.return
                 • process(PID).syscall.return
                 • process("PATH").FUNCTION ("NAME")
                 • process("PATH").statement("*@FILE.c:123")
                 • process("PATH").FUNCTION ("*").return
                 • process("PATH").FUNCTION ("myfun").label("foo")
                 • process("PATH").mark("LABEL")
                 • java("PNAME").class("CLASSNAME").method("PATTERN")
                 • java("PNAME").class("CLASSNAME").method("PATTERN").return
                 • java(PID).class("CLASSNAME").method("PATTERN")
                 • java(PID).class("CLASSNAME").method("PATTERN").return
                 • python2.module("MODULENAME").function("PATTERN")
                 • python2.module("MODULENAME").function("PATTERN").return
                 • python3.module("MODULENAME").function("PATTERN")
                 • python3.module("MODULENAME").function("PATTERN").return

          Tapset Functions
                 Some of the more commonly used tapset functions
                 • addr:long ()
                 • backtrace:string ()
                 • caller:string ()
                 • caller_addr:long ()
                 • cmdline_arg:string (N:long)
                 • cmdline_args:string (N:long,m:long,delim:string)
                 • cmdline_str:string ()
                 • env_var:string (name:string)
                 • execname:string ()
                 • int_arg:long (N:long)
                 • isinstr:long(s1:string,s2:string)
                 • long_arg:long (N:long)
                 • modname:string ()
                 • module_name:string ()
                 • pid:long ()
                 • pn:string ()
                 • pointer_arg:string (N:long)
                 • pp:string ()
                 • print_backtrace ()
                 • probefunc:string ()
                 • register:long(name:string)
                 • str_replace:string(prnt_str:string,srch_str:string,rplc_str:string)
                 • stringat:long(str:string,pos:long)
                 • strlen:long(str:string)
                 • strtol:long(str:string,base:long)
                 • substr:string(str:string,start:long,length:long)
                 • user_long:long(addr:long)
                 • user_string:string(addr:long)


---------------------------------------------------------

::

          stap(1)


-------------------------------------------------

::

          Use the Bugzilla link of the project web page or our mailing
          list.
          http://sourceware.org/systemtap/ ,<systemtap@sourceware.org>.

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemtap (a tracing and live-system
          analysis tool) project.  Information about the project can be
          found at ⟨https://sourceware.org/systemtap/⟩.  If you have a bug
          report for this manual page, send it to systemtap@sourceware.org.
          This page was obtained from the project's upstream Git repository
          ⟨git://sourceware.org/git/systemtap.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-26.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

                                                                 STAPREF(1)

--------------

Pages that refer to this page: `stap(1) <../man1/stap.1.html>`__

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
