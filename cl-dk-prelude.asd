(in-package :asdf-user)

(defsystem :cl-dk-prelude 
  :description "My common lisp prelude for private projects."
  :author "David Krentzlin <david.krentzlin@gmail.com>"
  :maintainer "David Krentzlin <david.krentzlin@gmail.com>"
  :source-control (:git "https://github.com/certainty/cl-dk-prelude.git")
  :license "BSD"
  :version "1.0"
  :depends-on
  (
    :uiop
    :cl-reexport ;; for us
    :alexandria
    :serapeum

    ;; functional programming
    :fset
    :modf
    :trivia
    :trivial-arguments
    :trivial-package-local-nicknames
    :trivial-types

    ;; convenient constructs
    :access
    :metabang-bind
    :trivial-do

    ;; nicer syntax
    :arrow-macros
    :pythonic-string-reader

    ;; object orientation
    :closer-mop

    ;; bread and butter librries
    :str
    :local-time
    :cl-ppcre)
  :serial t
  :components
  ((:file "packages")))
