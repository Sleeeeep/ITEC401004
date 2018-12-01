
(cl:in-package :asdf)

(defsystem "jw-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "projectMsg" :depends-on ("_package_projectMsg"))
    (:file "_package_projectMsg" :depends-on ("_package"))
  ))