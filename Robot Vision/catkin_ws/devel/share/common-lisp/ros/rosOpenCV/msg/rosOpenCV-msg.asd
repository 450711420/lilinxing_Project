
(cl:in-package :asdf)

(defsystem "rosOpenCV-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "RectMsg" :depends-on ("_package_RectMsg"))
    (:file "_package_RectMsg" :depends-on ("_package"))
  ))