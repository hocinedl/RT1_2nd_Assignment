
(cl:in-package :asdf)

(defsystem "assignmentPackage-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "my_service" :depends-on ("_package_my_service"))
    (:file "_package_my_service" :depends-on ("_package"))
  ))