#-quicklisp
(let ((quicklisp-init
       (merge-pathnames "quicklisp/setup.lisp"
                        (user-homedir-pathname))))
  (when (probe-file quicklisp-init)
    (load quicklisp-init)))
(ql:quickload :slynk)
(save-lisp-and-die "sbcl.core")
