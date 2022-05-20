(defpackage cl-webpage-demo
  (:use :cl)
  (:export :main))
(in-package :cl-webpage-demo)

(defun hello (name)
  (format t "This is the start of something great, ~a!~%" name))

(defun help ()
  (format t "~&Usage:

  cl-webpage-demo [name]~&"))

(defun %main (argv)
  "Parse CLI args."
  (when (member "-h" argv :test #'equal)
    (help)
    (uiop:quit))
  (hello "Sam Johnson (she/her)"))

(defun main ()
  "Entry point for the executable.
  Reads command line arguments."
  ;; uiop:command-line-arguments returns a list of arguments (sans the script name).
  ;; We defer the work of parsing to %main because we call it also from the Roswell script.
  (%main (uiop:command-line-arguments)))
