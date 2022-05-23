(defpackage cl-webpage-demo
  (:use :cl)
  (:local-nicknames (:p :ps)
                    (:l :lass)
                    (:s :spinneret)
                    (:h :hunchentoot)
                    (:fp :find-port))
  (:export :main
           :start-server
           :stop-server))
(in-package :cl-webpage-demo)

;;   =============================================
;;  == Your app's code to be executed by %main ==
;; =============================================

(defun hello (name)
  (format nil "This is the start of something great, ~a!" name))

(defvar *greeting*
  (hello "Sam Johnson (she/her)"))



;; Server
(defvar *server*
  (make-instance 'h:easy-acceptor :port (fp:find-port :interface "127.0.0.1"))
  "The server instance")

(defun start-server ()
  "Start the web server"
  (log:info "Starting web server...")
  (h:start *server*)
  (log:info "Web server started.")
  (server-port))

(defun stop-server ()
  "Stop the web server"
  (log:info "Stopping web server...")
  (h:stop *server*)
  (log:info "Web server stopped."))

(defun server-port ()
  "Get the port"
  (h:acceptor-port *server*))



;; Routing
(h:define-easy-handler (index :uri "/") ()
  (setf (h:content-type*) "text/html")
  (home-page))



;; HTML
(defmacro with-page ((&key title) &body body)
  `(s:with-html-string
     (:doctype)
     (:html
       (:head
        (:title ,title))
       (:body ,@body))))

(defun home-page ()
  (with-page (:title "My second website")
    (:header
     (:h1 *greeting*)
     (:style *stylesheet*))))



;; CSS
(defparameter *stylesheet*
  (l:compile-and-write
       '(body :background-color "#FCD9D9")))


;;   ============================
;;  == Main and CLI Functions ==
;; ============================

(defun help ()
  (format t "~&Usage:

  cl-webpage-demo [name]~&"))

(defun %main (argv)
  "Parse CLI args."
  (when (member "-h" argv :test #'equal)
    (help)
    (uiop:quit))
  (start-server))

(defun main ()
  "Entry point for the executable.
  Reads command line arguments."
  ;; uiop:command-line-arguments returns a list of arguments (sans the script name).
  ;; We defer the work of parsing to %main because we call it also from the Roswell script.
  (%main (uiop:command-line-arguments)))
