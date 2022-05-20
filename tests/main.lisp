(defpackage cl-webpage-demo/tests/main
  (:use :cl
        :cl-webpage-demo)
  (:local-nicknames (:rv :rove)
(in-package :cl-webpage-demo/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-webpage-demo)' in your Lisp.

(rv:deftest test-target-1
  (rv:testing "should (= 1 1) to be true"
    (rv:ok (= 1 1))))
