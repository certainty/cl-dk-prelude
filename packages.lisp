(in-package :cl-user)

(defpackage :cl-dk-prelude
  (:use :cl)
  (:local-nicknames
    (:/os :uiop/os)
    (:os :uiop/os)
    (:time :local-time)
    (:a :alexandria)
    (:s :serapeum)
    (:time :local-time))
  (:export #:--> #:^))

(in-package :cl-dk-prelude)

(cl-reexport:reexport-from :pythonic-string-reader
                           :include
                           '(:enable-pythonic-string-syntax
                             :disable-pythonic-string-syntax))

(cl-reexport:reexport-from :trivia
  :include
  '(:match
     :guard))

(cl-reexport:reexport-from :metabang-bind
  :include
  '(:bind))

(cl-reexport:reexport-from :access
                           :include '(:access
                                      :accesses))

(cl-reexport:reexport-from :arrow-macros
                           ;XXX: they would need docstrings.
                           :include '(:->
                                       :->>))

(cl-reexport:reexport-from :trivial-do
                           :include
                           '(:doalist ;; key value alist
                             :dohash  ;; key value ht
                             :dolist* ;; position value list
                             ))

(cl-reexport:reexport-from :alexandria
  :include
  '(:mean :variance :median
     :clamp
     :hash-table-keys
     :hash-table-values
     :hash-table-alist
     :ensure-gethash
     :if-let
     :when-let
     :when-let*))

(cl-reexport:reexport-from :serapeum
  :include
  '(:ignoring
     :ecase-of
     :etypecase-of
     :ctypecase-of
     :typecase-of
     :case-of
     :ccase-of
     :dict
     :dict*
     :partition
     :partitions
     :batches
     :iota))

(cl-reexport:reexport-from :trivial-types
  :include
  '(
     :association-list
     :association-list-p
     :property-list
     :property-list-p
     :character-designator
     :list-designator
     :stream-designator
     :function-designator
     :pathname-designator
     :non-nil
     ))

;; stolen from CIEL

(deftype --> (args values)
  "The type of a function from ARGS to VALUES.

  From SERAPEUM (where it is -> and thus conflicts with our -> arrow-macro)."
  `(function ,args ,values))

(defmacro --> (function args values)
  "Declaim the ftype of FUNCTION from ARGS to VALUES.

     (--> mod-fixnum+ (fixnum fixnum) fixnum)
     (defun mod-fixnum+ (x y) ...)

  In pure CL, it would be:

  (declaim (ftype (function (fixnum fixnum) fixnum) mod-fixnum+))
  (defun mod-fixnum+ (x y) ...)

  From SERAPEUM (where it is -> and thus conflicts with our -> arrow-macro)."
  `(declaim (ftype (--> ,args ,values) ,function)))


(defmacro ^ (&rest forms)
  "^ is a synonym macro for lambda.

(^ (x) (+ x 10))
=>
(lambda (x) (+ x 10))"
  `(lambda ,@forms))





