;; Auto-generated. Do not edit!


(when (boundp 'rosOpenCV::RectMsg)
  (if (not (find-package "ROSOPENCV"))
    (make-package "ROSOPENCV"))
  (shadow 'RectMsg (find-package "ROSOPENCV")))
(unless (find-package "ROSOPENCV::RECTMSG")
  (make-package "ROSOPENCV::RECTMSG"))

(in-package "ROS")
;;//! \htmlinclude RectMsg.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass rosOpenCV::RectMsg
  :super ros::object
  :slots (_header _name _center_x _center_y _rect_height _rect_width ))

(defmethod rosOpenCV::RectMsg
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:name __name) "")
    ((:center_x __center_x) 0)
    ((:center_y __center_y) 0)
    ((:rect_height __rect_height) 0)
    ((:rect_width __rect_width) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _name (string __name))
   (setq _center_x (round __center_x))
   (setq _center_y (round __center_y))
   (setq _rect_height (round __rect_height))
   (setq _rect_width (round __rect_width))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:center_x
   (&optional __center_x)
   (if __center_x (setq _center_x __center_x)) _center_x)
  (:center_y
   (&optional __center_y)
   (if __center_y (setq _center_y __center_y)) _center_y)
  (:rect_height
   (&optional __rect_height)
   (if __rect_height (setq _rect_height __rect_height)) _rect_height)
  (:rect_width
   (&optional __rect_width)
   (if __rect_width (setq _rect_width __rect_width)) _rect_width)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string _name
    4 (length _name)
    ;; int32 _center_x
    4
    ;; int32 _center_y
    4
    ;; int32 _rect_height
    4
    ;; int32 _rect_width
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; int32 _center_x
       (write-long _center_x s)
     ;; int32 _center_y
       (write-long _center_y s)
     ;; int32 _rect_height
       (write-long _rect_height s)
     ;; int32 _rect_width
       (write-long _rect_width s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _center_x
     (setq _center_x (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _center_y
     (setq _center_y (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _rect_height
     (setq _rect_height (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _rect_width
     (setq _rect_width (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get rosOpenCV::RectMsg :md5sum-) "340722c7307f39cbed1c17778a461379")
(setf (get rosOpenCV::RectMsg :datatype-) "rosOpenCV/RectMsg")
(setf (get rosOpenCV::RectMsg :definition-)
      "std_msgs/Header header
string name
int32 center_x
int32 center_y
int32 rect_height
int32 rect_width



================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :rosOpenCV/RectMsg "340722c7307f39cbed1c17778a461379")


