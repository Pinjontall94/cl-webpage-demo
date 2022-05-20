(defsystem "cl-webpage-demo"
  :version "0.1.0"
  :author "Sam Johnson (she/her)"
  :license "AGPLv3 or later"
  :depends-on ("spinneret"
               "parenscript"
               "lass"
               "clack")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description "Jumping off point for a basic web page in Common Lisp"
  :in-order-to ((test-op (test-op "cl-webpage-demo/tests")))
  ;; Build a binary:
  ;; don't change this line.
  :build-operation "program-op"
  ;; binary name: adapt.
  :build-pathname "cl-webpage-demo"
  ;; entry point: here "main" is an exported symbol. Otherwise, use a double ::
  :entry-point "cl-webpage-demo:main")


(defsystem "cl-webpage-demo/tests"
  :author "Sam Johnson (she/her)"
  :license "AGPLv3 or later"
  :depends-on ("cl-webpage-demo"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for cl-webpage-demo"
  :perform (test-op (op c) (symbol-call :rove :run c)))
